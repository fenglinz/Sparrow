using System;
using System.Collections.Generic;
using System.Text;
using Mercurius.Prime.Core.Configuration;
using RabbitMQ.Client;
using RabbitMQ.Client.Events;

namespace Goldensoft.Libraries.Wrapper.RabbitMQ
{
    /// <summary>
    /// rabbit mq消息订阅者
    /// </summary>
    public class Subscriber : IDisposable
    {
        #region Fields

        private static readonly ConnectionFactory factory;
        private IConnection connection;
        private IModel channel;

        private EventingBasicConsumer consumer;

        #endregion

        #region Properties

        /// <summary>
        /// 交换机
        /// </summary>
        public string Exchange { get; set; }

        /// <summary>
        /// 交换机类型
        /// </summary>
        public ExchangeType ExchangeType { get; set; } = ExchangeType.Topic;

        /// <summary>
        /// 队列
        /// </summary>
        public string Queue { get; set; }

        /// <summary>
        /// 路由关键字
        /// </summary>
        public string RouteKey { get; set; }

        /// <summary>
        /// 参数
        /// </summary>
        public IDictionary<string, object> Arguments { get; set; }

        /// <summary>
        /// 消息并发处理量
        /// </summary>
        public ushort PrefetchCount { get; set; } = 1;

        /// <summary>
        /// 接收到消息的事件
        /// </summary>
        public EventHandler<ReceivedMessage> ReceivedMessage { get; set; }

        #endregion

        #region Constructor

        /// <summary>
        /// 构造方法
        /// </summary>
        static Subscriber()
        {
            var option = PlatformSection.Instance.RabbitMQ;

            factory = new ConnectionFactory
            {
                HostName = option.HostName,
                VirtualHost = option.VirtualHost,
                UserName = option.UserName,
                Password = option.Password,
                Port = option.Port
            };
        }

        #endregion

        #region Public Methods

        /// <summary>
        /// 订阅消息
        /// </summary>
        /// <param name="exchange">交换机名称</param>
        /// <param name="queue">队列名称</param>
        /// <param name="routeKey">路由键</param>
        /// <param name="arguments">参数</param>
        public void StartSubscribe()
        {
            if (this.connection != null)
            {
                throw new Exception("已经开始订阅，不支持重复订阅！");
            }

            this.connection = factory.CreateConnection();
            this.channel = connection.CreateModel();

            this.channel.ExchangeDeclare(this.Exchange, this.ExchangeType.ToString().ToLower(), durable: true, autoDelete: false, arguments: null);
            this.channel.QueueDeclare(this.Queue, durable: true, autoDelete: false, exclusive: false, arguments: null);

            this.channel.BasicQos(0, this.PrefetchCount, global: false);
            this.channel.QueueBind(this.Queue, this.Exchange, this.RouteKey, this.Arguments);

            this.consumer = new EventingBasicConsumer(channel);
            this.consumer.Received += (sender, response) =>
            {
                try
                {
                    if (this.ReceivedMessage != null)
                    {
                        var message = Encoding.UTF8.GetString(response.Body);

                        this.ReceivedMessage.Invoke(sender, new ReceivedMessage
                        {
                            BasicProperties = response.BasicProperties,
                            ConsumerTag = response.ConsumerTag,
                            DeliveryTag = response.DeliveryTag,
                            Exchange = response.Exchange,
                            Redelivered = response.Redelivered,
                            RoutingKey = response.RoutingKey,
                            MessageBody = message
                        });

                        this.channel.BasicAck(response.DeliveryTag, false);
                    }
                }
                catch (Exception exp)
                {

                }
            };

            this.channel.BasicConsume(this.Queue, false, consumer);
        }

        #endregion

        #region IDisposable Interface Implements

        /// <summary>
        /// 资源释放
        /// </summary>
        public void Dispose()
        {
            this.connection?.Dispose();
            this.channel?.Dispose();
        }

        #endregion
    }
}
