using System;
using System.Collections.Generic;
using System.Text;

namespace Goldensoft.OpenApi.WeChat.Responses.JsSdk
{
    /// <summary>
    /// js临时票据信息
    /// </summary>
    public class TicketResponse
    {
        /// <summary>
        /// 公众号唯一标识
        /// </summary>
        public string AppId { get; set; }

        /// <summary>
        /// 签名
        /// </summary>
        public string Signature { get; set; }

        /// <summary>
        /// 生成签名的时间戳
        /// </summary>
        public long Timestamp { get; set; }

        /// <summary>
        /// 签名随机串
        /// </summary>
        public string NonceValue { get; set; }

        public string Ticker { get; set; }

        public string Url { get; set; }

        public string AccessToken { get; set; }

        public string OpenId { get; set; }

        public string ExchangeCode { get; set; }
    }
}
