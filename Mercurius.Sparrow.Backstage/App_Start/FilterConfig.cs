using System.Web;
using System.Web.Mvc;
using Mercurius.Sparrow.Mvc.Extensions;

namespace Mercurius.Sparrow.Backstage
{
    /// <summary>
    /// 过滤器配置。
    /// </summary>
    public class FilterConfig
    {
        /// <summary>
        /// 注册过滤器。
        /// </summary>
        /// <param name="filters">过滤器集合</param>
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
            filters.Add(new ConsoleAuthorizeAttribute());
            filters.Add(new MercuriusAuthorizeAttribute());
        }
    }
}