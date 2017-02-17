using System.ComponentModel.DataAnnotations;

namespace Mercurius.Sparrow.Backstage.Areas.Console.Models.Install
{
    /// <summary>
    /// 数据库信息。
    /// </summary>
    public class Database
    {
        #region 属性

        /// <summary>
        /// 数据库服务器地址。
        /// </summary>
        [Display(Name = "数据库服务器地址")]
        public string Host { get; set; }

        /// <summary>
        /// 登录账户。
        /// </summary>
        [Display(Name = "登录账号")]
        public string Account { get; set; }

        /// <summary>
        /// 登录密码。
        /// </summary>
        [Display(Name = "登录密码")]
        public string Password { get; set; }

        /// <summary>
        /// 数据库实例名。
        /// </summary>
        [Display(Name = "数据库名称")]
        public string DatabaseName { get; set; }

        #endregion
    }
}