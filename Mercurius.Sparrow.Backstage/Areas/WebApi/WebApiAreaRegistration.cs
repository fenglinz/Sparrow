using System.Web.Mvc;

namespace Mercurius.Sparrow.Backstage.Areas.WebApi
{
    /// <summary>
    /// Web Api区域注册。
    /// </summary>
    public class WebApiAreaRegistration : AreaRegistration
    {
        /// <summary>
        /// 获取区域名称。
        /// </summary>
        public override string AreaName => "WebApi";

        /// <summary>
        /// 注册WebApi区域路由。
        /// </summary>
        /// <param name="context">区域上下文</param>
        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "WebApi_default",
                "WebApi/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new[] { "Mercurius.Sparrow.Backstage.Areas.WebApi.Controllers" }
            );
        }
    }
}