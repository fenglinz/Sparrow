using System.Web.Mvc;

namespace Mercurius.Siskin.Backstage.Areas.DynamicPage
{
    public class DynamicPageAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "DynamicPage";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "DynamicPage_default",
                "DynamicPage/{controller}/{action}/{id}",
                new { controller = "Dynamic", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}