using System;
using System.Linq.Expressions;
using System.Web;

namespace Mercurius.Kernel.WebCores.HtmlHelpers.Controls
{
    /// <summary>
    /// 表格列信息。
    /// </summary>
    public class DataGridColumn<T>
    {
        #region 属性

        /// <summary>
        /// 是否为隐藏。
        /// </summary>
        public bool IsHide { get; set; }

        /// <summary>
        /// 标题。
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// 样式。
        /// </summary>
        public string Style { get; set; }

        /// <summary>
        /// css类。
        /// </summary>
        public string Class { get; set; }

        /// <summary>
        /// 显示属性的名称。
        /// </summary>
        public string DisplayPropertyName { get; set; }

        /// <summary>
        /// 数据格式化字符串。
        /// </summary>
        public string DataFormatString { get; set; }

        /// <summary>
        /// 自定义表格内容处理。
        /// </summary>
        public Func<T, object> CustomPart { get; set; }

        #endregion
    }
}
