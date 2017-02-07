using System;

namespace Mercurius.Prime.Core.Data
{
    /// <summary>
    /// 导入导出配置项。
    /// </summary>
    public class OptionItem
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
        /// 导出数据的类型。
        /// </summary>
        public DataType DataType { get; set; }

        /// <summary>
        /// 数据格式化字符串。
        /// </summary>
        public string DataFormat { get; set; }

        #endregion
    }
}
