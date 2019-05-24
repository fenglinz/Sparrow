using System;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Prime.Core.WebApi.Model.WeChat;

namespace Mercurius.Prime.Core.WebApi
{
    /// <summary>
    /// 微信接口调用客户端
    /// </summary>
    public class WeChatApiClient : WebApiClientSupport
    {
        #region Public Methods

        /// <summary>
        /// 获取access token
        /// </summary>
        /// <param name="appId">微信公众号app id</param>
        /// <param name="appSecret">微信公众号app secret</param>
        /// <returns>access token值</returns>
        public async Task<string> GetAccessToken(string appId, string appSecret)
        {
            var accessTokenUrl = $"https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={appId}&secret={appSecret}";
            var result = string.Empty;

            try
            {
                var rs = await this.Get(accessTokenUrl);

                result = rs.GetJsonValue("access_token");
            }
            catch (Exception)
            {
            }

            return result;
        }

        public async Task<string> GetTicket(string token)
        {
            var result = string.Empty;
            var getTicketUrl = $"https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token={token}&type=jsapi";

            try
            {
                var rs = await this.Get(getTicketUrl);

                result = rs.GetJsonValue("ticket");
            }
            catch
            {
            }

            return result;
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
            var jsapi_ticket = $"jsapi_ticket={ticket}&noncestr={nonce}&timestamp={timestamp}&url={url}";
            string signature = GetSHA1(jsapi_ticket);

            return signature.ToLower();
        }

        /// <summary>
        /// 创建时间戳
        ///本代码来自开源微信SDK项目：https://github.com/night-king/weixinSDK
        /// </summary>
        /// <returns></returns>
        public static long CreatenTimestamp()
        {
            return (DateTime.Now.ToUniversalTime().Ticks - 621355968000000000) / 10000000;
        }

        public static string GetSHA1(string strSource)
        {
            var strResult = "";

            using (var sha = SHA1.Create())
            {
                var bytResult = sha.ComputeHash(Encoding.UTF8.GetBytes(strSource));

                for (var i = 0; i < bytResult.Length; i++)
                {
                    strResult = strResult + bytResult[i].ToString("X2");
                }
            }

            return strResult;
        }


        public async Task<string> GetOpenId(string appId, string appSecret, string code)
        {
            var url = $"https://api.weixin.qq.com/sns/oauth2/access_token?appid={appId}&secret={appSecret}&code={code}&grant_type=authorization_code";

            var client = new WebClient
            {
                Encoding = Encoding.UTF8
            };

            var data = await client.DownloadStringTaskAsync(url);
            var userInfo = data.AsObject<UserInfo>();

            return userInfo.OpenId;
        }

        public static string GetOAuth(string appId, string lcurl)
        {
            var url = $"//open.weixin.qq.com/connect/oauth2/authorize?appid={appId}&redirect_uri={lcurl}&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect";
            
            return url; //会跳转到weixinBackUrl填写的地址(NewHome)上并将code值发过去
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
