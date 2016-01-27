using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;
using Mercurius.Siskin.Contracts;
using Mercurius.Siskin.Contracts.RBAC;
using Mercurius.Siskin.Entities.RBAC;

namespace Mercurius.Siskin.Portal.Apis.Core.Controllers
{
    /// <summary>
    /// 用户登录Web API。
    /// </summary>
    public class AccountController : BaseController
    {
        #region 属性

        public IUserService UserService { get; set; }

        #endregion

        /// <summary>
        /// 用户登录
        /// </summary>
        /// <param name="account">账号</param>
        /// <param name="password">密码</param>
        /// <returns>是否登录成功</returns>
        [HttpPost]
        [Authorize]
        [Route("api/Account/{account}/{password}")]
        public Response<User> LogOn(string account, string password)
        {
            return this.UserService.ValidateUser(account, password);
        }
    }
}
