namespace Mercurius.Kernel.WebCores.HtmlHelpers.Table
{
    /// <summary>
    /// 表格列信息。
    /// </summary>
    public class TableColumn
    {
        #region 属性

        /// <summary>
        /// 标题。
        /// </summary>
        public string Caption { get; set; }

        /// <summary>
        /// 显示属性的名称。
        /// </summary>
        public string DisplayPropertyName { get; set; }

        /// <summary>
        /// 样式。
        /// </summary>
        public string Style { get; set; }

        #endregion
    }
}
