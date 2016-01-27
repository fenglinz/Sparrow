using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Siskin.Entities.RBAC
{
    /// <summary>
    /// 用户信息。
    /// </summary>
	[Table("RBAC.User")]
    public class User : ModificationDomain
    {
        #region 属性

        /// <summary>
        /// 获取或者设置用户编号。
        /// </summary>
        [Required]
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Id { get; set; }

        /// <summary>
        /// 报告人。
        /// </summary>
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Reporter { get; set; }

        /// <summary>
        /// 获取或者设置用户代号。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Code { get; set; }

        /// <summary>
        /// 获取或者设置用户登录账号。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Account { get; set; }

        /// <summary>
        /// 获取或者设置用户登录密码。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Password { get; set; }

        /// <summary>
        /// 获取或者设置用户名称。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Name { get; set; }

        /// <summary>
        /// 获取或者设置性别。
        /// </summary>
        public virtual int? Sex { get; set; }

        /// <summary>
        /// 获取或者设置职称。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Title { get; set; }

        /// <summary>
        /// 获取或者设置电子邮件。
        /// </summary>
        [StringLength(200, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Email { get; set; }

        /// <summary>
        /// 获取或者设置用户选择的样式。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Theme { get; set; }

        /// <summary>
        /// 获取或者设置密码提示问题。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Question { get; set; }

        /// <summary>
        /// 获取或者设置密码提示答案。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Answer { get; set; }

        /// <summary>
        /// 获取或者设置备注信息。
        /// </summary>
        [StringLength(500, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Remark { get; set; }

        /// <summary>
        /// 获取或者设置实体信息的状态。
        /// </summary>
        public virtual int? Status { get; set; }

        #endregion

        #region 导航属性

        /// <summary>
        /// 获取性别名称。
        /// </summary>
        public virtual string SexName
        {
            get
            {
                return this.Sex == 0 ? "女" : this.Sex == 1 ? "男" : "未知";
            }
        }

        /// <summary>
        /// 获取或者设置汇报者姓名。
        /// </summary>
        public virtual string ReporterName { get; set; }

        /// <summary>
        /// 获取或者设置所属部门名称。
        /// </summary>
        public virtual string DepartmentNames { get; set; }

        /// <summary>
        /// 获取或者设置所属部门。
        /// </summary>
        public virtual IList<string> Departments { get; set; }

        /// <summary>
        /// 获取或者设置所属角色。
        /// </summary>
        public virtual IList<string> Roles { get; set; }

        /// <summary>
        /// 获取或者设置所属工作组。
        /// </summary>
        public virtual IList<string> UserGroups { get; set; }

        #endregion
    }
}
