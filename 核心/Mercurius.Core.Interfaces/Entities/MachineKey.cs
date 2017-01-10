using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mercurius.Core.Interfaces.Entities
{
    /// <summary>
    /// 计算机密钥。
    /// </summary>
    public class MachineKey
    {
        #region 属性

        /// <summary>
        /// 验证密钥。
        /// </summary>
        public string ValidationKey { get; set; }

        /// <summary>
        /// 加密密钥。
        /// </summary>
        public string DecryptionKey { get; set; }

        #endregion

        #region 公开方法

        /// <summary>
        /// 验证计算机密钥。
        /// </summary>
        /// <returns>是否通过验证</returns>
        public bool IsValid()
        {
            return this.ValidationKey?.Length == 128 && this.DecryptionKey?.Length == 48;
        }

        #endregion
    }
}