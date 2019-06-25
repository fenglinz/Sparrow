using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Goldensoft.OpenApi.WeChat.Requests.Pay;
using Goldensoft.OpenApi.WeChat.Responses.Pay;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.WebApi;

namespace Goldensoft.OpenApi.WeChat
{
    /// <summary>
    /// 支付接口客户端
    /// </summary>
    public class PayApiClient : WebApiClientSupport
    {
        #region Fields

        /// <summary>
        /// 统一下单接口url
        /// </summary>
        private const string UnifiedOrderUrl = "https://api.mch.weixin.qq.com/pay/unifiedorder";

        /// <summary>
        /// 订单查询接口rul
        /// </summary>
        private const string OrderQueryUrl = "https://api.mch.weixin.qq.com/pay/orderquery";

        #endregion

        /// <summary>
        /// 统一下单
        /// </summary>
        /// <param name="data">统一下单请求数据</param>
        /// <param name="merchantPaymentKey">商户支付密钥</param>
        /// <returns>微信内支付请求数据</returns>
        public async Task<BrandWCPayRequest> UnifiedOrder(UnifiedOrderRequest data, string merchantPaymentKey)
        {
            // 异步通知url未设置，则使用配置文件中的url
            if (data.NotifyUrl.IsEmpty())
            {
                data.NotifyUrl = "http://wechat.goldensoftcn.com/api/WeChat/PayComplete";
            }

            // 签名
            data.Sign = data.MakeSign(merchantPaymentKey);

            var response = await this.Post(UnifiedOrderUrl, data.ToXml(), request =>
            {
                request.ContentType = "text/xml";
            });

            var model = new UnifiedOrderResponse();

            model.ResolverFromXml(response.Body);

            if (model.ResultCode == "SUCCESS")
            {
                var brandWCPayRequest = new BrandWCPayRequest
                {
                    AppId = model.AppId,
                    TimeStamp = DateTime.Now.GetTimeStamp().ToString(),
                    Package = $"prepay_id={model.PrepayId}"
                };

                brandWCPayRequest.PaySign = brandWCPayRequest.MakeSign(merchantPaymentKey);

                return brandWCPayRequest;
            }

            return new BrandWCPayRequest
            {
                ErrorMessage = model.ErrorCodeDescription
            };
        }

        /// <summary>
        /// 查询订单信息
        /// </summary>
        /// <param name="data">查询数据</param>
        /// <param name="merchantPaymentKey">商户支付密钥</param>
        /// <returns>微信支付订单详情</returns>
        public async Task<PayNotifyResponse> QueryOrder(OrderQueryRequest data, string merchantPaymentKey)
        {
            data.Sign = data.MakeSign(merchantPaymentKey);

            var response = await this.Post(OrderQueryUrl, data.ToXml(), request =>
            {
                request.ContentType = "text/xml";
            });

            return response.Body.FromXml<PayNotifyResponse>();
        }
    }
}
