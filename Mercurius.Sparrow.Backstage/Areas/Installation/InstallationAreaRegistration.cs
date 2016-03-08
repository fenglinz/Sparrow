using System.Web.Mvc;

namespace Mercurius.Sparrow.Backstage.Areas.Installation
{
    /// <summary>
    /// 程序安装区域。
    /// </summary>
    public class InstallationAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Installation";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Installation_default",
                "Installation/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new [] { "Mercurius.Sparrow.Backstage.Areas.Installation.Controllers" }
            );
        }
    }
}