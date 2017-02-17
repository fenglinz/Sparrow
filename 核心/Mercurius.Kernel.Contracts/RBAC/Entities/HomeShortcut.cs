using System.ComponentModel.DataAnnotations;
using Mercurius.Prime.Core.Entities;

namespace Mercurius.Kernel.Contracts.RBAC.Entities
{
    /// <summary>
    /// 首页快捷方式信息。
    /// </summary>
	[Table("RBAC.HomeShortcut")]
    public class HomeShortcut : EntityBase
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
        /// 用户编号。
        /// </summary>
        [Display(Name = "用户编号")]
        [Column("UserId")]
        [StringLength(36, ErrorMessage = "用户编号不能超过{1}个字符。")]
        public virtual string UserId { get; set; }

        /// <summary>
        /// 快捷方式名称。
        /// </summary>
        [Display(Name = "名称")]
        [Column("Name")]
        [StringLength(100, ErrorMessage = "名称不能超过{1}个字符。")]
        public virtual string Name { get; set; }

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
        /// 快捷方式图标。
        /// </summary>
        [Display(Name = "图标")]
        [Column("Image")]
        [StringLength(100, ErrorMessage = "图标不能超过{1}个字符。")]
        public virtual string Image { get; set; }

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

        #endregion

        #region 导航属性

        /// <summary>
        /// 关联的用户信息。
        /// </summary>
        public virtual User User { get; set; }

        #endregion
    }
}
