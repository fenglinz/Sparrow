using Newtonsoft.Json;

namespace Goldensoft.OpenApi.WeChat.Requests.Pay
{
    /// <summary>
    /// 微信内支付请求信息
    /// </summary>
    public class BrandWCPayRequest : PayRequestBase
    {
        #region Properties

        /// <summary>
        /// 是否重新支付成功
        /// </summary>
        public bool IsRePaySuccess { get; set; }

        /// <summary>
        /// 消息
        /// </summary>
        public string ErrorMessage { get; set; }

        /// <summary>
        /// 微信分配的公众账号ID(企业号corpid即为此appId)
        /// </summary>
        [JsonProperty("appId")]
        public override string AppId { get => this["appId"]; set => this["appId"] = value; }

        /// <summary>
        /// 时间戳
        /// </summary>
        [JsonProperty("timeStamp")]
        public string TimeStamp { get => base["timeStamp"]; set => base["timeStamp"] = value; }

        /// <summary>
        /// 随机字符串
        /// </summary>
        [JsonProperty("nonceStr")]
        public override string NonceString { get => this["nonceStr"]; set => this["nonceStr"] = value; }

        /// <summary>
        /// 订单详情扩展字符串	
        /// </summary>
        [JsonProperty("package")]
        public string Package { get => base["package"]; set => base["package"] = value; }

        /// <summary>
        /// 签名类型(目前支持HMAC-SHA256和MD5，默认为MD5)
        /// </summary>
        [JsonProperty("signType")]
        public override string SignType { get => this["signType"]; set => this["signType"] = value; }

        /// <summary>
        /// 支付签名
        /// </summary>
        [JsonProperty("paySign")]
        public string PaySign { get => base["paySign"]; set => base["paySign"] = value; }

        #endregion
    }
}
