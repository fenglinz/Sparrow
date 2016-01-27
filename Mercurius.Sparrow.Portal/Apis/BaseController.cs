using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Autofac;
using Mercurius.Sparrow.Autofac;
using Mercurius.Sparrow.Contracts.RBAC;
using Mercurius.Sparrow.Entities.RBAC;

namespace Mercurius.Sparrow.Portal.Apis
{
    /// <summary>
    /// Web API基类。
    /// </summary>
    public abstract class BaseController : ApiController
    {
        #region 静态字段

        protected static readonly string UserNotExists = "用户不存在！";

        #endregion

        #region 字段

        private readonly IUserService _userService;

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        protected BaseController()
        {
            this._userService = AutofacConfig.Container.Resolve<IUserService>();
        }

        #endregion

        #region 受保护方法

        /// <summary>
        /// 获取用户详细信息。
        /// </summary>
        /// <param name="account">用户编号</param>
        /// <returns>用户信息</returns>
        protected User GetUser(string account)
        {
            var rspUser = this._userService.GetUserByAccount(account);

            if (rspUser.IsSuccess && rspUser.Data != null)
            {
                return rspUser.Data;
            }

            return null;
        }

        #endregion
    }
}
