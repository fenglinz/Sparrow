using System;
using System.Collections.Generic;
using System.Text;

namespace Goldensoft.Libraries.Wrapper.RabbitMQ
{
    /// <summary>
    /// 交换机类型
    /// </summary>
    public enum ExchangeType
    {
        /// <summary>
        /// 严格匹配
        /// </summary>
        Direct,

        /// <summary>
        /// 正则匹配
        /// </summary>
        Topic,

        /// <summary>
        /// 广播模式
        /// </summary>
        Fanout,

        /// <summary>
        /// 消息头匹配
        /// </summary>
        Headers
    }
}
