using System;
using System.ComponentModel.DataAnnotations;
using Mercurius.Prime.Core.Entities;

namespace Mercurius.Core.Interfaces.Entities
{
    /// <summary>
    /// 系统菜单信息。
    /// </summary>
	[Table("RBAC.SystemMenu")]
    public partial class SystemMenu : WithModification, IHierarchy<string>
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
        /// 父节点主键。
        /// </summary>
        [Display(Name = "父节点编号")]
        [Column("ParentId")]
        [StringLength(100, ErrorMessage = "父节点编号不能超过{1}个字符。")]
        public virtual string ParentId { get; set; }

        /// <summary>
        /// 菜单名称。
        /// </summary>
        [Display(Name = "名称")]
        [Column("Name")]
        [StringLength(100, ErrorMessage = "名称不能超过{1}个字符。")]
        public virtual string Name { get; set; }

        /// <summary>
        /// 标题。
        /// </summary>
        [Display(Name = "标题")]
        [Column("Title")]
        [StringLength(100, ErrorMessage = "标题不能超过{1}个字符。")]
        public virtual string Title { get; set; }

        /// <summary>
        /// 菜单图标。
        /// </summary>
        [Display(Name = "图标")]
        [Column("Image")]
        [StringLength(100, ErrorMessage = "图标不能超过{1}个字符。")]
        public virtual string Image { get; set; }

        /// <summary>
        /// 菜单分类。
        /// </summary>
        [Display(Name = "分类")]
        [Column("Category")]
        public virtual int? Category { get; set; }

        /// <summary>
        /// 导航地址。
        /// </summary>
        [Display(Name = "导航地址")]
        [Column("NavigateUrl")]
        [StringLength(400, ErrorMessage = "导航地址不能超过{1}个字符。")]
        public virtual string NavigateUrl { get; set; }

        /// <summary>
        /// 目标。
        /// </summary>
        [Display(Name = "目标")]
        [Column("Target")]
        [StringLength(100, ErrorMessage = "目标不能超过{1}个字符。")]
        public virtual string Target { get; set; }

        /// <summary>
        /// 排序码。
        /// </summary>
        [Display(Name = "排序码")]
        [Column("Sort")]
        public virtual int? Sort { get; set; }

        /// <summary>
        /// 状态(0：删除、1：有效)。
        /// </summary>
        [Display(Name = "状态")]
        [Column("Status")]
        public virtual int? Status { get; set; }

        #endregion

        #region 业务属性

        /// <summary>
        /// 完整的排序号(父节点排序号+"-"+当前排序号)。
        /// </summary>
        public virtual string FullSort { get; set; }

        /// <summary>
        /// 用户是否具有访问权限。
        /// </summary>
        public virtual bool CanAccess { get; set; }

        /// <summary>
        /// 是否存在按钮配置。
        /// </summary>
        public virtual bool ExistsButton { get; set; }

        #endregion
    }
}
