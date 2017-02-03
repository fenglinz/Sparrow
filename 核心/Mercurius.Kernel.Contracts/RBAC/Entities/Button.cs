using System;
using System.ComponentModel.DataAnnotations;
using Mercurius.Prime.Core.Entities;

namespace Mercurius.Kernel.Contracts.RBAC.Entities
{
    /// <summary>
    /// 按钮信息。
    /// </summary>
    [Table("RBAC.Button")]
    public class Button : WithModification
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
        /// 按钮名称。
        /// </summary>
        [Display(Name = "名称")]
        [Column("Name")]
        [StringLength(100, ErrorMessage = "按钮名称不能超过{1}个字符。")]
        public virtual string Name { get; set; }

        /// <summary>
        /// 按钮标题。
        /// </summary>
        [Display(Name = "标题")]
        [Column("Title")]
        [StringLength(100, ErrorMessage = "按钮标题不能超过{1}个字符。")]
        public virtual string Title { get; set; }

        /// <summary>
        /// 按钮图标。
        /// </summary>
        [Display(Name = "图标")]
        [Column("Image")]
        [StringLength(100, ErrorMessage = "按钮图标不能超过{1}个字符。")]
        public virtual string Image { get; set; }

        /// <summary>
        /// 按钮代码。
        /// </summary>
        [Display(Name = "代码")]
        [Column("Code")]
        [StringLength(400, ErrorMessage = "按钮代码不能超过{1}个字符。")]
        public virtual string Code { get; set; }

        /// <summary>
        /// 排序号。
        /// </summary>
        [Display(Name = "排序号")]
        [Column("Sort")]
        public virtual int? Sort { get; set; }

        /// <summary>
        /// 按钮分类。
        /// </summary>
        [Display(Name = "分类")]
        [Column("Category")]
        [StringLength(100, ErrorMessage = "按钮分类不能超过{1}个字符。")]
        public virtual string Category { get; set; }

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

        #region 业务属性

        /// <summary>
        /// 是否已经分配给菜单。
        /// </summary>
        [Column(IsIgnore = true)]
        public bool IsAllotToSystemMenu { get; set; }

        #endregion
    }
}
