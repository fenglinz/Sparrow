using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Infrastructure;
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

        /// <summary>
        /// Get请求处理。
        /// </summary>
        /// <typeparam name="T">返回值类型</typeparam>
        /// <param name="webApiRoute">Web Api路由</param>
        /// <param name="data">传入的数据</param>
        /// <param name="needToken">是否需要用户认证Token</param>
        /// <returns>返回的数据</returns>
        public async Task<T> Get<T>(string webApiRoute, object data = null, bool needToken = true)
        {
            var url = $"{FileRemoteUrl}{webApiRoute}";

            if (data != null)
            {
                var paramters = ParameterHelper.GetProperties(data);

                url = url + "?";

                foreach (var item in paramters)
                {
                    url += $"{item.Name}={item.GetValue(data)}&";
                }

                url = url.Substring(0, url.Length - 1);
            }

            var request = (HttpWebRequest)WebRequest.Create(url);

            request.Method = "GET";
            request.KeepAlive = true;
            request.Accept = "application/json";
            request.ContentType = "application/json";
            request.Credentials = CredentialCache.DefaultCredentials;

            if (needToken)
            {
                var token = GetToken();

                if (token != null)
                {
                    request.Headers.Add(HttpRequestHeader.Authorization, $"{token.TokenType} {token.AccessToken}");
                }
            }

            var response = await request.GetResponseAsync();

            using (var stream = new StreamReader(response.GetResponseStream()))
            {
                return JsonConvert.DeserializeObject<T>(stream.ReadToEnd());
            }
        }

        /// <summary>
        /// POST请求处理。
        /// </summary>
        /// <typeparam name="T">返回值类型</typeparam>
        /// <param name="webApiRoute">Web Api路由</param>
        /// <param name="data">传入的数据</param>
        /// <param name="needToken">是否需要用户认证Token</param>
        /// <returns>返回的数据</returns>
        public async Task<T> Post<T>(string webApiRoute, object data = null, bool needToken = true)
        {
            var url = $"{FileRemoteUrl}{webApiRoute}";
            var request = (HttpWebRequest)WebRequest.Create(url);

            request.ContentType = "application/json";
            request.Method = "POST";
            request.KeepAlive = true;
            request.Credentials = CredentialCache.DefaultCredentials;

            if (needToken)
            {
                var token = GetToken();

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

            var response = await request.GetResponseAsync();

            using (var stream = new StreamReader(response.GetResponseStream()))
            {
                return JsonConvert.DeserializeObject<T>(stream.ReadToEnd());
            }
        }

        /// <summary>
        /// Put请求处理。
        /// </summary>
        /// <typeparam name="T">返回值类型</typeparam>
        /// <param name="webApiRoute">Web Api路由</param>
        /// <param name="data">传入的数据</param>
        /// <param name="needToken">是否需要用户认证Token</param>
        /// <returns>返回的数据</returns>
        public async Task<T> Put<T>(string webApiRoute, object data = null, bool needToken = true)
        {
            var url = $"{FileRemoteUrl}{webApiRoute}";
            var request = (HttpWebRequest)WebRequest.Create(url);

            request.ContentType = "application/json";
            request.Method = "PUT";
            request.KeepAlive = true;
            request.Credentials = CredentialCache.DefaultCredentials;

            if (needToken)
            {
                var token = GetToken();

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
                using (var stream = await request.GetRequestStreamAsync())
                {
                    var buffers = Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(data));

                    stream.Write(buffers, 0, buffers.Length);
                }
            }

            var response = await request.GetResponseAsync();

            using (var stream = new StreamReader(response.GetResponseStream()))
            {
                return JsonConvert.DeserializeObject<T>(stream.ReadToEnd());
            }
        }

        /// <summary>
        /// DELETE请求处理。
        /// </summary>
        /// <typeparam name="T">返回值类型</typeparam>
        /// <param name="webApiRoute">Web Api路由</param>
        /// <param name="data">传入的数据</param>
        /// <param name="needToken">是否需要用户认证Token</param>
        /// <returns>返回的数据</returns>
        public async Task<T> Delete<T>(string webApiRoute, object data = null, bool needToken = true)
        {
            var url = $"{FileRemoteUrl}{webApiRoute}";

            if (data != null)
            {
                var paramters = ParameterHelper.GetProperties(data);

                url = url + "?";

                foreach (var item in paramters)
                {
                    url += $"{item.Name}={item.GetValue(data)}&";
                }

                url = url.Substring(0, url.Length - 1);
            }

            var request = (HttpWebRequest)WebRequest.Create(url);

            request.Method = "DELETE";
            request.KeepAlive = true;
            request.Accept = "application/json";
            request.ContentType = "application/json";
            request.Credentials = CredentialCache.DefaultCredentials;

            if (needToken)
            {
                var token = GetToken();

                if (token != null)
                {
                    request.Headers.Add(HttpRequestHeader.Authorization, $"{token.TokenType} {token.AccessToken}");
                }
            }

            var response = await request.GetResponseAsync();

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
        private static Token GetToken()
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
