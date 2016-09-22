using System;
using System.ComponentModel.DataAnnotations;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Sparrow.Entities.RBAC
{
    /// <summary>
    /// 按钮信息。
    /// </summary>
    [Table("RBAC.Button")]
    public class Button : ModificationDomain
    {
        #region 属性

        /// <summary>
        /// 编号。
        /// </summary>
        [Required]
        [Display(Name = "编号")]
        [StringLength(36, ErrorMessageResourceType = typeof(Constants), ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Id { get; set; }

        /// <summary>
        /// 名称。
        /// </summary>
        [Display(Name = "名称")]
        [StringLength(50, ErrorMessageResourceType = typeof(Constants), ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Name { get; set; }

        /// <summary>
        /// 标题。
        /// </summary>
        [Display(Name = "标题")]
        [StringLength(50, ErrorMessageResourceType = typeof(Constants), ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Title { get; set; }

        /// <summary>
        /// 按钮图标。
        /// </summary>
        [Display(Name = "图标")]
        [StringLength(50, ErrorMessageResourceType = typeof(Constants), ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Image { get; set; }

        /// <summary>
        /// JavaScript代码。
        /// </summary>
        [Display(Name = "事件")]
        [StringLength(200, ErrorMessageResourceType = typeof(Constants), ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Code { get; set; }

        /// <summary>
        /// 类型。
        /// </summary>
        [Display(Name = "类型")]
        [StringLength(50, ErrorMessageResourceType = typeof(Constants), ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Category { get; set; }

        /// <summary>
        /// 排序号。
        /// </summary>
        [Display(Name = "排序号")]
        public virtual int? Sort { get; set; }

        /// <summary>
        /// 备注信息。
        /// </summary>
        [Display(Name = "备注")]
        [StringLength(500, ErrorMessageResourceType = typeof(Constants), ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Remark { get; set; }

        /// <summary>
        /// 实体信息的状态。
        /// </summary>
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
