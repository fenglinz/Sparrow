using System;
using System.ComponentModel.DataAnnotations;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Siskin.Entities.RBAC
{
    /// <summary>
    /// 回收站信息。
    /// </summary>
	[Table("RBAC.Recyclebin")]
    public class Recyclebin : CreationDomain
    {
        #region 属性

        /// <summary>
        /// 获取或者设置回收站编号。
        /// </summary>
        [Required]
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Id { get; set; }

        /// <summary>
        /// 获取或者设置回收站信息分类。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Category { get; set; }

        /// <summary>
        /// 获取或者设置对应数据库。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Database { get; set; }

        /// <summary>
        /// 数据库架构。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Schema { get; set; }

        /// <summary>
        /// 数据表。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Table { get; set; }

        /// <summary>
        /// 获取或者设置对应字段主键。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Column { get; set; }

        /// <summary>
        /// 获取或者设置对应字段值。
        /// </summary>
        [StringLength(50, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Value { get; set; }

        /// <summary>
        /// 获取或者设置备注信息。
        /// </summary>
        [StringLength(500, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Remark { get; set; }

        #endregion
    }
}
