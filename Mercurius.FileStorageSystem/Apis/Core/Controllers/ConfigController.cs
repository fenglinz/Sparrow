using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Xml.Linq;
using System.Xml.XPath;
using Mercurius.Sparrow.Contracts;
using static Mercurius.FileStorageSystem.Apis.WebApiUtil;

namespace Mercurius.FileStorageSystem.Apis.Core.Controllers
{
    /// <summary>
    /// 系统配置Web Api。
    /// </summary>
    [Authorize]
    public class ConfigController : ApiController
    {
        /// <summary>
        /// 修改机器密钥。
        /// </summary>
        /// <param name="account">用户账号</param>
        /// <param name="validationKey">验证密钥</param>
        /// <param name="decryptionKey">解密密钥</param>
        /// <returns>修改后结果提示</returns>
        [HttpGet]
        [Route("api/Config/{account}")]
        public Response ChangeMachineKey(string account, string validationKey, string decryptionKey)
        {
            var user = GetUser(account);

            if (user == null)
            {
                return new Response { ErrorMessage = UserNotExists };
            }

            try
            {
                var xdoc = XDocument.Load(HttpContext.Current.Server.MapPath("~/web.config"));
                var machineKey = xdoc.XPathSelectElement("//system.web/machineKey");

                machineKey.Attribute("validationKey").SetValue(validationKey);
                machineKey.Attribute("decryptionKey").SetValue(decryptionKey);

                xdoc.Save(HttpContext.Current.Server.MapPath("~/web.config"), SaveOptions.None);
            }
            catch (Exception exception)
            {
                return new Response { ErrorMessage = exception.Message };
            }

            return new Response();
        }
    }
}
