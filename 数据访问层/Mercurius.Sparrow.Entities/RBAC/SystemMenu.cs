using System;
using System.ComponentModel.DataAnnotations;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Sparrow.Entities.RBAC
{
    /// <summary>
    /// 系统菜单信息。
    /// </summary>
	[Table("RBAC.SystemMenu")]
    public partial class SystemMenu : ModificationDomain, IHierarchy<string>
    {
        #region 属性

        /// <summary>
        /// 系统菜单编号。
        /// </summary>
        [Required]
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Id { get; set; }

        /// <summary>
        /// 父菜单编号。
        /// </summary>
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string ParentId { get; set; }

        /// <summary>
        /// 菜单名称。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Name { get; set; }

        /// <summary>
        /// 菜单标题。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Title { get; set; }

        /// <summary>
        /// 菜单图标。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Image { get; set; }

        /// <summary>
        /// 菜单类型。
        /// </summary>
        public virtual int? Category { get; set; }

        /// <summary>
        /// 导航地址。
        /// </summary>
        [StringLength(200, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string NavigateUrl { get; set; }

        /// <summary>
        /// 目标。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Target { get; set; }

        /// <summary>
        /// 排序号。
        /// </summary>
        public virtual int? Sort { get; set; }

        /// <summary>
        /// 实体信息的状态。
        /// </summary>
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
