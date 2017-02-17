using Newtonsoft.Json;

namespace Mercurius.Prime.Core.Entities
{
    /// <summary>
    /// Web API token信息。
    /// </summary>
    public class Token
    {
        #region 属性

        /// <summary>
        /// Access Token。
        /// </summary>
        [JsonProperty("access_token")]
        public string AccessToken { get; set; }

        /// <summary>
        /// token类型。
        /// </summary>
        [JsonProperty("token_type")]
        public string TokenType { get; set; }

        /// <summary>
        /// token时效时长(秒)。
        /// </summary>
        [JsonProperty("expires_in")]
        public int ExpiresIn { get; set; }

        #endregion
    }
}
