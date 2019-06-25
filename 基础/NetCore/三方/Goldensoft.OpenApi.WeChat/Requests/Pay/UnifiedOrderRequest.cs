using Mercurius.Prime.Core;

namespace Goldensoft.OpenApi.WeChat.Requests.Pay
{
    /// <summary>
    /// 统一下单请求数据
    /// </summary>
    public class UnifiedOrderRequest : PayRequestBase
    {
        #region Properties

        /// <summary>
        /// 商户号(微信支付分配的商户号)
        /// </summary>
        public string MerchantId { get => this["mch_id"]; set => this["mch_id"] = value; }

        /// <summary>
        /// 签名
        /// </summary>
        public string Sign { get => this["sign"]; set => this["sign"] = value; }

        /// <summary>
        /// 设备号
        /// </summary>
        public string DeviceInfo { get => base["device_info"]; set => base["device_info"] = value; }

        /// <summary>
        /// 商品描述信息
        /// </summary>
        public string Body { get => base["body"]; set => base["body"] = value; }

        /// <summary>
        /// 商品详细描述
        /// </summary>
        public string Detail { get => base["detail"]; set => base["detail"] = value; }

        /// <summary>
        /// 附加数据
        /// </summary>
        public string Attach { get => base["attach"]; set => base["attach"] = value; }

        /// <summary>
        /// 标价币种(默认CNY)
        /// </summary>
        public string FeeType { get => base["fee_type"]; set => base["fee_type"] = value; }

        /// <summary>
        /// 订单总金额(单位:分)
        /// </summary>
        public int? TotalFee { get => base["total_fee"].AsInt32(); set => base["total_fee"] = value?.ToString(); }

        /// <summary>
        /// 调用微信支付API的机器IP
        /// </summary>
        public string TerminalIp { get => base["spbill_create_ip"]; set => base["spbill_create_ip"] = value; }

        /// <summary>
        /// 交易起始时间(格式为yyyyMMddHHmmss)
        /// </summary>
        public string TransactionStartTime { get => base["time_start"]; set => base["time_start"] = value; }

        /// <summary>
        /// 订单失效时间(格式为yyyyMMddHHmmss)
        /// </summary>
        public string TransactionExpireTime { get => base["time_expire"]; set => base["time_expire"] = value; }

        /// <summary>
        /// 订单优惠标记
        /// </summary>
        public string GoodsTag { get => base["goods_tag"]; set => base["goods_tag"] = value; }

        /// <summary>
        /// 异步接收微信支付结果通知的回调地址，通知url必须为外网可访问的url，不能携带参数
        /// </summary>
        public string NotifyUrl { get => base["notify_url"]; set => base["notify_url"] = value; }

        /// <summary>
        /// 交易类型(JSAPI -JSAPI支付;NATIVE -Native支付;APP -APP支付)
        /// </summary>
        public string TradeType { get => base["trade_type"]; set => base["trade_type"] = value; }

        /// <summary>
        /// 商户订单号(商户系统内部订单号要求32个字符内，只能是数字、大小写字母_-|*@ ，且在同一个商户号下唯一)
        /// </summary>
        public string MerchantOrderId { get => this["out_trade_no"]; set => this["out_trade_no"] = value; }

        /// <summary>
        /// 商品ID(trade_type=NATIVE时，此参数必传)
        /// </summary>
        public string ProductId { get => base["product_id"]; set => base["product_id"] = value; }

        /// <summary>
        /// 指定支付方式
        /// </summary>
        public string LimitPay { get => base["limit_pay"]; set => base["limit_pay"] = value; }

        /// <summary>
        /// 用户标识(trade_type = JSAPI时（即JSAPI支付），此参数必传)
        /// </summary>
        public string OpenId { get => base["openid"]; set => base["openid"] = value; }

        /// <summary>
        /// 电子发票入口开放标识(传入Y时，支付成功消息和支付详情页将出现开票入口。
        /// 需要在微信支付商户平台或微信公众平台开通电子发票功能，传此字段才可生效)
        /// </summary>
        public string Receipt { get => base["receipt"]; set => base["receipt"] = value; }

        /// <summary>
        /// 场景信息
        /// </summary>
        public string SceneInfo { get => base["scene_info"]; set => base["scene_info"] = value; }

        #endregion

        #region Constructor

        /// <summary>
        /// 默认构造方法
        /// </summary>
        public UnifiedOrderRequest()
        {
            this.FeeType = "CNY";
            this.TradeType = "JSAPI";
        }

        #endregion

        #region Validate

        /// <summary>
        /// 输入验证
        /// </summary>
        /// <param name="message">异常信息</param>
        /// <returns>是否通过验证</returns>
        public bool Valid(out string message)
        {
            message = string.Empty;

            // 检测必填参数
            if (this.MerchantOrderId.IsEmpty())
            {
                message = "缺少统一支付接口必填参数【商户订单号】！";
            }
            else if (this.Body.IsEmpty())
            {
                message = "缺少统一支付接口必填参数【商品描述信息】！";
            }
            else if (!this.TotalFee.HasValue)
            {
                message = "缺少统一支付接口必填参数【订单总金额】！";
            }
            else if (this.TradeType.IsEmpty())
            {
                message = "缺少统一支付接口必填参数【交易类型】！";
            }

            // 关联参数验证
            if (this.TradeType == "JSAPI" && this.OpenId.IsEmpty())
            {
                message = "统一支付接口中，缺少必填参数【用户标识】！【交易类型】为JSAPI时，【用户标识】为必填参数！";
            }
            if (this.TradeType == "NATIVE" && this.ProductId.IsEmpty())
            {
                message = "统一支付接口中，缺少必填参数【商品ID】！【交易类型】为NATIVE时，【商品ID】为必填参数！";
            }

            return message.IsEmpty();
        }

        #endregion
    }
}
