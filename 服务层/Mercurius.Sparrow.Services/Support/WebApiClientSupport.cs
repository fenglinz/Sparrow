using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Sparrow.Entities.WebApi;
using Newtonsoft.Json;

namespace Mercurius.Sparrow.Services
{
    /// <summary>
    /// Web Api调用基类。
    /// </summary>
    public abstract class WebApiClientSupport
    {
        #region 静态变量

        /// <summary>
        /// Web API Token信息。
        /// </summary>
        private static Token _token;

        /// <summary>
        /// 文件上传远程地址。
        /// </summary>
        protected static readonly string FileRemoteUrl = ConfigurationManager.AppSettings["FileStorage.RomoteUrl"];

        /// <summary>
        /// 文件上传token认证地址。
        /// </summary>
        private static readonly string TokenEndpointPath = $"{FileRemoteUrl}{ConfigurationManager.AppSettings["FileStorage.Token.TokenEndpointPath"]}";

        /// <summary>
        /// 文件上传token账号。
        /// </summary>
        private static readonly string TokenAccount = ConfigurationManager.AppSettings["FileStorage.Token.Account"];

        /// <summary>
        /// 文件上传token密码
        /// </summary>
        private static readonly string TokenPassword = ConfigurationManager.AppSettings["FileStorage.Token.Password"];

        #endregion

        #region 公开方法

        public T Post<T>(string url, object data = null, bool needToken = true)
        {
            var request = (HttpWebRequest)WebRequest.Create(url);

            request.ContentType = "application/json";
            request.Method = "POST";
            request.KeepAlive = true;
            request.Credentials = CredentialCache.DefaultCredentials;

            if (needToken)
            {
                var token = this.GetToken();

                if (token != null)
                {
                    request.Headers.Add(HttpRequestHeader.Authorization, $"{token.TokenType} {token.AccessToken}");
                }
            }

            if (data == null)
            {
                request.ContentLength = 0; // 无请求内容时，必须设置为0.
            }
            else
            {
                using (var stream = request.GetRequestStream())
                {
                    var buffers = Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(data));

                    stream.Write(buffers, 0, buffers.Length);
                }
            }

            var response = (HttpWebResponse)request.GetResponse();

            using (var stream = new StreamReader(response.GetResponseStream()))
            {
                return JsonConvert.DeserializeObject<T>(stream.ReadToEnd());
            }
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 获取token。
        /// </summary>
        /// <returns>token信息</returns>
        private Token GetToken()
        {
            if (_token == null)
            {
                var httpRequest = (HttpWebRequest)WebRequest.Create(TokenEndpointPath);

                httpRequest.Method = "POST";
                httpRequest.Accept = "application/json";
                httpRequest.ContentType = "application/x-www-form-urlencoded";

                var tokenRequest = $"grant_type=password&username={TokenAccount}&password={TokenPassword}";
                var buffers = Encoding.UTF8.GetBytes(tokenRequest);

                httpRequest.ContentLength = buffers.Length;

                var stream = httpRequest.GetRequestStream();

                stream.Write(buffers, 0, buffers.Length);

                using (var httpResponse = (HttpWebResponse)httpRequest.GetResponse())
                {
                    var streamReader = new StreamReader(httpResponse.GetResponseStream());

                    _token = JsonConvert.DeserializeObject<Token>(streamReader.ReadToEnd());
                }
            }

            return _token;
        }

        #endregion
    }
}
