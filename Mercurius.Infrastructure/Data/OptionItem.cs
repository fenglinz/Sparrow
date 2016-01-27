using System;

namespace Mercurius.Infrastructure.Data
{
    /// <summary>
    /// 导入导出配置项。
    /// </summary>
    [Serializable]
    public class OptionItem
    {
        #region 属性

        /// <summary>
        /// 获取或者设置标题。
        /// </summary>
        public string HeaderText { get; set; }

        /// <summary>
        /// 获取或者设置关联的字段名称。
        /// </summary>
        public string ColumnName { get; set; }

        /// <summary>
        /// 获取或者设置导出数据的类型。
        /// </summary>
        public DataType DataType { get; set; }

        /// <summary>
        /// 获取或者设置数据格式化字符串。
        /// </summary>
        public string DataFormat { get; set; }

        #endregion
    }
}
