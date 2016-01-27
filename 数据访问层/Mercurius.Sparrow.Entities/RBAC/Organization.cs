using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Siskin.Entities.RBAC
{
    /// <summary>
    /// 组织机构/部门信息。
    /// </summary>
	[Table("RBAC.Organization")]
    public class Organization : ModificationDomain, IHierarchy<string>
    {
        #region 属性

        /// <summary>
        /// 获取或者设置组织机构/部门编号。
        /// </summary>
        [Required]
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Id { get; set; }

        /// <summary>
        /// 获取或者设置父级组织机构/部门信息。
        /// </summary>
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string ParentId { get; set; }

        /// <summary>
        /// 获取或者设置部门代号。
        /// </summary>
        [StringLength(20, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Code { get; set; }

        /// <summary>
        /// 获取或者设置部门名称。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Name { get; set; }

        /// <summary>
        /// 获取或者设置内线电话。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string InnerPhone { get; set; }

        /// <summary>
        /// 获取或者设置外线电话。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string OuterPhone { get; set; }

        /// <summary>
        /// 获取或者设置部门主负责人编号。
        /// </summary>
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Manager { get; set; }

        /// <summary>
        /// 获取或者设置部门助理。
        /// </summary>
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string AssistantManager { get; set; }

        /// <summary>
        /// 获取或者设置传真。
        /// </summary>
        [StringLength(20, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Fax { get; set; }

        /// <summary>
        /// 获取或者设置邮政编号。
        /// </summary>
        [StringLength(20, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string ZipCode { get; set; }

        /// <summary>
        /// 获取或者设置地址。
        /// </summary>
        [StringLength(200, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Address { get; set; }

        /// <summary>
        /// 获取或者设置排序号。
        /// </summary>
        public virtual int? Sort { get; set; }

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
        /// 获取或者设置部门负责人姓名。
        /// </summary>
        public virtual string ManagerName { get; set; }

        /// <summary>
        /// 获取或者设置部门助理姓名。
        /// </summary>
        public virtual string AssistantManagerName { get; set; }

        /// <summary>
        /// 获取或者设置关联的职员组织关系信息。
        /// </summary>
        public virtual IList<StaffOrganize> StaffOrganizes { get; set; }

        #endregion
    }
}
