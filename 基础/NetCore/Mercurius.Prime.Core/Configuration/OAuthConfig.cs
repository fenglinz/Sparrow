using System;
using System.Collections.Generic;
using System.Text;

namespace Mercurius.Prime.Core.Configuration
{
    public class OAuthConfig
    {
        #region Properties

        /// <summary>
        /// 发行人
        /// </summary>
        public string Issuer { get; set; }

        /// <summary>
        /// 观众
        /// </summary>
        public string Audience { get; set; }

        /// <summary>
        /// 发行人加密key
        /// </summary>
        public string IssuerKey { get; set; }

        /// <summary>
        /// token过期时间(分钟)
        /// </summary>
        public int TokenExpire { get; set; } = 30;

        /// <summary>
        /// refresh token过期时间(天)
        /// </summary>
        public int RefreshTokenExpire { get; set; } = 7;

        #endregion
    }
}
