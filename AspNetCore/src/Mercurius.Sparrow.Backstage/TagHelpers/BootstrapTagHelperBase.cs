using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Microsoft.AspNetCore.Razor.TagHelpers;

namespace Mercurius.Sparrow.Backstage.TagHelpers
{
    /// <summary>
    /// 基于Bootstrap的标签助手基类。
    /// </summary>
    public class BootstrapTagHelperBase : TagHelper
    {
        #region 字段

        protected int _labelCols;

        protected int _formCols;

        #endregion

        #region 属性

        /// <summary>
        /// 标签名称。
        /// </summary>
        public string Label { get; set; }

        /// <summary>
        /// 布局(以","号分隔)。
        /// </summary>
        public string Layout { get; set; }

        /// <summary>
        /// 模型绑定属性。
        /// </summary>
        [HtmlAttributeName("asp-for")]
        public ModelExpression For { get; set; }

        #endregion

        #region 受保护方法

        /// <summary>
        /// 获取元素名称。
        /// </summary>
        /// <returns>元素名称</returns>
        protected string GetElementName()
        {
            return this.For.Metadata.PropertyName;
        }

        /// <summary>
        /// 元素Id。
        /// </summary>
        /// <returns></returns>
        protected string GetElementId()
        {
            return this.For.Metadata.PropertyName.Replace('.', '_');
        }

        /// <summary>
        /// 获取标签内容。
        /// </summary>
        /// <returns>标签内容</returns>
        protected string GetLabelContent()
        {
            return string.IsNullOrWhiteSpace(this.Label) ?
                (string.IsNullOrWhiteSpace(this.For.Metadata.DisplayName) ? this.GetElementName() : this.For.Metadata.DisplayName)
                : this.Label;
        }

        /// <summary>
        /// 获取元素值。
        /// </summary>
        /// <param name="format">元素值</param>
        /// <returns>值</returns>
        protected object GetValue(string format)
        {
            return string.IsNullOrWhiteSpace(format) ? this.For.Model : string.Format("{0:" + format + "}", this.For.Model);
        }

        #endregion
    }
}
