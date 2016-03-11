using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mercurius.Sparrow.Backstage.Areas.Admin.Controllers
{
    /// <summary>
    /// Web应用程序安装控制器。
    /// </summary>
    [AllowAnonymous]
    public class InstallController : BaseController
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}