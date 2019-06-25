using System;
using System.Collections.Generic;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Goldensoft.OpenApi.WeChat.Responses.JsSdk;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.WebApi;

namespace Goldensoft.OpenApi.WeChat
{
    /// <summary>
    /// 
    /// </summary>
    public class JsSdkApiClient : WebApiClientSupport
    {
        #region Consts

        private const string AccessTokenUrlFormat = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={0}&secret={1}";

        private const string GetTicketUrlFormat = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token={0}&type=jsapi";

        private const string GetOpenIdUrlFormat = "https://api.weixin.qq.com/sns/oauth2/access_token?appid={0}&secret={1}&code={2}&grant_type=authorization_code";

        #endregion

        /// <summary>
        /// 获取访问token
        /// </summary>
        /// <param name="appId">微信公众号app id</param>
        /// <param name="appSecret">微信公众号app secret</param>
        /// <returns>接口访问token信息</returns>
        public async Task<Token> GetAccessToken(string appId, string appSecret)
        {
            var url = string.Format(AccessTokenUrlFormat, appId, appSecret);

            try
            {
                var key = appId + appSecret;
                var token = TokenManager.GetToken(key);

                if (token != null)
                {
                    return token;
                }
                else
                {
                    var rs = await this.Get(url);

                    token = rs.As<Token>();

                    TokenManager.SaveToken(key, token);

                    return token;
                }
            }
            catch (Exception)
            {
            }

            return null;
        }

        /// <summary>
        /// 获取票据信息
        /// </summary>
        /// <param name="appId"></param>
        /// <param name="appSecret"></param>
        /// <param name="pageUrl"></param>
        /// <returns></returns>
        public async Task<TicketResponse> GetTicket(string appId, string appSecret, string pageUrl)
        {
            var token = await this.GetAccessToken(appId, appSecret);

            if (token == null || token.ErrorMessage.IsNotBlank())
            {
                throw new Exception("access token获取失败！" + token.ErrorMessage);
            }

            var url = string.Format(GetTicketUrlFormat, token.AccessToken);

            var randomer = new RandomGenerator();
            var nonceString = randomer.GetRandomUInt().ToString();
            var timestamp = DateTime.Now.GetTimeStamp();

            try
            {
                var rs = await this.Get(url);
                var ticket = rs.GetJsonValue("ticket");

                if (ticket.IsNotBlank())
                {

                    return new TicketResponse
                    {
                        AppId = appId,
                        Ticker = ticket,
                        NonceValue = nonceString,
                        Timestamp = timestamp,
                        Url = pageUrl,
                        Signature = this.CheckSignature(ticket, nonceString, timestamp, pageUrl),
                        AccessToken = token.AccessToken
                    };
                }
            }
            catch
            {
            }

            return new TicketResponse
            {
                AppId = appId,
                NonceValue = nonceString,
                Timestamp = timestamp,
                Url = pageUrl
            };
        }

        /// <summary>
        /// 获取微信用户的openid
        /// </summary>
        /// <param name="appId"></param>
        /// <param name="appSecret"></param>
        /// <param name="code"></param>
        /// <returns></returns>
        public async Task<string> GetOpenId(string appId, string appSecret, string code)
        {
            var url = string.Format(GetOpenIdUrlFormat, appId, appSecret, code);

            var client = new WebClient
            {
                Encoding = Encoding.UTF8
            };

            var data = await client.DownloadStringTaskAsync(url);
            var userInfo = data.AsObject<UserInfoResponse>();

            return userInfo.OpenId;
        }

        /// <summary>
        /// 生成微信签名
        /// </summary>
        /// * 将token、timestamp、nonce三个参数进行字典序排序
        /// * 将三个参数字符串拼接成一个字符串进行sha1加密
        /// * 开发者获得加密后的字符串可与signature对比，标识该请求来源于微信。
        /// <returns></returns>
        public string CheckSignature(string ticket, string nonce, long timestamp, string url)
        {
            var plainText = $"jsapi_ticket={ticket}&noncestr={nonce}&timestamp={timestamp}&url={url}";

            return GetSHA1Hash(plainText);
        }

        #region Private Methods

        private static string GetSHA1Hash(string plainText)
        {
            var strResult = "";

            using (var sha = SHA1.Create())
            {
                var bytResult = sha.ComputeHash(Encoding.UTF8.GetBytes(plainText));

                for (var i = 0; i < bytResult.Length; i++)
                {
                    strResult += bytResult[i].ToString("X2");
                }
            }

            return strResult.ToLower();
        }

        #endregion
    }
}
