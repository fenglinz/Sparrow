using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mercurius.Sparrow.Mvc.Extensions
{
    /// <summary>
    /// 视图模型的属性元数据信息。
    /// </summary>
    public class PropertyMetadata
    {
        #region 属性

        /// <summary>
        /// 完整名称。
        /// </summary>
        public string FullName { get; set; }

        /// <summary>
        /// 显示名称。
        /// </summary>
        public string DisplayName { get; set; }

        /// <summary>
        /// 是否为必须。
        /// </summary>
        public bool IsRequired { get; set; }

        /// <summary>
        /// 类型。
        /// </summary>
        public Type Type { get; set; }

        /// <summary>
        /// 值。
        /// </summary>
        public object Value { get; set; }

        /// <summary>
        /// 元素Id。
        /// </summary>
        public string ElementId => this.FullName?.Replace('.', '_');

        #endregion
    }
}