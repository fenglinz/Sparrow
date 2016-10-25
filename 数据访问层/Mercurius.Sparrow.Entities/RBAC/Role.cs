using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Sparrow.Entities.RBAC
{
    /// <summary>
    /// 角色信息。
    /// </summary>
    [Table("RBAC.Role")]
    public class Role : ModificationDomain, IHierarchy<string>
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
        /// 父角色编号。
        /// </summary>
        [Display(Name = "父角色编号")]
        [Column("ParentId")]
        [StringLength(36, ErrorMessage = "父角色编号不能超过{1}个字符。")]
        public virtual string ParentId { get; set; }

        /// <summary>
        /// 角色名称。
        /// </summary>
        [Display(Name = "名称")]
        [Column("Name")]
        [StringLength(100, ErrorMessage = "名称不能超过{1}个字符。")]
        public virtual string Name { get; set; }

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
    }
}
