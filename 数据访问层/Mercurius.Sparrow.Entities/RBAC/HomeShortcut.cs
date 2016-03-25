using System;
using System.ComponentModel.DataAnnotations;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Sparrow.Entities.RBAC
{
    /// <summary>
    /// 首页快捷方式信息。
    /// </summary>
	[Table("RBAC.HomeShortcut")]
    public class HomeShortcut : Domain
    {
        #region 属性

        /// <summary>
        /// 首页快捷方式编号。
        /// </summary>
        [Required]
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Id { get; set; }

        /// <summary>
        /// 用户编号。
        /// </summary>
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string UserId { get; set; }

        /// <summary>
        /// 功能名称。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Name { get; set; }

        /// <summary>
        /// 导航地址。
        /// </summary>
        [StringLength(200, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string NavigateUrl { get; set; }

        /// <summary>
        /// 导航目标。
        /// </summary>
        public virtual string Target { get; set; }

        /// <summary>
        /// 菜单图标。
        /// </summary>
        public virtual string Image { get; set; }

        /// <summary>
        /// 排序号。
        /// </summary>
        public virtual int? Sort { get; set; }

        /// <summary>
        /// 备注信息。
        /// </summary>
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
