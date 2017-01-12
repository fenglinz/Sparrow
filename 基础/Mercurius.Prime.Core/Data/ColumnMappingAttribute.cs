using System;

namespace Mercurius.Prime.Core.Data
{
    /// <summary>
    /// 导入导出数据映射特性。
    /// </summary>
    [Serializable]
    [AttributeUsage(AttributeTargets.Property,
        AllowMultiple = false,
        Inherited = true)]
    public class ColumnMappingAttribute : Attribute
    {
        #region 属性

        /// <summary>
        /// 标题。
        /// </summary>
        public string HeaderText { get; set; }

        /// <summary>
        /// 关联的字段名称。
        /// </summary>
        public string ColumnName { get; set; }

        /// <summary>
        /// 数据格式化字符串。
        /// </summary>
        public string DataFormat { get; set; }

        /// <summary>
        /// 排序序号。
        /// </summary>
        public int Order { get; set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        public ColumnMappingAttribute()
        {
        }

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="headerText">标题</param>
        public ColumnMappingAttribute(string headerText)
            : this(headerText, headerText)
        {
        }

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="headerText">标题</param>
        /// <param name="columnName">字段名</param>
        public ColumnMappingAttribute(string headerText, string columnName)
        {
            this.HeaderText = headerText;
            this.ColumnName = columnName;
        }

        #endregion
    }
}
