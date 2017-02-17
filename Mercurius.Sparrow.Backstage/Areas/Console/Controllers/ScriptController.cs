using System.Web.Mvc;

namespace Mercurius.Sparrow.Backstage.Areas.Console.Controllers
{
    /// <summary>
    /// Web应用程序安装控制器。
    /// </summary>
    [AllowAnonymous]
    public class ScriptController : BaseController
    {
        /// <summary>
        /// 显示生成数据库脚本的界面。
        /// </summary>
        /// <returns>视图</returns>
        public ActionResult Generate()
        {
            return View();
        }

        /// <summary>
        /// 显示应用程序安装界面。
        /// </summary>
        /// <returns>显示视图</returns>
        public ActionResult Install()
        {
            return View();
        }
    }
}