using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Mercurius.Prime.Boot.Apis.Models.WeChat;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.WebApi;
using Mercurius.Prime.Data.Service;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Mercurius.Prime.Boot.Apis.Controllers
{
    /// <summary>
    /// 微信web api接口
    /// </summary>
    [ApiController]
    [AllowAnonymous]
    [Route("api/[controller]")]
    public abstract class WeChatWebApiBase : ControllerBase
    {
        #region Properties

        public WeChatApiClient WeChatApiClient { get; set; }

        #endregion

        /// <summary>
        /// 微信获取token
        /// </summary>
        /// <param name="wm"></param>
        /// <returns></returns>
        protected async Task<Response<TicketModel>> GetTicKet(string appId, string appSecret, string url)
        {
            var list = new Response<TicketModel>();

            try
            {
                var timestamp = DateTime.Now.GetTimeStamp();
                var accessToken = await this.WeChatApiClient.GetAccessToken(appId, appSecret);
                var ticket = await this.WeChatApiClient.GetTicket(accessToken);

                string nonceStr = "goldensoft.wx";
                string token = accessToken;
                string signature = this.WeChatApiClient.CheckSignature(ticket, nonceStr, timestamp, url);

                var model = new TicketModel()
                {
                    AppId = appId,
                    Ticker = ticket,
                    NonceValue = nonceStr,
                    Signature = signature,
                    Timestamp = timestamp,
                    Url = url
                };

                list.Data = model;
            }
            catch (Exception ex)
            {
                list.IsSuccess = false;
                list.Data = null;
                list.ErrorMessage = ex.ToString();
                //throw;
            }

            return list;
        }
    }
}