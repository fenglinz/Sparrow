using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using Mercurius.EntityBase;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Cache;
using Newtonsoft.Json;
using static Mercurius.Infrastructure.SystemConfiguration;

namespace Mercurius.ServiceBase
{
    /// <summary>
    /// Web Api调用基类。
    /// </summary>
    public abstract class WebApiClientSupport
    {
        #region 静态变量

        /// <summary>
        /// Token缓存键。
        /// </summary>
        protected static readonly string TokenCacheKey = "__FileStorageWebApiToken";

        #endregion

        #region 属性

        /// <summary>
        /// 缓存。
        /// </summary>
        public CacheProvider Cache { get; set; }

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
        public T Get<T>(string webApiRoute, object data = null, bool needToken = true)
        {
            var url = $"{FileStorageRomoteUrl}{webApiRoute}";

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

            var response = request.GetResponse();

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
        public T Post<T>(string webApiRoute, object data = null, bool needToken = true)
        {
            var url = $"{FileStorageRomoteUrl}{webApiRoute}";
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

            var response = request.GetResponse();

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
        public T Put<T>(string webApiRoute, object data = null, bool needToken = true)
        {
            var url = $"{FileStorageRomoteUrl}{webApiRoute}";
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
                using (var stream = request.GetRequestStream())
                {
                    var buffers = Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(data));

                    stream.Write(buffers, 0, buffers.Length);
                }
            }

            var response = request.GetResponse();

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
        public T Delete<T>(string webApiRoute, object data = null, bool needToken = true)
        {
            var url = $"{FileStorageRomoteUrl}{webApiRoute}";

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

            var response = request.GetResponse();

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
            var token = this.Cache?.Get<Token>("__FileStorageWebApiToken");

            if (token == null)
            {
                var httpRequest = (HttpWebRequest)WebRequest.Create(FileStorageTokenTokenEndpointPath);

                httpRequest.Method = "POST";
                httpRequest.Accept = "application/json";
                httpRequest.ContentType = "application/x-www-form-urlencoded";

                var tokenRequest = $"grant_type=password&username={FileStorageTokenAccount}&password={FileStorageTokenPassword}";
                var buffers = Encoding.UTF8.GetBytes(tokenRequest);

                httpRequest.ContentLength = buffers.Length;

                var stream = httpRequest.GetRequestStream();

                stream.Write(buffers, 0, buffers.Length);

                using (var httpResponse = (HttpWebResponse)httpRequest.GetResponse())
                {
                    var streamReader = new StreamReader(httpResponse.GetResponseStream());

                    token = JsonConvert.DeserializeObject<Token>(streamReader.ReadToEnd());

                    this.Cache?.Add("__FileStorageWebApiToken", token);
                }    
            }

            return token;
        }

        #endregion
    }
}
