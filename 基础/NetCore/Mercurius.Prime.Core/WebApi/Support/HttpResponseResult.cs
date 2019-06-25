using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Net;
using System.Text;
using Newtonsoft.Json.Linq;

namespace Mercurius.Prime.Core.WebApi
{
    /// <summary>
    /// http响应结果
    /// </summary>
    public class HttpResponseResult
    {
        #region Fields

        /// <summary>
        /// http响应体转换的json对象
        /// </summary>
        private JObject jObject;

        #endregion

        #region Properties

        public HttpStatusCode Status { get; private set; }

        /// <summary>
        /// 响应头信息.
        /// </summary>
        public NameValueCollection Headers { get; private set; }

        /// <summary>
        /// 响应结果信息
        /// </summary>
        public string Body { get; private set; }

        #endregion

        #region Constructor

        /// <summary>
        /// 构造方法
        /// </summary>
        /// <param name="response">http请求响应对象</param>
        internal HttpResponseResult(HttpWebResponse response)
        {
            this.Headers = new NameValueCollection();

            if (response != null)
            {
                this.Status = response.StatusCode;

                foreach (string headerKey in response.Headers.Keys)
                {
                    this.Headers[headerKey] = response.Headers[headerKey];
                }

                using (var stream = new StreamReader(response.GetResponseStream()))
                {
                    this.Body = stream.ReadToEnd();
                }
            }
        }

        #endregion

        #region Public Methods

        /// <summary>
        /// 将http响应体信息转换为实体对象
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <returns>实体对象</returns>
        public T As<T>()
        {
            if (this.Body != null)
            {
                return this.Body.AsObject<T>();
            }

            return default;
        }

        /// <summary>
        /// 获取http响应体中json格式数据
        /// </summary>
        /// <param name="propertyName">属性名</param>
        /// <returns>值</returns>
        public string GetJsonValue(string propertyName)
        {
            this.jObject = this.jObject ?? JObject.Parse(this.Body);

            return this.jObject.GetJsonValue(propertyName);
        }

        /// <summary>
        /// 获取http响应体中json格式数据
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="propertyName">属性</param>
        /// <returns>实体对象</returns>
        public T GetJsonValue<T>(string propertyName)
        {
            this.jObject = this.jObject ?? JObject.Parse(this.Body);

            return this.jObject.GetJsonValue<T>(propertyName);
        }

        #endregion
    }
}
