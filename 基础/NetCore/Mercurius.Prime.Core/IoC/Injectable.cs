using System;
using System.Collections.Generic;
using System.Text;

namespace Mercurius.Prime.Core.IoC
{
    /// <summary>
    /// 启用依赖注入的接口
    /// </summary>
    public interface Injectable
    {
        /// <summary>
        /// 激活后的处理。
        /// </summary>
        /// <param name="this">当前对象</param>
        void OnActivated(object @this);

        /// <summary>
        /// 对象释放后的处理
        /// </summary>
        /// <param name="this">当前对象</param>
        void OnRelease(object @this);
    }
}
