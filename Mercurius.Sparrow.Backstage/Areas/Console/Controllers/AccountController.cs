using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mercurius.Sparrow.Backstage.Areas.Console.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    [AllowAnonymous]
    public class AccountController : BaseController
    {
        // GET: Console/Account
        public ActionResult LogOn()
        {
            return View();
        }
    }
}