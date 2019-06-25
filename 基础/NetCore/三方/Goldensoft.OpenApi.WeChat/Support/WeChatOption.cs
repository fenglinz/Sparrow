using System;
using System.Collections.Generic;
using System.Text;

namespace Goldensoft.OpenApi.WeChat
{
    /// <summary>
    /// 微信选项信息
    /// </summary>
    public class WeChatOption
    {
        #region Properties

        /// <summary>
        /// 服务号app id
        /// </summary>
        public string AppId { get; set; }

        /// <summary>
        /// 公众帐号secert(仅JSAPI支付的时候需要配置)
        /// </summary>
        public string AppSecret { get; set; }

        /// <summary>
        /// 微信支付商户号
        /// </summary>
        public string MerchantId { get; set; } = "1422803802";

        /// <summary>
        /// 微信支付商户支付密钥
        /// </summary>
        public string MerchantPaymentKey { get; set; } = "goldensoftcn20190531wechat102086";

        /// <summary>
        /// 支付方open id
        /// </summary>
        public string OpenId { get; set; }

        #endregion
    }
}
