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

        private JObject jObject;

        #endregion

        #region Properties

        /// <summary>
        /// 响应头信息.
        /// </summary>
        public NameValueCollection Headers { get; set; }

        /// <summary>
        /// 响应结果信息
        /// </summary>
        public string Body { get; set; }

        #endregion

        #region Constructor

        /// <summary>
        /// 构造方法
        /// </summary>
        /// <param name="response"></param>
        internal HttpResponseResult(WebResponse response)
        {
            this.Headers = new NameValueCollection();

            if (response != null)
            {
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
        /// 转换
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public T As<T>()
        {
            if (this.Body != null)
            {
                return this.Body.AsObject<T>();
            }

            return default;
        }

        public string GetJsonValue(string propertyName)
        {
            this.jObject = this.jObject ?? JObject.Parse(this.Body);

            return this.jObject.GetJsonValue(propertyName);
        }

        public T GetJsonValue<T>(string propertyName)
        {
            this.jObject = this.jObject ?? JObject.Parse(this.Body);

            return this.jObject.GetJsonValue<T>(propertyName);
        }

        #endregion
    }
}
