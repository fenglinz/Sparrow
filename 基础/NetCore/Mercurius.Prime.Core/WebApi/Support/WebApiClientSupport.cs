using System;
using System.IO;
using System.Net;
using System.Net.Security;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Prime.Core.Cache;
using Mercurius.Prime.Core.Entity;
using Newtonsoft.Json;

namespace Mercurius.Prime.Core.WebApi
{
    /// <summary>
    /// Web Api调用基类。
    /// </summary>
    public abstract class WebApiClientSupport
    {
        #region Properties

        /// <summary>
        /// 缓存。
        /// </summary>
        public RedisClient Redis { get; set; }

        #endregion

        #region Protected Methods

        /// <summary>
        /// Get请求处理。
        /// </summary>
        /// <typeparam name="T">返回值类型</typeparam>
        /// <param name="webApiRoute">Web Api路由</param>
        /// <param name="data">传入的数据</param>
        /// <param name="needToken">是否需要用户认证Token</param>
        /// <returns>返回的数据</returns>
        protected async Task<HttpResponseResult> Get(string url, object data = null, Action<HttpWebRequest> callback = null)
        {
            if (data != null)
            {
                var paramters = ParameterHelper.GetProperties(data);

                url += "?";

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

            callback?.Invoke(request);

            var response = await request.GetResponseAsync();

            return new HttpResponseResult((HttpWebResponse)response);
        }

        /// <summary>
        /// POST请求处理。
        /// </summary>
        /// <typeparam name="T">返回值类型</typeparam>
        /// <param name="webApiRoute">Web Api路由</param>
        /// <param name="data">传入的数据</param>
        /// <param name="needToken">是否需要用户认证Token</param>
        /// <returns>返回的数据</returns>
        protected async Task<HttpResponseResult> Post(string url, object data = null, Action<HttpWebRequest> callback = null)
        {
            // 设置最大连接数
            ServicePointManager.DefaultConnectionLimit = 200;

            // 设置https验证方式
            if (url.StartsWith("https", StringComparison.OrdinalIgnoreCase))
            {
                ServicePointManager.ServerCertificateValidationCallback = (sender, certificate, chain, sslPolicyErrors) => true;
            }

            var request = (HttpWebRequest)WebRequest.Create(url);

            request.ContentType = "application/json";
            request.Method = "POST";
            request.KeepAlive = true;
            request.Credentials = CredentialCache.DefaultCredentials;

            callback?.Invoke(request);

            if (data == null)
            {
                request.ContentLength = 0; // 无请求内容时，必须设置为0.
            }
            else
            {
                using (var stream = request.GetRequestStream())
                {
                    var buffers = Encoding.UTF8.GetBytes(data is string ? data as string : JsonConvert.SerializeObject(data));

                    await stream.WriteAsync(buffers, 0, buffers.Length);
                }
            }

            var response = await request.GetResponseAsync();

            return new HttpResponseResult((HttpWebResponse)response);
        }

        /// <summary>
        /// Put请求处理。
        /// </summary>
        /// <typeparam name="T">返回值类型</typeparam>
        /// <param name="url">Web Api url</param>
        /// <param name="data">传入的数据</param>
        /// <param name="token">token信息</param>
        /// <returns>返回的数据</returns>
        protected async Task<HttpResponseResult> Put(string url, object data = null, Action<HttpWebRequest> callback = null)
        {
            // 设置最大连接数
            ServicePointManager.DefaultConnectionLimit = 200;

            // 设置https验证方式
            if (url.StartsWith("https", StringComparison.OrdinalIgnoreCase))
            {
                ServicePointManager.ServerCertificateValidationCallback = (sender, certificate, chain, sslPolicyErrors) => true;
            }

            var request = (HttpWebRequest)WebRequest.Create(url);

            request.ContentType = "application/json";
            request.Method = "PUT";
            request.KeepAlive = true;
            request.Credentials = CredentialCache.DefaultCredentials;

            callback?.Invoke(request);

            if (data == null)
            {
                request.ContentLength = 0; // 无请求内容时，必须设置为0.
            }
            else
            {
                using (var stream = request.GetRequestStream())
                {
                    var buffers = Encoding.UTF8.GetBytes(data is string ? data as string : JsonConvert.SerializeObject(data));

                    await stream.WriteAsync(buffers, 0, buffers.Length);
                }
            }

            var response = await request.GetResponseAsync();

            return new HttpResponseResult((HttpWebResponse)response);
        }

        /// <summary>
        /// DELETE请求处理。
        /// </summary>
        /// <typeparam name="T">返回值类型</typeparam>
        /// <param name="url">Web Api url</param>
        /// <param name="data">传入的数据</param>
        /// <param name="token">认证Token</param>
        /// <returns>返回的数据</returns>
        protected async Task<HttpResponseResult> Delete(string url, object data = null, Action<HttpWebRequest> callback = null)
        {
            // 设置最大连接数
            ServicePointManager.DefaultConnectionLimit = 200;

            // 设置https验证方式
            if (url.StartsWith("https", StringComparison.OrdinalIgnoreCase))
            {
                ServicePointManager.ServerCertificateValidationCallback = (sender, certificate, chain, sslPolicyErrors) => true;
            }

            if (data != null)
            {
                var paramters = ParameterHelper.GetProperties(data);

                url += "?";

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

            callback?.Invoke(request);

            var response = await request.GetResponseAsync();

            return new HttpResponseResult((HttpWebResponse)response);
        }

        /// <summary>
        /// 获取token。
        /// </summary>
        /// <param name="url">token获取地址</param>
        /// <returns>token信息</returns>
        protected async Task<Token> GetOAuthToken(string url, string identityId, string data, string contentType = "application/x-www-form-urlencoded")
        {
            // 设置最大连接数
            ServicePointManager.DefaultConnectionLimit = 200;

            // 设置https验证方式
            if (url.StartsWith("https", StringComparison.OrdinalIgnoreCase))
            {
                ServicePointManager.ServerCertificateValidationCallback = (sender, certificate, chain, sslPolicyErrors) => true;
            }

            var cacheKey = $"{url}#{identityId}";
            var token = this.Redis?.Get<Token>(cacheKey);

            if (token == null)
            {
                var httpRequest = (HttpWebRequest)WebRequest.Create(url);

                httpRequest.Method = "POST";
                httpRequest.Accept = "application/json";
                httpRequest.ContentType = contentType;

                var buffers = Encoding.UTF8.GetBytes(data);

                httpRequest.ContentLength = buffers.Length;

                var stream = await httpRequest.GetRequestStreamAsync();

                await stream.WriteAsync(buffers, 0, buffers.Length);

                using (var httpResponse = (HttpWebResponse)httpRequest.GetResponse())
                {
                    var streamReader = new StreamReader(httpResponse.GetResponseStream());

                    token = JsonConvert.DeserializeObject<Token>(await streamReader.ReadToEndAsync());

                    this.Redis?.Set(cacheKey, token, TimeSpan.FromSeconds(token.ExpiresIn));
                }
            }

            return token;
        }

        #endregion
    }

    public static class WebApiClientExtension
    {
        /// <summary>
        /// 设置认证头
        /// </summary>
        /// <param name="request">请求对象</param>
        /// <param name="token">token信息</param>
        /// <returns>http请求对象</returns>
        public static HttpWebRequest Authorization(this HttpWebRequest request, Token token)
        {
            if (token != null)
            {
                request.Headers["Authorization"] = $"{token.TokenType} {token.AccessToken}";
            }

            return request;
        }
    }
}
