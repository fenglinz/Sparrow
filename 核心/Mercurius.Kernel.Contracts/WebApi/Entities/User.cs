using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using Mercurius.Prime.Core.Entities;

namespace Mercurius.Kernel.Contracts.WebApi.Entities
{
    /// <summary>
    /// WebApi用户。
    /// </summary>
    [Table("WebApi.User")]
    public class User : WithModification
    {
        #region 属性

        /// <summary>
        /// 编号。
        /// </summary>
        [Display(Name = "编号")]
        public virtual int Id { get; set; }

        /// <summary>
        /// 账号。
        /// </summary>
        [Display(Name = "账号")]
        [StringLength(50, ErrorMessage = "账号不能超过{1}个字符。")]
        public virtual string Account { get; set; }

        /// <summary>
        /// 密码。
        /// </summary>
        [Display(Name = "密码")]
        [StringLength(50, ErrorMessage = "密码不能超过{1}个字符。")]
        public virtual string Password { get; set; }

        /// <summary>
        /// 使用者描述。
        /// </summary>
        [Display(Name = "使用者描述")]
        [StringLength(2000, ErrorMessage = "使用者描述不能超过{1}个字符。")]
        public virtual string Description { get; set; }

        /// <summary>
        /// 状态。
        /// </summary>
        [Display(Name = "状态")]
        public virtual int? Status { get; set; }

        #endregion

        #region 业务属性

        /// <summary>
        /// 是否修改密码。
        /// </summary>
        public bool ChangePassword { get; set; }

        #endregion
    }
}
