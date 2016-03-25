using System;
using System.ComponentModel.DataAnnotations;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Sparrow.Entities.Core
{
    /// <summary>
    /// 字典信息
    /// </summary>
    [Table("Dictionary")]
    public class Dictionary : Domain, IHierarchy<string>
    {
        #region 属性

        /// <summary>
        /// 字典编号。
        /// </summary>
        [Column(IsPrimaryKey = true)]
        [StringLength(36, ErrorMessageResourceType = typeof(Constants)
           , ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Id { get; set; }

        /// <summary>
        /// 字典类别(1:字典分类、其他：字典项)。
        /// </summary>
        public virtual int? Type { get; set; }

        /// <summary>
        /// 父节点编号。
        /// </summary>
        [StringLength(36, ErrorMessageResourceType = typeof(Constants)
           , ErrorMessageResourceName = "MaxStringLength")]
        public virtual string ParentId { get; set; }

        /// <summary>
        /// 字典键。
        /// </summary>
        [StringLength(200, ErrorMessageResourceType = typeof(Constants)
            , ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Key { get; set; }

        /// <summary>
        /// 字典值。
        /// </summary>
        [StringLength(200, ErrorMessageResourceType = typeof(Constants)
           , ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Value { get; set; }

        /// <summary>
        /// 排序号。
        /// </summary>
        public virtual int? Sort { get; set; }

        /// <summary>
        /// 备注信息
        /// </summary>
        [StringLength(500, ErrorMessageResourceType = typeof(Constants)
           , ErrorMessageResourceName = "MaxStringLength")]
        public virtual string Remark { get; set; }

        /// <summary>
        /// 实体信息的状态。
        /// </summary>
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
