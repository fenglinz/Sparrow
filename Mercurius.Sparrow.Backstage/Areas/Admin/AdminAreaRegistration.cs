using System.Web.Mvc;

namespace Mercurius.Siskin.Backstage.Areas.Admin
{
    /// <summary>
    /// Admin区域注册类。
    /// </summary>
    public class AdminAreaRegistration : AreaRegistration
    {
        #region 属性

        /// <summary>
        /// 获取区域名称。
        /// </summary>
        public override string AreaName
        {
            get
            {
                return "Admin";
            }
        }

        #endregion

        #region 重写基类方法

        /// <summary>
        /// 注册Admin区域路由。
        /// </summary>
        /// <param name="context">区域注册上下文对象</param>
        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional });
        }

        #endregion
    }
}
