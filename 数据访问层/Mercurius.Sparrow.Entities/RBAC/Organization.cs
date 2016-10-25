using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Sparrow.Entities.RBAC
{
    /// <summary>
    /// 组织机构/部门信息。
    /// </summary>
	[Table("RBAC.Organization")]
    public class Organization : ModificationDomain, IHierarchy<string>
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
        /// 上级部门编号。
        /// </summary>
        [Display(Name = "上级部门编号")]
        [Column("ParentId")]
        [StringLength(36, ErrorMessage = "上级部门编号不能超过{1}个字符。")]
        public virtual string ParentId { get; set; }

        /// <summary>
        /// 部门编码。
        /// </summary>
        [Display(Name = "部门编码")]
        [Column("Code")]
        [StringLength(100, ErrorMessage = "部门编码不能超过{1}个字符。")]
        public virtual string Code { get; set; }

        /// <summary>
        /// 部门名称。
        /// </summary>
        [Display(Name = "部门名称")]
        [Column("Name")]
        [StringLength(100, ErrorMessage = "部门名称不能超过{1}个字符。")]
        public virtual string Name { get; set; }

        /// <summary>
        /// 内部电话号码。
        /// </summary>
        [Display(Name = "内部电话号码")]
        [Column("InnerPhone")]
        [StringLength(100, ErrorMessage = "内部电话号码不能超过{1}个字符。")]
        public virtual string InnerPhone { get; set; }

        /// <summary>
        /// 外部电话号码。
        /// </summary>
        [Display(Name = "外部电话号码")]
        [Column("OuterPhone")]
        [StringLength(100, ErrorMessage = "外部电话号码不能超过{1}个字符。")]
        public virtual string OuterPhone { get; set; }

        /// <summary>
        /// 部门经理编号。
        /// </summary>
        [Display(Name = "部门经理编号")]
        [Column("Manager")]
        [StringLength(36, ErrorMessage = "部门经理编号不能超过{1}个字符。")]
        public virtual string Manager { get; set; }

        /// <summary>
        /// 部门助理编号。
        /// </summary>
        [Display(Name = "部门助理编号")]
        [Column("AssistantManager")]
        [StringLength(36, ErrorMessage = "部门助理编号不能超过{1}个字符。")]
        public virtual string AssistantManager { get; set; }

        /// <summary>
        /// 传真。
        /// </summary>
        [Display(Name = "传真")]
        [Column("Fax")]
        [StringLength(100, ErrorMessage = "传真不能超过{1}个字符。")]
        public virtual string Fax { get; set; }

        /// <summary>
        /// 邮编。
        /// </summary>
        [Display(Name = "邮编")]
        [Column("ZipCode")]
        [StringLength(100, ErrorMessage = "邮编不能超过{1}个字符。")]
        public virtual string ZipCode { get; set; }

        /// <summary>
        /// 地址。
        /// </summary>
        [Display(Name = "地址")]
        [Column("Address")]
        [StringLength(400, ErrorMessage = "地址不能超过{1}个字符。")]
        public virtual string Address { get; set; }

        /// <summary>
        /// 排序号。
        /// </summary>
        [Display(Name = "排序号")]
        [Column("Sort")]
        public virtual int? Sort { get; set; }

        /// <summary>
        /// 备注。
        /// </summary>
        [Display(Name = "备注")]
        [Column("Remark")]
        [StringLength(500, ErrorMessage = "备注不能超过{1}个字符。")]
        public virtual string Remark { get; set; }

        /// <summary>
        /// 状态(0：删除、1：有效)。
        /// </summary>
        [Display(Name = "状态")]
        [Column("Status")]
        public virtual int? Status { get; set; }

        #endregion

        #region 导航属性

        /// <summary>
        /// 部门负责人姓名。
        /// </summary>
        [Display(Name = "部门负责人")]
        public virtual string ManagerName { get; set; }

        /// <summary>
        /// 部门助理姓名。
        /// </summary>
        [Display(Name = "部门助理")]
        public virtual string AssistantManagerName { get; set; }

        #endregion
    }
}
