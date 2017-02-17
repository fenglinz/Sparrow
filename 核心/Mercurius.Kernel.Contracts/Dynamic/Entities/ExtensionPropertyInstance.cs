using System;
using System.ComponentModel.DataAnnotations;
using Mercurius.Prime.Core.Entities;

namespace Mercurius.Kernel.Contracts.Dynamic.Entities
{
    /// <summary>
    /// 扩展属性实例。
    /// </summary>
    [Table("Dynamic.ExtensionPropertyInstance")]
    public class ExtensionPropertyInstance : EntityBase
    {
        #region 属性

        /// <summary>
        /// 编号。
        /// </summary>
        [Display(Name = "编号")]
        [Column("Id", IsPrimaryKey = true)]
        public virtual Guid Id { get; set; }

        /// <summary>
        /// 扩展属性编号。
        /// </summary>
        [Display(Name = "扩展属性编号")]
        [Column("ExtensionPropertyId")]
        public virtual Guid ExtensionPropertyId { get; set; }

        /// <summary>
        /// 业务流水号。
        /// </summary>
        [Display(Name = "业务流水号")]
        [Column("BusinessSerialNumber")]
        [StringLength(36, ErrorMessage = "业务流水号不能超过{1}个字符。")]
        public virtual string BusinessSerialNumber { get; set; }

        /// <summary>
        /// 扩展属性值。
        /// </summary>
        [Display(Name = "扩展属性值")]
        [Column("Value")]
        public virtual string Value { get; set; }

        #endregion
    }
}
