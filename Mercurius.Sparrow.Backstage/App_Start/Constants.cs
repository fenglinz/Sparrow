using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mercurius.Sparrow.Backstage
{
    /// <summary>
    /// 常量定义。
    /// </summary>
    public static class Constants
    {
        /// <summary>
        /// 控制台登录权限认证token。
        /// </summary>
        public static readonly string ConsoleManagerToken = "ConsoleManagerToken";

        /// <summary>
        /// 控制台登录权限认证有效时间(分钟)。
        /// </summary>
        public static readonly int ConsoleManagerTokenExpires = 10;

        /// <summary>
        /// 控制台登录验证信息保存地址。
        /// </summary>
        public static readonly string ConsoleManagerStoragePath = HttpContext.Current.Server.MapPath("~/App_Data/console.dat");
    }
}