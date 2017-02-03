using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Mercurius.Prime.Core.Entities;

namespace Mercurius.Kernel.Contracts.RBAC.Entities
{
    /// <summary>
    /// 用户信息。
    /// </summary>
    [Serializable]
	[Table("RBAC.User")]
    public class User : WithModification
    {
        #region 属性

        /// <summary>
        /// 编号。
        /// </summary>
        [Display(Name = "编号")]
        [Column("Id", IsPrimaryKey = true)]
        [StringLength(36, ErrorMessage = "编号不能超过{1}个字符。")]
        public virtual string Id { get; set; }

        /// <summary>
        /// 汇报者编号。
        /// </summary>
        [Display(Name = "汇报者编号")]
        [Column("Reporter")]
        [StringLength(36, ErrorMessage = "汇报者编号不能超过{1}个字符。")]
        public virtual string Reporter { get; set; }

        /// <summary>
        /// 用户编码。
        /// </summary>
        [Display(Name = "用户编码")]
        [Column("Code")]
        [StringLength(100, ErrorMessage = "用户编码不能超过{1}个字符。")]
        public virtual string Code { get; set; }

        /// <summary>
        /// 登录账号。
        /// </summary>
        [Display(Name = "登录账号")]
        [Column("Account")]
        [StringLength(100, ErrorMessage = "登录账号不能超过{1}个字符。")]
        public virtual string Account { get; set; }

        /// <summary>
        /// 登录密码。
        /// </summary>
        [Display(Name = "登录密码")]
        [Column("Password")]
        [StringLength(100, ErrorMessage = "登录密码不能超过{1}个字符。")]
        public virtual string Password { get; set; }

        /// <summary>
        /// 用户名。
        /// </summary>
        [Display(Name = "用户名")]
        [Column("Name")]
        [StringLength(100, ErrorMessage = "用户名不能超过{1}个字符。")]
        public virtual string Name { get; set; }

        /// <summary>
        /// 性别(0：女、1：男)。
        /// </summary>
        [Display(Name = "性别")]
        [Column("Sex")]
        public virtual int? Sex { get; set; }

        /// <summary>
        /// 职称。
        /// </summary>
        [Display(Name = "职称")]
        [Column("Title")]
        [StringLength(100, ErrorMessage = "职称不能超过{1}个字符。")]
        public virtual string Title { get; set; }

        /// <summary>
        /// 电子邮件。
        /// </summary>
        [Display(Name = "电子邮件")]
        [Column("Email")]
        [StringLength(400, ErrorMessage = "电子邮件不能超过{1}个字符。")]
        public virtual string Email { get; set; }

        /// <summary>
        /// 主题。
        /// </summary>
        [Display(Name = "主题")]
        [Column("Theme")]
        [StringLength(100, ErrorMessage = "主题不能超过{1}个字符。")]
        public virtual string Theme { get; set; }

        /// <summary>
        /// 找回密码的问题。
        /// </summary>
        [Display(Name = "找回密码的问题")]
        [Column("Question")]
        [StringLength(100, ErrorMessage = "找回密码的问题不能超过{1}个字符。")]
        public virtual string Question { get; set; }

        /// <summary>
        /// 找回密码的答案。
        /// </summary>
        [Display(Name = "找回密码的答案")]
        [Column("Answer")]
        [StringLength(100, ErrorMessage = "找回密码的答案不能超过{1}个字符。")]
        public virtual string Answer { get; set; }

        /// <summary>
        /// 备注。
        /// </summary>
        [Display(Name = "备注")]
        [Column("Remark")]
        [StringLength(500, ErrorMessage = "备注不能超过{1}个字符。")]
        public virtual string Remark { get; set; }

        /// <summary>
        /// 状态(0：删除、1：启用、2：停用)。
        /// </summary>
        [Display(Name = "状态")]
        [Column("Status")]
        public virtual int? Status { get; set; }

        #endregion

        #region 导航属性

        /// <summary>
        /// 性别名称。
        /// </summary>
        public virtual string SexName => this.Sex == 0 ? "女" : this.Sex == 1 ? "男" : "未知";

        /// <summary>
        /// 是否为汇报者。
        /// </summary>
        public bool IsReporter { get; set; }

        /// <summary>
        /// 汇报者姓名。
        /// </summary>
        public virtual string ReporterName { get; set; }

        /// <summary>
        /// 所属部门编号。
        /// </summary>
        public virtual string DepartmentId { get; set; }

        /// <summary>
        /// 所属部门名称。
        /// </summary>
        public virtual string DepartmentNames { get; set; }

        /// <summary>
        /// 所属部门。
        /// </summary>
        public virtual IList<string> Departments { get; set; }

        /// <summary>
        /// 所属角色。
        /// </summary>
        public virtual IList<string> Roles { get; set; }

        #endregion
    }
}
