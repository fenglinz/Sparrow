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

namespace Mercurius.FileStorageSystem.Apis
{
    /// <summary>
    /// Web API基类。
    /// </summary>
    public static class WebApiUtil
    {
        #region 静态字段

        /// <summary>
        /// 用户不存在提醒。
        /// </summary>
        public static readonly string UserNotExists = "用户不存在！";

        #endregion

        #region 字段

        private static readonly IUserService _userService;

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        static WebApiUtil()
        {
            _userService = AutofacConfig.Container.Resolve<IUserService>();
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 获取用户详细信息。
        /// </summary>
        /// <param name="account">用户编号</param>
        /// <returns>用户信息</returns>
        internal static User GetUser(string account)
        {
            var rspUser = _userService.GetUserByAccount(account);

            if (rspUser.IsSuccess && rspUser.Data != null)
            {
                return rspUser.Data;
            }

            return null;
        }

        #endregion
    }
}
