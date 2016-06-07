using System.Web.Mvc;

namespace Mercurius.Sparrow.Backstage.Areas.NewsCenter
{
    /// <summary>
    /// 新闻中心区域注册。
    /// </summary>
    public class NewsCenterAreaRegistration : AreaRegistration
    {
        /// <summary>
        /// 区域名称。
        /// </summary>
        public override string AreaName => "NewsCenter";

        /// <summary>
        /// 注册NewsCenter区域路由。
        /// </summary>
        /// <param name="context">区域上下文</param>
        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "NewsCenter_default",
                "NewsCenter/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}