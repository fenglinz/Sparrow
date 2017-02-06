using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Autofac;

namespace Mercurius.Kernel.WebCores
{
    /// <summary>
    /// Autofac配置信息。
    /// </summary>
    public static class AutofacServiceLocator
    {
        #region 属性

        /// <summary>
        /// Autofac容器。
        /// </summary>
        public static IContainer Container { get; set; }

        #endregion
    }
}
