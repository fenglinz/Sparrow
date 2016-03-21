using System.Web.Mvc;

namespace Mercurius.Sparrow.Backstage.Areas.DynamicPage
{
    /// <summary>
    /// 动态页面区域注册。
    /// </summary>
    public class DynamicPageAreaRegistration : AreaRegistration
    {
        /// <summary>
        /// 获取区域名称。
        /// </summary>
        public override string AreaName => "DynamicPage";

        /// <summary>
        /// 注册DynamicPage区域路由。
        /// </summary>
        /// <param name="context">区域上下文</param>
        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "DynamicPage_default",
                "DynamicPage/{controller}/{action}/{id}",
                new { controller = "Dynamic", action = "Index", id = UrlParameter.Optional },
                new[] { "Mercurius.Sparrow.Backstage.Areas.DynamicPage.Controllers" }
            );
        }
    }
}