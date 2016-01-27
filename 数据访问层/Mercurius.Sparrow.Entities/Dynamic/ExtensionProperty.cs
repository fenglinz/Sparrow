using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Sparrow.Entities.Dynamic
{
    /// <summary>
    /// 扩展属性。
    /// </summary>
    [Table("Dynamic.ExtensionProperty")]
    public class ExtensionProperty : ModificationDomain
    {
        #region 属性

        /// <summary>
        /// 编号。
        /// </summary>
        [Display(Name = "编号")]
        [Column("Id", IsPrimaryKey = true)]
        public virtual Guid Id { get; set; }

        /// <summary>
        /// 分类。
        /// </summary>
        [Display(Name = "分类")]
        [Column("Category")]
        [StringLength(250, ErrorMessage = "分类不能超过{1}个字符。")]
        public virtual string Category { get; set; }

        /// <summary>
        /// 属性名。
        /// </summary>
        [Display(Name = "属性名")]
        [Column("Name")]
        [StringLength(250, ErrorMessage = "属性名不能超过{1}个字符。")]
        public virtual string Name { get; set; }

        /// <summary>
        /// 单位。
        /// </summary>
        [Display(Name = "单位")]
        [Column("Unit")]
        [StringLength(50, ErrorMessage = "单位不能超过{1}个字符。")]
        public virtual string Unit { get; set; }

        /// <summary>
        /// 分组名。
        /// </summary>
        [Display(Name = "分组名")]
        [Column("GroupName")]
        [StringLength(250, ErrorMessage = "分组名不能超过{1}个字符。")]
        public virtual string GroupName { get; set; }

        /// <summary>
        /// 控件编号。
        /// </summary>
        [Display(Name = "控件编号")]
        [Column("ControlId")]
        [StringLength(250, ErrorMessage = "控件编号不能超过{1}个字符。")]
        public virtual string ControlId { get; set; }

        /// <summary>
        /// 控件类型。
        /// </summary>
        [Display(Name = "控件类型")]
        [Column("ControlType")]
        public virtual int ControlType { get; set; }

        /// <summary>
        /// 占位符。
        /// </summary>
        [Display(Name = "占位符")]
        [Column("Placeholder")]
        [StringLength(250, ErrorMessage = "占位符不能超过{1}个字符。")]
        public virtual string Placeholder { get; set; }

        /// <summary>
        /// 控件数据源。
        /// </summary>
        [Display(Name = "控件数据源")]
        [Column("ControlDataSource")]
        public virtual string ControlDataSource { get; set; }

        /// <summary>
        /// 最大长度。
        /// </summary>
        [Display(Name = "最大长度")]
        [Column("ControlMaxLength")]
        public virtual int? ControlMaxLength { get; set; }

        /// <summary>
        /// 控件css类名。
        /// </summary>
        [Display(Name = "控件css类名")]
        [Column("ControlCssClass")]
        [StringLength(2000, ErrorMessage = "控件css类名不能超过{1}个字符。")]
        public virtual string ControlCssClass { get; set; }

        /// <summary>
        /// 控件样式。
        /// </summary>
        [Display(Name = "控件样式")]
        [Column("ControlStyle")]
        [StringLength(2000, ErrorMessage = "控件样式不能超过{1}个字符。")]
        public virtual string ControlStyle { get; set; }

        /// <summary>
        /// 控件验证规则。
        /// </summary>
        [Display(Name = "控件验证规则")]
        [Column("ControlValidateRule")]
        [StringLength(50, ErrorMessage = "控件验证规则不能超过{1}个字符。")]
        public virtual string ControlValidateRule { get; set; }

        /// <summary>
        /// 排序号。
        /// </summary>
        [Display(Name = "排序号")]
        [Column("Sort")]
        public virtual int? Sort { get; set; }

        #endregion

        #region 业务属性

        /// <summary>
        /// 扩展属性实例值。
        /// </summary>
        public string Value { get; set; }

        #endregion
    }
}
