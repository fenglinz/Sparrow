using System;
using System.Collections.Generic;
using System.Text;

namespace Mercurius.Prime.Core.Configuration
{
    /// <summary>
    /// rabbit mq配置信息
    /// </summary>
    public class RabbitMQOption
    {
        #region Properties

        /// <summary>
        /// 队列主机名
        /// </summary>
        public string HostName { get; set; }

        /// <summary>
        /// 虚拟主机
        /// </summary>
        public string VirtualHost { get; set; } = "/";

        /// <summary>
        /// 队列服务账户
        /// </summary>
        public string UserName { get; set; }

        /// <summary>
        /// 队列服务密码
        /// </summary>
        public string Password { get; set; }

        /// <summary>
        /// 队列服务端口号
        /// </summary>
        public int Port { get; set; } = 5672;

        #endregion
    }
}
