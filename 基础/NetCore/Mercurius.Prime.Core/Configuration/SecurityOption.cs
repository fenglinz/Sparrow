using System;
using System.Collections.Generic;
using System.Text;

namespace Mercurius.Prime.Core.Configuration
{
    /// <summary>
    /// 安全配置选项
    /// </summary>
    public class SecurityOption
    {
        #region Properties

        /// <summary>
        /// AES加密键
        /// </summary>
        public string AESKey { get; set; }

        /// <summary>
        /// AES向量
        /// </summary>
        public string AESIV { get; set; }

        #endregion
    }
}
