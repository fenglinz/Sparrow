using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mercurius.Backstage.Plugins
{
    /// <summary>
    /// 插件项信息。
    /// </summary>
    public class PluginItem
    {
        #region 属性

        /// <summary>
        /// 控制器类型。
        /// </summary>
        public Type Controller { get; set; }

        #endregion
    }
}