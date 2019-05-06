using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mercurius.Prime.Boot.Jwt
{
    /// <summary>
    /// 访问身份信息。
    /// </summary>
    public class AccessIdentity
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

        #endregion
    }
}
