using System.ComponentModel.DataAnnotations;
using Mercurius.Prime.Core.Entities;

namespace Mercurius.Kernel.Contracts.Core.Entities
{
    /// <summary>
    /// 全球化信息。
    /// </summary>
    [Table("Globalization")]
    public class Globalization : Entity
    {
        #region 属性

        /// <summary>
        /// 资源Id
        /// </summary>
        [Display(Name = "编号")]
        public virtual string Id { get; set; }

        /// <summary>
        /// MVC区域
        /// </summary>
        [Display(Name = "区域")]
        public virtual string Area { get; set; }

        /// <summary>
        /// MVC控制器
        /// </summary>
        [Display(Name = "控制器")]
        public virtual string Controller { get; set; }

        /// <summary>
        /// MVC视图
        /// </summary>
        [Display(Name = "视图")]
        public virtual string View { get; set; }

        /// <summary>
        /// 资源Key
        /// </summary>
        [Display(Name = "资源键")]
        public virtual string Key { get; set; }

        /// <summary>
        /// 资源Value
        /// </summary>
        [Display(Name = "资源值")]
        public virtual string Value { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        [Display(Name = "备注")]
        public virtual string Remark { get; set; }

        #endregion
    }
}
