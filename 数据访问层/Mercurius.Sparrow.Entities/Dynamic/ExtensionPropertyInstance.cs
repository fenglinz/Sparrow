using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Siskin.Entities.Dynamic
{
    /// <summary>
    /// 扩展属性实例。
    /// </summary>
    [Table("Dynamic.ExtensionPropertyInstance")]
    public class ExtensionPropertyInstance : Domain
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
        /// 实体编号。
        /// </summary>
        [Display(Name = "实体编号")]
        [Column("EntityId")]
        [StringLength(36, ErrorMessage = "实体编号不能超过{1}个字符。")]
        public virtual string EntityId { get; set; }

        /// <summary>
        /// 扩展属性值。
        /// </summary>
        [Display(Name = "扩展属性值")]
        [Column("Value")]
        public virtual string Value { get; set; }

        #endregion
    }
}
