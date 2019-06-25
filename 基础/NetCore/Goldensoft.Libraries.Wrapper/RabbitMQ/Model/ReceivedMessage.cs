using System;
using System.Collections.Generic;
using System.Text;
using RabbitMQ.Client;

namespace Goldensoft.Libraries.Wrapper.RabbitMQ
{
    /// <summary>
    /// 接收到的消息数据
    /// </summary>
    public class ReceivedMessage
    {
        #region Properties

        /// <summary>
        /// 消息头信息
        /// </summary>
        public IBasicProperties BasicProperties { get; set; }

        /// <summary>
        /// 消息内容
        /// </summary>
        public string MessageBody { get; set; }
        
        /// <summary>
        /// 使用者标签
        /// </summary>
        public string ConsumerTag { get; set; }
        
        /// <summary>
        /// 消息传递标记(用于消息应答)
        /// </summary>
        public ulong DeliveryTag { get; set; }

        /// <summary>
        /// 交换机名称
        /// </summary>
        public string Exchange { get; set; }
        
        /// <summary>
        /// amqp交还标识
        /// </summary>
        public bool Redelivered { get; set; }

        /// <summary>
        /// 发布消息的路由键
        /// </summary>
        public string RoutingKey { get; set; }

        #endregion
    }
}
