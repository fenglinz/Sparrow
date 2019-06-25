using System;
using System.Collections.Generic;
using System.Text;

namespace Mercurius.Prime.Core.Configuration
{
    /// <summary>
    /// OAuth配置信息
    /// </summary>
    public class OAuthOption
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
        public int TokenExpire { get; set; } = 120;

        /// <summary>
        /// refresh token过期时间(天)
        /// </summary>
        public int RefreshTokenExpire { get; set; } = 120;

        /// <summary>
        /// 用户
        /// </summary>
        public IEnumerable<OAuthUser> Users { get; set; }

        #endregion
    }

    /// <summary>
    /// OAuth用户
    /// </summary>
    public class OAuthUser
    {
        #region Properties

        /// <summary>
        /// 账号
        /// </summary>
        public string Account { get; set; }

        /// <summary>
        /// 密码
        /// </summary>
        public string Password { get; set; }

        /// <summary>
        /// 所属角色
        /// </summary>
        public string RoleName { get; set; }

        #endregion
    }
}
