using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mercurius.Prime.Boot.Jwt
{
    /// <summary>
    /// 认证用户信息
    /// </summary>
    public class IdentityUser
    {
        #region Properties

        /// <summary>
        /// 用户编号
        /// </summary>
        public string Id { get; set; }

        /// <summary>
        /// 账号信息
        /// </summary>
        public string Account { get; set; }

        /// <summary>
        /// 所属平台
        /// </summary>
        public string Platform { get; set; }

        #endregion
    }
}
