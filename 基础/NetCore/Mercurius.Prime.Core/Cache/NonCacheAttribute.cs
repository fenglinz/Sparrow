using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Prime.Core.Cache
{
    /// <summary>
    /// 不是用缓存特性。
    /// </summary>
    [AttributeUsage(
        AttributeTargets.Interface | AttributeTargets.Method,
        AllowMultiple = false, Inherited = true)]
    public class NonCacheAttribute : Attribute
    {
        #region 属性

        /// <summary>
        /// 使用缓存。
        /// </summary>
        public bool UseCache { get; private set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        public NonCacheAttribute()
        {
            this.UseCache = false;
        }

        #endregion
    }
}
