namespace Goldensoft.OpenApi.WeChat.Responses.Pay
{
    /// <summary>
    /// 统一下单返回信息
    /// </summary>
    public class UnifiedOrderResponse : PayResponseBase
    {
        #region Properties

        /// <summary>
        /// 设备号
        /// </summary>
        public string DeviceInfo { get => base["device_info"]; set => base["device_info"] = value; }

        /// <summary>
        /// 交易类型(JSAPI--JSAPI支付,NATIVE--Native支付,APP--APP支付)
        /// </summary>
        public string TradeType { get => base["trade_type"]; set => base["trade_type"] = value; }

        /// <summary>
        /// 预支付交易会话标识(微信生成的预支付会话标识，用于后续接口调用中使用，该值有效期为2小时)
        /// </summary>
        public string PrepayId { get => base["prepay_id"]; set => base["prepay_id"] = value; }

        /// <summary>
        /// 二维码链接(TradeType=NATIVE时有返回，此url用于生成支付二维码，然后提供给用户进行扫码支付。)
        /// </summary>
        public string CodeUrl { get => base["code_url"]; set => base["code_url"] = value; }

        #endregion
    }
}
