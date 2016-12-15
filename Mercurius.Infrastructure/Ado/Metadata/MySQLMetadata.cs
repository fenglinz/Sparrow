using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Infrastructure.Ado
{
    public class PostgreSQLMetadata : DbMetadata
    {
        #region 重写

        /// <summary>
        /// 获取数据库列表信息。
        /// </summary>
        /// <returns>数据库列表</returns>
        public override IList<string> GetDatabases()
        {
            var database = this.GetCurrentDatabase();

            return this.DbHelper.CreateCommand<Table>("GetDatabases")
                .ExecuteReader().GetDatas(dr => dr.GetString(0));
        }

        /// <summary>
        /// 获取所有表信息。
        /// </summary>
        /// <returns>表信息集合</returns>
        public override IList<Table> GetTables()
        {
            var database = this.GetCurrentDatabase();

            return this.DbHelper.CreateCommand<Table>("GetTables").AddParameter("@database", database).GetDatas<Table>();
        }

        /// <summary>
        /// 获取表的信息。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <returns>表信息</returns>
        public override Table GetTable(string tableName)
        {
            var rs = this.ResolveTable(tableName);
            var database = this.GetCurrentDatabase();

            return this.DbHelper.CreateCommand<Table>("GetTable")
                .AddParameter("@database", database)
                .AddParameter("@table", $"{rs.Item1}_{rs.Item2}")
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

            return this.DbHelper.CreateCommand<Column>("GetColumns")
                .AddParameter(":table", rs.Item2)
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
                var command = this.DbHelper.CreateCommand<Table>("Comment");

                command.CommandText = string.Format(command.CommandText, tableInfo.Schema, tableInfo.Name, comments);
                command.Execute();
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
                var command = this.DbHelper.CreateCommand<Column>("CommentColumn");

                command.CommandText = string.Format(command.CommandText, tableInfo.Schema, tableInfo.Name, column, comments);
                command.Execute();
            }
        }

        #endregion

        /// <summary>
        /// 解析表信息。
        /// </summary>
        /// <param name="table">表名称</param>
        /// <returns>架构和表名称</returns>
        protected override Tuple<string, string> ResolveTable(string table)
        {
            table = table.Replace("`", string.Empty).Replace("`", string.Empty);

            if (table.Contains("."))
            {
                var items = table.Split('.');

                return new Tuple<string, string>(items.FirstOrDefault(), items.LastOrDefault());
            }
            else
            {
                return new Tuple<string, string>("public", table);
            }
        }

        #region 私有方法

        /// <summary>
        /// 获取当前数据库。
        /// </summary>
        /// <returns>数据库名称</returns>
        private string GetCurrentDatabase()
        {
            var command = this.DbHelper.CreateCommand<Table>("GetCurrentDatabase");

            return command.GetData(r => r.GetString(0));
        }

        #endregion
    }
}
