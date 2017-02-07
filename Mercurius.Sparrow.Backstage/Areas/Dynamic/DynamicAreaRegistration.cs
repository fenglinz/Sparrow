using System.Web.Mvc;

namespace Mercurius.Sparrow.Backstage.Areas.Dynamic
{
    /// <summary>
    /// 动态页面区域注册。
    /// </summary>
    public class DynamicAreaRegistration : AreaRegistration
    {
        /// <summary>
        /// 获取区域名称。
        /// </summary>
        public override string AreaName => "Dynamic";

        /// <summary>
        /// 注册DynamicPage区域路由。
        /// </summary>
        /// <param name="context">区域上下文</param>
        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Dynamic_default",
                "Dynamic/{controller}/{action}/{id}",
                new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                new[] { "Mercurius.Sparrow.Backstage.Areas.Dynamic.Controllers" }
            );
        }
    }
}