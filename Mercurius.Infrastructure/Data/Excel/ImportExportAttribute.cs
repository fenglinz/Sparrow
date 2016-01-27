using System;

namespace Mercurius.Infrastructure.Data.Excel
{
    /// <summary>
    /// 导入导出特性。
    /// </summary>
    [Serializable]
    [AttributeUsage(AttributeTargets.Class,
        AllowMultiple = false,
        Inherited = false)]
    public class ImportExportAttribute : Attribute
    {
        #region 属性

        /// <summary>
        /// 获取或者设置表名称。
        /// </summary>
        public string TableName { get; set; }

        /// <summary>
        /// 获取或者设置Sheet名称。
        /// </summary>
        public string SheetName { get; set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="tableName">数据库表名</param>
        public ImportExportAttribute(string tableName)
        {
            this.TableName = tableName;
            this.SheetName = tableName;
        }

        #endregion
    }
}
