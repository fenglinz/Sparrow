using System;
using System.ComponentModel.DataAnnotations;
using Mercurius.EntityBase;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Core.Interfaces.Entities
{
    /// <summary>
    /// 字典信息
    /// </summary>
    [Table("Dictionary")]
    public class Dictionary : Domain, IHierarchy<string>
    {
        #region 属性

        /// <summary>
        /// 编号。
        /// </summary>
        [Display(Name = "编号")]
        [Column(IsPrimaryKey = true)]
        [StringLength(36, ErrorMessageResourceType = typeof(Constants), ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Id { get; set; }

        /// <summary>
        /// 类别(1:字典分类、其他：字典项)。
        /// </summary>
        [Display(Name = "类别")]
        public virtual int? Type { get; set; }

        /// <summary>
        /// 父节点编号。
        /// </summary>
        [Display(Name = "父节点")]
        [StringLength(36, ErrorMessageResourceType = typeof(Constants), ErrorMessageResourceName = "MaxStringLength")]
        public virtual string ParentId { get; set; }

        /// <summary>
        /// 键。
        /// </summary>
        [Display(Name = "键")]
        [StringLength(200, ErrorMessageResourceType = typeof(Constants), ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Key { get; set; }

        /// <summary>
        /// 值。
        /// </summary>
        [Display(Name = "值")]
        [StringLength(200, ErrorMessageResourceType = typeof(Constants), ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Value { get; set; }

        /// <summary>
        /// 排序号。
        /// </summary>
        [Display(Name = "排序号")]
        public virtual int? Sort { get; set; }

        /// <summary>
        /// 备注信息
        /// </summary>
        [Display(Name = "备注")]
        [StringLength(500, ErrorMessageResourceType = typeof(Constants), ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Remark { get; set; }

        /// <summary>
        /// 实体信息的状态。
        /// </summary>
        [Display(Name = "状态")]
        public virtual int? Status { get; set; }

        #endregion

        #region 业务属性

        /// <summary>
        /// 父节点名称。
        /// </summary>
        public virtual string ParentName { get; set; }

        /// <summary>
        /// 完整排序号(父节点排序号+"-"+当前排序号)。
        /// </summary>
        public virtual string FullSort { get; set; }

        #endregion
    }
}
