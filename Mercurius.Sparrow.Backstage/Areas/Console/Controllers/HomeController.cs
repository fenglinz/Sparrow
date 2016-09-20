using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Infrastructure;

namespace Mercurius.Sparrow.Backstage.Areas.Console.Controllers
{
    /// <summary>
    /// 管理控制台控制器。
    /// </summary>
    [AllowAnonymous]
    public class HomeController : BaseController
    {
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }

        #region 加密/解密

        /// <summary>
        /// 加密、解密处理。
        /// </summary>
        /// <param name="type">类型(encrypt：加密、其他：解密)</param>
        /// <param name="source">需要处理的字符串</param>
        /// <returns>处理后的结果</returns>
        [HttpPost]
        public ActionResult EncryptOrDecrypt(string type, string source)
        {
            string result;

            try
            {
                result = type == "encrypt" ? source.Encrypt() : source.Decrypt();
            }
            catch (Exception e)
            {
                result = e.Message;
            }

            return Json(result);
        }

        #endregion
    }
}