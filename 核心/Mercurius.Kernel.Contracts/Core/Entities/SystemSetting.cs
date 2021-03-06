﻿using System.ComponentModel.DataAnnotations;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Entities;

namespace Mercurius.Kernel.Contracts.Core.Entities
{
    /// <summary>
    /// 系统设置信息。
    /// </summary>
    [Table("SystemSetting")]
    public class SystemSetting : EntityBase
    {
        #region 属性

        /// <summary>
        /// 系统设置编号。
        /// </summary>
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]

        public virtual string Id { get; set; }

        /// <summary>
        /// 系统设置父编号。
        /// </summary>
        [StringLength(200, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string ParentId { get; set; }

        /// <summary>
        /// 系统设置项的名称。
        /// </summary>
        [StringLength(200, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Name { get; set; }

        /// <summary>
        /// 系统设置项的值。
        /// </summary>
        [StringLength(500, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Value { get; set; }

        /// <summary>
        /// 备注信息。
        /// </summary>
        [StringLength(500, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Remark { get; set; }

        #endregion
    }
}
