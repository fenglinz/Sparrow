using System;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;

namespace Goldensoft.OpenApi.WeChat.Responses.Pay
{
    /// <summary>
    /// 微信支付通知信息
    /// </summary>
    [XmlRoot("xml")]
    public class PayNotifyResponse
    {
        #region Properties

        /// <summary>
        /// 返回状态码(成功时为SUCCESS)
        /// </summary>
        [XmlElement("return_code")]
        public string ReturnCode { get; set; }

        /// <summary>
        /// 返回信息(成功时为OK)
        /// </summary>
        [XmlElement("return_msg")]
        public string ReturnMessage { get; set; }

        /// <summary>
        /// 微信分配的公众账号ID(企业号corpid即为此appId)
        /// </summary>
        [XmlElement("appid")]
        public string AppId { get; set; }

        /// <summary>
        /// 商户号(微信支付分配的商户号)
        /// </summary>
        [XmlElement("mch_id")]
        public string MerchantPaymentId { get; set; }
        
        /// <summary>
        /// 设备号(微信支付分配的终端设备号)
        /// </summary>
        [XmlElement("device_info")]
        public string DeviceInfo { get; set; }

        /// <summary>
        /// 随机字符串
        /// </summary>
        [XmlElement("nonce_str")]
        public string NonceString { get; set; }
        
        /// <summary>
        /// 签名
        /// </summary>
        [XmlElement("sign")]
        public string Sign { get; set; }
        
        /// <summary>
        /// 签名类型(目前支持HMAC-SHA256和MD5，默认为MD5)
        /// </summary>
        [XmlElement("sign_type")]
        public string SignType { get; set; }

        /// <summary>
        /// 业务结果(SUCCESS/FAIL)
        /// </summary>
        [XmlElement("result_code")]
        public string ResultCode { get; set; }

        /// <summary>
        /// 错误代码
        /// </summary>
        [XmlElement("err_code")]
        public string ErrorCode { get; set; }
        
        /// <summary>
        /// 错误代码描述
        /// </summary>
        [XmlElement("err_code_des")]
        public string ErrorCodeDescription { get; set; }

        /// <summary>
        /// 用户标识(用户在商户appid下的唯一标识)
        /// </summary>
        [XmlElement("openid")]
        public string OpenId { get; set; }

        /// <summary>
        /// 是否关注公众账号(Y-关注，N-未关注)
        /// </summary>
        [XmlElement("is_subscribe")]
        public string IsSubscribe { get; set; }

        /// <summary>
        /// 交易类型(JSAPI、NATIVE、APP)
        /// </summary>
        [XmlElement("trade_type")]
        public string TradeType { get; set; }
        
        /// <summary>
        /// 付款银行
        /// </summary>
        [XmlElement("bank_type")]
        public string BankType { get; set; }

        /// <summary>
        /// 订单金额(单位为分)
        /// </summary>
        [XmlElement("total_fee")]
        public int TotalFee { get; set; }

        /// <summary>
        /// 应结订单金额(应结订单金额=订单金额-非充值代金券金额，应结订单金额<=订单金额)
        /// </summary>
        [XmlElement("settlement_total_fee")]
        public int SettlementTotalFee { get; set; }

        /// <summary>
        /// 货币种类
        /// </summary>
        [XmlElement("fee_type")]
        public string FeeType { get; set; }

        /// <summary>
        /// 现金支付金额订单现金支付金额()
        /// </summary>
        [XmlElement("cash_fee")]
        public int CashFee { get; set; }

        /// <summary>
        /// 现金支付货币类型
        /// </summary>
        [XmlElement("cash_fee_type")]
        public string CashFeeType { get; set; }

        /// <summary>
        /// 总代金券金额(代金券金额<=订单金额，订单金额-代金券金额=现金支付金额)
        /// </summary>
        [XmlElement("coupon_fee")]
        public int CouponFee { get; set; }

        /// <summary>
        /// 代金券使用数量
        /// </summary>
        [XmlElement("coupon_count")]
        public int CouponCount { get; set; }

        /// <summary>
        /// 代金券类型(CASH---充值代金券，NO_CASH---非充值代金券；$n为下标,从0开始编号)
        /// </summary>
        [XmlElement("coupon_type_$n")]
        public string CouponType { get; set; }
        
        /// <summary>
        /// 代金券ID
        /// </summary>
        [XmlElement("coupon_id_$n")]
        public string CouponId { get; set; }
        
        /// <summary>
        /// 微信支付订单号
        /// </summary>
        [XmlElement("transaction_id")]
        public string TransactionId { get; set; }

        /// <summary>
        /// 商户订单号(商户系统内部订单号要求32个字符内，只能是数字、大小写字母_-|*@ ，且在同一个商户号下唯一)
        /// </summary>
        [XmlElement("out_trade_no")]
        public string MerchantOrderId { get; set; }

        /// <summary>
        /// 商家数据包
        /// </summary>
        [XmlElement("attach")]
        public string MerchantAttach { get; set; }
        
        /// <summary>
        /// 支付完成时间(格式为yyyyMMddHHmmss)
        /// </summary>
        [XmlElement("time_end")]
        public string PayTimeEnd { get; set; }

        /// <summary>
        /// 交易状态描述
        /// </summary>
        [XmlElement("trade_state_desc")]
        public string TradeStateDescription { get; set; }

        #endregion
    }
}
