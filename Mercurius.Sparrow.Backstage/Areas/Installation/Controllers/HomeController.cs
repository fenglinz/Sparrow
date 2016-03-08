using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mercurius.Sparrow.Backstage.Areas.Installation.Controllers
{
    /// <summary>
    /// 安装首页。
    /// </summary>
    [AllowAnonymous]
    public class HomeController : BaseController
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Initialization()
        {
            return View("Index");
        }
    }
}