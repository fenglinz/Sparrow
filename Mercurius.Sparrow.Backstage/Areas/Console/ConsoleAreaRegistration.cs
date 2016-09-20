using System.Web.Mvc;

namespace Mercurius.Sparrow.Backstage.Areas.Console
{
    /// <summary>
    /// 注册管理控制台区域。
    /// </summary>
    public class ConsoleAreaRegistration : AreaRegistration
    {
        /// <summary>
        /// 获取区域名称。
        /// </summary>
        public override string AreaName => "Console";

        /// <summary>
        /// 注册Console区域路由。
        /// </summary>
        /// <param name="context">区域上下文</param>
        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Console_default",
                "Console/{controller}/{action}/{id}",
                new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                new[] { "Mercurius.Sparrow.Backstage.Areas.Console.Controllers" }
            );
        }
    }
}