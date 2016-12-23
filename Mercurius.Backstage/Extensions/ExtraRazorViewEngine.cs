using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mercurius.Backstage.Extensions
{
    /// <summary>
    /// Razar视图引擎扩展类。
    /// </summary>
    public class ExtraRazorViewEngine : RazorViewEngine
    {
        /// <summary>
        /// 构造方法(区域查找以查找插件所在目录为准)。
        /// </summary>
        public ExtraRazorViewEngine()
        {
            this.AreaViewLocationFormats = new[] { "~/Plugins/{2}/Views/{1}/{0}.cshtml", "~/Areas/{2}/Views/{1}/{0}.cshtml", "~/Areas/{2}/Views/Shared/{0}.cshtml" };
        }
    }
}