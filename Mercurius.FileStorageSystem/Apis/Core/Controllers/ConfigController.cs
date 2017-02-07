using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Xml.Linq;
using System.Xml.XPath;
using Mercurius.Kernel.Contracts.Storage.Entities;
using Mercurius.Prime.Core.Services;
using static Mercurius.WebApi.Extensions.WebApiExtrnsions;

namespace Mercurius.FileStorageSystem.Apis.Core.Controllers
{
    /// <summary>
    /// 系统配置Web Api。
    /// </summary>
    [Authorize]
    public class ConfigController : ApiController
    {
        #region 公开方法

        /// <summary>
        /// 获取计算机密钥。
        /// </summary>
        /// <param name="account">账号</param>
        /// <returns>计算机密钥</returns>
        [HttpGet]
        [Route("api/Config/{account}")]
        public async Task<Response<MachineKey>> GetMachineKey(string account)
        {
            var user = GetUser(account);

            if (user == null)
            {
                return new Response<MachineKey> { ErrorMessage = UserNotExists };
            }

            var webConfigPath = HttpContext.Current.Server.MapPath("~/web.config");

            return await Task.Run(() =>
            {
                var xdoc = XDocument.Load(webConfigPath);
                var machineKeyElement = xdoc.XPathSelectElement("//system.web/machineKey");

                return new Response<MachineKey>
                {
                    Data = new MachineKey
                    {
                        ValidationKey = machineKeyElement.Attribute("validationKey").Value,
                        DecryptionKey = machineKeyElement.Attribute("decryptionKey").Value
                    }
                };
            });
        }

        /// <summary>
        /// 修改机器密钥。
        /// </summary>
        /// <param name="account">用户账号</param>
        /// <param name="machineKey">计算机密钥</param>
        /// <returns>修改后结果提示</returns>
        [HttpPost]
        [Route("api/Config/{account}")]
        public async Task<Response> ChangeMachineKey(string account, MachineKey machineKey)
        {
            var user = GetUser(account);

            if (user == null)
            {
                return new Response { ErrorMessage = UserNotExists };
            }

            if (machineKey?.IsValid() != true)
            {
                return new Response { ErrorMessage = "计算机密钥信息必须要有符合要求(验证密钥长128，加密密钥长48)！" };
            }

            try
            {
                var webConfigPath = HttpContext.Current.Server.MapPath("~/web.config");

                await Task.Run(() =>
                {
                    var xdoc = XDocument.Load(webConfigPath);
                    var machineKeyElement = xdoc.XPathSelectElement("//system.web/machineKey");

                    machineKeyElement.Attribute("validationKey").SetValue(machineKey.ValidationKey);
                    machineKeyElement.Attribute("decryptionKey").SetValue(machineKey.DecryptionKey);

                    xdoc.Save(webConfigPath, SaveOptions.None);
                });
            }
            catch (Exception exception)
            {
                return new Response { ErrorMessage = exception.Message };
            }

            return new Response();
        }

        #endregion
    }
}
