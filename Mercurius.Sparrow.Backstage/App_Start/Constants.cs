using System.Web;
using Mercurius.Prime.Core;

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
        /// 控制台管理员账号。
        /// </summary>
        public static readonly string ConsoleManagerAccount = "admin";

        /// <summary>
        /// 控制台管理员默认密码。
        /// </summary>
        public static readonly string ConsoleManagerDefaultPassword = "admin";

        /// <summary>
        /// 控制台登录验证信息保存地址。
        /// </summary>
        public static readonly string ConsoleManagerStoragePath = HttpContext.Current.Server.MapPath("~/App_Data/console.dat");

        #region 公开方法

        /// <summary>
        /// 生成控制台管理token。
        /// </summary>
        /// <param name="password">密码</param>
        /// <returns>token值</returns>
        public static string GenerateConsoleManagerToken(string password)
        {
            return $"{ConsoleManagerAccount}--->{password}".MD5();
        }

        #endregion
    }
}