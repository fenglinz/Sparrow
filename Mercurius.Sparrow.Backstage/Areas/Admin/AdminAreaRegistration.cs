using System.Web.Mvc;

namespace Mercurius.Sparrow.Backstage.Areas.Admin
{
    /// <summary>
    /// 权限管理区域注册。
    /// </summary>
    public class AdminAreaRegistration : AreaRegistration
    {
        /// <summary>
        /// 获取区域名称。
        /// </summary>
        public override string AreaName => "Admin";

        /// <summary>
        /// 注册Admin区域路由。
        /// </summary>
        /// <param name="context">区域注册上下文对象</param>
        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new[] { "Mercurius.Sparrow.Backstage.Areas.Admin.Controllers" });
        }
    }
}
