using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Text;

namespace Mercurius.Infrastructure.Ado
{
    /// <summary>
    /// 数据库元数据信息管理抽象类。
    /// </summary>
    public abstract class DbMetadata
    {
        #region 属性

        /// <summary>
        /// 数据库访问工具类。
        /// </summary>
        internal DbHelper DbHelper { get; set; }

        #endregion

        #region 公开方法

        /// <summary>
        /// 验证表名是否存在。
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <returns>是否通过验证</returns>
        public bool ValidTable(string tableName)
        {
            return this.GetTable(tableName) != null;
        }

        /// <summary>
        /// 验证表中字段是否存在。
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="columns">字段数组</param>
        /// <returns>是否通过验证</returns>
        public bool ValidColumns(string tableName, string[] columns)
        {
            var result = true;

            try
            {
                var dbColumns = this.GetColumns(tableName);

                foreach (var item in columns)
                {
                    if (string.IsNullOrWhiteSpace(item) || dbColumns.Any(c => c.Name == item))
                    {
                        continue;
                    }

                    result = false;
                }
            }
            catch
            {
                result = false;
            }

            return result;
        }

        #endregion

        #region 抽象方法

        /// <summary>
        /// 获取数据库名称列表。
        /// </summary>
        /// <returns>数据库名称列表</returns>
        public abstract IList<string> GetDatabases();

        /// <summary>
        /// 获取所有表信息。
        /// </summary>
        /// <returns>表信息集合</returns>
        public abstract IList<Table> GetTables();

        /// <summary>
        /// 获取表的信息。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <returns>表信息</returns>
        public abstract Table GetTable(string tableName);

        /// <summary>
        /// 获取表的所有字段详细信息。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <returns>字段详细信息集合</returns>
        public abstract IList<Column> GetColumns(string tableName);

        /// <summary>
        /// 修改表的注释信息。
        /// </summary>
        /// <param name="table">表名称</param>
        /// <param name="comments">注释信息</param>
        public abstract void CommentTable(string table, string comments);

        /// <summary>
        /// 修改字段的注释。
        /// </summary>
        /// <param name="table">表名称</param>
        /// <param name="column">字段名称</param>
        /// <param name="comments">注释信息</param>
        public abstract void CommentColumn(string table, string column, string comments);

        #endregion

        #region 受保护方法

        /// <summary>
        /// 解析表信息。
        /// </summary>
        /// <param name="table">表名称</param>
        /// <returns>架构和表名称</returns>
        protected virtual Tuple<string, string> ResolveTable(string table)
        {
            table = table.Replace("[", String.Empty).Replace("]", string.Empty);

            if (table.Contains("."))
            {
                var items = table.Split('.');

                return new Tuple<string, string>(items.FirstOrDefault(), items.LastOrDefault());
            }
            else
            {
                return new Tuple<string, string>("dbo", table);
            }
        }

        #endregion
    }
}
