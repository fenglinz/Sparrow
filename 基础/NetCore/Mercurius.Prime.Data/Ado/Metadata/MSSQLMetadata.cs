using System.Collections.Generic;

namespace Mercurius.Prime.Data.Ado
{
    /// <summary>
    /// SQL Server数据库元数据信息。
    /// </summary>
    public class MSSQLMetadata : DbMetadata
    {
        #region 静态变量

        private static StatementNamespace ns = "Mercurius.Prime.Core.MSSQL";

        #endregion

        #region 重写

        /// <summary>
        /// 获取数据库列表信息。
        /// </summary>
        /// <returns>数据库列表</returns>
        public override IList<string> GetDatabases()
        {
            return this.DbHelper.CreateCommand(ns, "GetDatabases")
                .ExecuteReader()
                .GetDatas(dr => dr.GetString(0));
        }

        /// <summary>
        /// 获取所有表信息。
        /// </summary>
        /// <returns>表信息集合</returns>
        public override IList<Table> GetTables()
        {
            return this.DbHelper.CreateCommand(ns, "GetTables").GetDatas<Table>();
        }

        /// <summary>
        /// 获取表的信息。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <returns>表信息</returns>
        public override Table GetTable(string tableName)
        {
            var rs = this.ResolveTable(tableName);

            return this.DbHelper.CreateCommand(ns, "GetTable")
                .AddParameter("@schema", rs.Item1)
                .AddParameter("@table", rs.Item2)
                .GetData<Table>();
        }

        /// <summary>
        /// 获取表的所有字段详细信息。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <returns>字段详细信息集合</returns>
        public override IList<Column> GetColumns(string tableName)
        {
            var rs = this.ResolveTable(tableName);

            return this.DbHelper.CreateCommand(ns, "GetColumns")
                .AddParameter("@schema", rs.Item1)
                .AddParameter("@table", rs.Item2)
                .GetDatas<Column>();
        }

        /// <summary>
        /// 修改表的注释信息。
        /// </summary>
        /// <param name="table">表名称</param>
        /// <param name="comments">注释信息</param>
        public override void CommentTable(string table, string comments)
        {
            var tableInfo = this.GetTable(table);

            if (tableInfo != null)
            {
                this.DbHelper.CreateCommand(ns, "Comment")
                .AddParameter("@comments", comments)
                .AddParameter("@type", tableInfo.IsView ? "VIEW" : "TABLE")
                .AddParameter("@table", tableInfo.Name)
                .AddParameter("@schema", tableInfo.Schema).Execute();
            }
        }

        /// <summary>
        /// 修改字段的注释。
        /// </summary>
        /// <param name="table">表名称</param>
        /// <param name="column">字段名称</param>
        /// <param name="comments">注释信息</param>
        public override void CommentColumn(string table, string column, string comments)
        {
            var tableInfo = this.GetTable(table);

            if (tableInfo != null)
            {
                this.DbHelper.CreateCommand(ns, "Comment")
                .AddParameter("@table", tableInfo.Name)
                .AddParameter("@schema", tableInfo.Schema)
                .AddParameter("@type", tableInfo.IsView ? "VIEW" : "TABLE")
                .AddParameter("@column", column)
                .AddParameter("@comments", comments)
                .Execute();
            }
        }

        #endregion
    }
}
