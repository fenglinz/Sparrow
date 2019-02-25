using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Mercurius.Prime.Boot.Web
{
    /// <summary>
    /// 过滤器配置。
    /// </summary>
    public class FilterConfig
    {
        /// <summary>
        /// 注册全局过滤器。
        /// </summary>
        /// <param name="filters">过滤器集合</param>
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
