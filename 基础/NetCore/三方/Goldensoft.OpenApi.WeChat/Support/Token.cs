using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace Goldensoft.OpenApi.WeChat
{
    /// <summary>
    /// 接口访问token信息
    /// </summary>
    public class Token
    {
        #region Properties

        /// <summary>
        /// 错误编码
        /// </summary>
        [JsonProperty("errcode")]
        public string ErrorCode { get; set; }

        /// <summary>
        /// 错误信息
        /// </summary>
        [JsonProperty("errmsg")]
        public string ErrorMessage { get; set; }

        /// <summary>
        /// 网页授权接口调用凭证(与基础access token不同)
        /// </summary>
        [JsonProperty("access_token")]
        public string AccessToken { get; set; }

        /// <summary>
        /// access_token接口调用凭证超时时间，单位（秒）
        /// </summary>
        [JsonProperty("expires_in")]
        public int ExpiresIn { get; set; }

        /// <summary>
        /// 用户刷新access_token
        /// </summary>
        [JsonProperty("refresh_token")]
        public string RefreshToken { get; set; }

        /// <summary>
        /// 用户唯一标识
        /// </summary>
        [JsonProperty("openid")]
        public string OpenId { get; set; }

        /// <summary>
        /// 用户授权的作用域
        /// </summary>
        [JsonProperty("scope")]
        public string Scope { get; set; }

        #endregion
    }
}
