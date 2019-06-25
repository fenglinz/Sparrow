using System;
using System.Collections.Generic;
using System.Text;
using Mercurius.Prime.Core.Configuration;
using RabbitMQ.Client;

namespace Goldensoft.Libraries.Wrapper.RabbitMQ
{
    /// <summary>
    /// rabbit mq消息发送者
    /// </summary>
    public class Publisher
    {
        #region Fields

        private static readonly ConnectionFactory factory;

        #endregion

        #region Constructor

        /// <summary>
        /// 构造方法
        /// </summary>
        static Publisher()
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

        /// <summary>
        /// 发布消息
        /// </summary>
        /// <param name="exchange">交换机名称</param>
        /// <param name="queue">队列名称</param>
        /// <param name="routeKey">路由名称</param>
        /// <param name="message">消息</param>
        /// <param name="type">交换机类型</param>
        /// <param name="arguments">参数</param>
        public static void Publish(
            string exchange, string queue, string routeKey, string message,
            ExchangeType type = ExchangeType.Topic, IDictionary<string, object> arguments = null)
        {
            try
            {
                using (var connection = factory.CreateConnection())
                {
                    using (var channel = connection.CreateModel())
                    {
                        channel.ExchangeDeclare(exchange, type.ToString().ToLower(), durable: true, autoDelete: false, arguments: null);
                        channel.QueueDeclare(queue, durable: true, autoDelete: false, exclusive: false, arguments: null);

                        channel.QueueBind(queue, exchange, routeKey, arguments);
                        channel.BasicPublish(exchange, routeKey, null, Encoding.UTF8.GetBytes(message));
                    }
                }
            }
            catch (Exception exp)
            {
            }
        }
    }
}
