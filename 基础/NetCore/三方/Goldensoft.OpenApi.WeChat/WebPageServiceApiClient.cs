using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Prime.Core.WebApi;

namespace Goldensoft.OpenApi.WeChat
{
    /// <summary>
    /// 微信网页服务web api客户端
    /// </summary>
    public class WebPageServiceApiClient : WebApiClientSupport
    {
        #region Consts

        /// <summary>
        /// 根据网页授权返回的code获取openid信息的接口地址
        /// </summary>
        private const string AccessTokenUrlFormat = "https://api.weixin.qq.com/sns/oauth2/access_token?appid={0}&secret={1}&code={2}&grant_type=authorization_code";

        #endregion

        #region Public Methods

        /// <summary>
        /// 获取access token
        /// </summary>
        /// <param name="appId">微信公众号app id</param>
        /// <param name="appSecret">微信公众号app secret</param>
        /// <returns>access token值</returns>
        public async Task<Token> GetAccessToken(string appId, string appSecret, string code)
        {
            var accessTokenUrl = string.Format(AccessTokenUrlFormat, appId, appSecret, code);

            try
            {
                var rs = await this.Get(accessTokenUrl);

                return rs.As<Token>();
            }
            catch (Exception)
            {
            }

            return null;
        }


        /// <summary>  
        /// 发送模板消息  
        /// </summary>  
        /// <param name="accessToken">AccessToken</param>  
        /// <param name="data">发送的模板数据</param>  
        /// <returns></returns>  
        public async Task<HttpResponseResult> SendTemplateMessage(string accessToken, string data)
        {
            var url = $"https://api.weixin.qq.com/cgi-bin/message/template/send?access_token={accessToken}";

            return await this.Post(url, data);
        }

        #endregion
    }
}
