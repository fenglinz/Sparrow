using System;
using System.Collections.Generic;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Goldensoft.OpenApi.Store.Requests.Coupon;
using Goldensoft.OpenApi.Store.Responses.Coupon;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.WebApi;
using Mercurius.Prime.Data.Service;

namespace Goldensoft.OpenApi.Store
{
    /// <summary>
    /// 票券web api客户端
    /// </summary>
    public class CouponWebApiClient : WebApiClientSupport
    {
        #region Fields

        /// <summary>
        /// web api接口地址
        /// </summary>
        private string webApiUrl;

        /// <summary>
        /// oauth账户
        /// </summary>
        private string oauthAccount;

        /// <summary>
        /// oauth密码
        /// </summary>
        private string oauthPassword;

        #endregion

        #region Constructor

        /// <summary>
        /// 构造方法
        /// </summary>
        /// <param name="url">oauth接口地址</param>
        /// <param name="account">账号</param>
        /// <param name="password">密码</param>
        public CouponWebApiClient()
        {
        }

        #endregion

        public void Init(string url, string account, string password)
        {
            this.webApiUrl = url?.TrimEnd('/');
            this.oauthAccount = account;
            this.oauthPassword = password;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="url"></param>
        /// <param name="request"></param>
        /// <returns></returns>
        public async Task<ResponseSet<CouponResponse>> Search(CouponSORequest request)
        {
            var cacheKey = $"{this.webApiUrl}/Coupon/{request.VpnCode}";
            var cacheValue = this.Redis?.Get<IEnumerable<CouponResponse>>(cacheKey);

            if (!cacheValue.IsEmpty())
            {
                return new ResponseSet<CouponResponse> { Datas = cacheValue };
            }

            var url = $"{this.webApiUrl}/api/Coupon/Search";

            var oauthIdentity = new
            {
                Account = this.oauthAccount,
                Password = this.oauthPassword
            }.AsJson();

            var token = await this.GetOAuthToken($"{this.webApiUrl}/api/oauth/token", this.oauthAccount, oauthIdentity, "application/json");
            var rs = await this.Post(url, request, response => response.Authorization(token));
            var result = rs.As<ResponseSet<CouponResponse>>();

            if (!result.Datas.IsEmpty())
            {
                this.Redis?.Set(cacheKey, result.Datas, TimeSpan.FromMinutes(10));
            }

            return result;
        }
    }
}
