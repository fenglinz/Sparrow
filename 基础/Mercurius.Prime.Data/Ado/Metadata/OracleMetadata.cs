using System.Collections.Generic;

namespace Mercurius.Prime.Data.Ado
{
    /// <summary>
    /// Oracle数据库元数据信息。
    /// </summary>
    public class OracleMetadata : DbMetadata
    {
        #region 静态常量

        private static StatementNamespace ns = "Mercurius.Prime.Core.Oracle";

        #endregion

        #region 实现抽象方法

        /// <summary>
        /// 获取数据库名称列表。
        /// </summary>
        /// <returns>数据库名称列表</returns>
        public override IList<string> GetDatabases()
        {
            return this.DbHelper.CreateCommand(ns, "GetDatabases")
                .ExecuteReader()
                .GetDatas(d => d.GetString(0));
        }

        /// <summary>
        /// 获取所有表信息。
        /// </summary>
        /// <returns>表信息集合</returns>
        public override IList<Table> GetTables()
        {
            return this.DbHelper.CreateCommand(ns, "GetTables")
                .ExecuteReader()
                .GetDatas<Table>();
        }

        /// <summary>
        /// 获取表的信息。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <returns>表信息</returns>
        public override Table GetTable(string tableName)
        {
            return this.DbHelper.CreateCommand(ns, "GetTable")
                .AddParameter("ptable", tableName)
                .GetData<Table>();
        }

        /// <summary>
        /// 获取表的所有字段详细信息。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <returns>字段详细信息集合</returns>
        public override IList<Column> GetColumns(string tableName)
        {
            return this.DbHelper.CreateCommand(ns, "GetColumns")
                .AddParameter("ptable", tableName)
                .GetDatas<Column>();
        }

        /// <summary>
        /// 修改表的注释信息。
        /// </summary>
        /// <param name="table">表名称</param>
        /// <param name="comments">注释信息</param>
        public override void CommentTable(string table, string comments)
        {
            this.DbHelper.CreateCommand($"COMMENT ON TABLE {table} IS '{comments}'")
                .Execute();
        }

        /// <summary>
        /// 修改字段的注释。
        /// </summary>
        /// <param name="table">表名称</param>
        /// <param name="column">字段名称</param>
        /// <param name="comments">注释信息</param>
        public override void CommentColumn(string table, string column, string comments)
        {
            this.DbHelper.CreateCommand($"COMMENT ON COLUMN {table}.{column} IS '{comments}'")
                .Execute();
        }

        #endregion
    }
}
