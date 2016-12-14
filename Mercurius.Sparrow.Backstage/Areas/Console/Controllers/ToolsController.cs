using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Mvc.Extensions;

namespace Mercurius.Sparrow.Backstage.Areas.Console.Controllers
{
    /// <summary>
    /// 工具控制器。
    /// </summary>
    public class ToolsController : BaseController
    {
        /// <summary>
        /// 显示加密/解密界面。
        /// </summary>
        /// <returns>加密/解密界面</returns>
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 加密/解密处理。
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

            return PartialView("_Result", result);
        }

        /// <summary>
        /// 字符串的base64编码解码。
        /// </summary>
        /// <param name="type">类型(encrypt：编码、其他：解码)</param>
        /// <param name="source">源字符串</param>
        /// <returns>操作结果</returns>
        [HttpPost]
        public ActionResult Base64(string type, string source)
        {
            string result;

            try
            {
                result = type == "encrypt" ? Convert.ToBase64String(Encoding.UTF8.GetBytes(source)) : Encoding.UTF8.GetString(Convert.FromBase64String(source));
            }
            catch (Exception e)
            {
                result = e.Message;
            }

            return PartialView("_Result", result);
        }

        /// <summary>
        /// 字符串的url编码解码。
        /// </summary>
        /// <param name="type">类型(encrypt：编码、其他：解码)</param>
        /// <param name="source">源字符串</param>
        /// <returns>操作结果</returns>
        [HttpPost]
        public new ActionResult Url(string type, string source)
        {
            var result = type == "encrypt" ? HttpUtility.UrlEncode(source) : HttpUtility.UrlDecode(source);

            return PartialView("_Result", result);
        }
    }
}