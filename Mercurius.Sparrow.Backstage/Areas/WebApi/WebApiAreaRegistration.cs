using System.Web.Mvc;

namespace Mercurius.Sparrow.Backstage.Areas.WebApi
{
    public class WebApiAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "WebApi";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "WebApi_default",
                "WebApi/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}