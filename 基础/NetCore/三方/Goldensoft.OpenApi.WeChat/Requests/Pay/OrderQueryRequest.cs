using System;
using System.Collections.Generic;
using System.Text;

namespace Goldensoft.OpenApi.WeChat.Requests.Pay
{
    /// <summary>
    /// 订单查询请求信息
    /// </summary>
    public class OrderQueryRequest : PayRequestBase
    {
        /// <summary>
        /// 商户号(微信支付分配的商户号)
        /// </summary>
        public string MerchantId { get => base["mch_id"]; set => base["mch_id"] = value; }

        /// <summary>
        /// 签名
        /// </summary>
        public string Sign { get => base["sign"]; set => base["sign"] = value; }

        /// <summary>
        /// 微信支付订单号
        /// </summary>
        public string TransactionId { get => base["transaction_id"]; set => base["transaction_id"] = value; }

        /// <summary>
        /// 商户订单号(商户系统内部订单号要求32个字符内，只能是数字、大小写字母_-|*@ ，且在同一个商户号下唯一)
        /// </summary>
        public string MerchantOrderId { get => base["out_trade_no"]; set => base["out_trade_no"] = value; }

    }
}
