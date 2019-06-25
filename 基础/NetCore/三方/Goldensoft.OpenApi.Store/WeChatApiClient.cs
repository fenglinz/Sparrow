using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Goldensoft.OpenApi.Store.Requests.WxBuyGoods;
using Mercurius.Prime.Core.WebApi;

namespace Goldensoft.OpenApi.Store
{
    /// <summary>
    /// 供微信调用的接口客户端
    /// </summary>
    public class WeChatApiClient : WebApiClientSupport
    {
        /// <summary>
        /// 门店商品下单
        /// </summary>
        /// <param name="baseUrl">门店服务基地址</param>
        /// <param name="data">下单数据</param>
        /// <returns>下单结果</returns>
        public async void BuyGoods(string baseUrl, WxBuyGoodsPara data)
        {
            if (data == null)
            {
                throw new Exception("数据不能为空！");
            }

            await this.Post($"{baseUrl.TrimEnd('/')}/WxInterface/WxBuyGoods", data);
        }
    }
}
