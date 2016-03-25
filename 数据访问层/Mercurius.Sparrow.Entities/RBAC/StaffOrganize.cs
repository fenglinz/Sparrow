using System;
using System.ComponentModel.DataAnnotations;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Sparrow.Entities.RBAC
{
    /// <summary>
    /// 职员组织关系信息。
    /// </summary>
	[Table("RBAC.StaffOrganize")]
    public class StaffOrganize : CreationDomain
    {
        #region 属性

        /// <summary>
        /// 职员组织关系信息编号。
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
        /// 组织信息编号。
        /// </summary>
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string OrganizationId { get; set; }

        #endregion

        #region 导航属性

        /// <summary>
        /// 名称。
        /// </summary>
        public virtual string Name { get; set; }

        /// <summary>
        /// 父编号。
        /// </summary>
        public virtual string ParentId { get; set; }

        /// <summary>
        /// 是否为用户。
        /// </summary>
        public virtual bool IsUser { get; set; }

        #endregion
    }
}
