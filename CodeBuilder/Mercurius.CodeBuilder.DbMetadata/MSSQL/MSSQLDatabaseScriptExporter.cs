using Mercurius.CodeBuilder.Core.Database;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Ado;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.CodeBuilder.DbMetadata.MSSQL
{
    public class MSSQLDatabaseScriptExporter : DatabaseScriptExporter
    {
        #region 字段

        private readonly DbHelper _dbHelper;

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="dbHelper">数据库访问对象</param>
        public MSSQLDatabaseScriptExporter(DbHelper dbHelper)
        {
            this._dbHelper = dbHelper;
        }

        #endregion

        #region 重写基类方法

        /// <summary>
        /// 获取数据库的自定义架构列表。
        /// </summary>
        /// <returns>自定义架构列表</returns>
        protected override String GetSchemasDefinition()
        {
            var command = this._dbHelper.CreateCommand<MSSQLDatabaseScriptExporter>("GetSchemas");
            var schemas = command?.GetDatas(r => r.GetString(0));

            if (!schemas.IsEmpty())
            {
                var sql = new StringBuilder();

                foreach (var item in schemas)
                {
                    sql.AppendLine($"IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name='{item}')");
                    sql.AppendLine($"  EXEC sys.sp_executesql N'CREATE SCHEMA [{item}] Authorization [dbo]';");

                    sql.AppendLine("GO");
                }

                return sql.ToString();
            }

            return null;
        }

        /// <summary>
        /// 获取数据库表的数据库定义语句。
        /// </summary>
        /// <param name="table">表名称</param>
        /// <returns>表的数据库定义语句列表</returns>
        protected override String GetTablesDefinition()
        {
            var command = this._dbHelper.CreateCommand<MSSQLDatabaseScriptExporter>("GetTablesDefinition");
            var ddls = command?.GetDatas(r => r.GetString(0));

            if (!ddls.IsEmpty())
            {
                var sql = new StringBuilder();

                foreach (var item in ddls)
                {
                    sql.AppendLine(item);
                }

                return sql.ToString();
            }

            return null;
        }

        /// <summary>
        /// 获取数据库中自定义过程(包括函数)的详细定义。
        /// </summary>
        /// <returns>脚本</returns>
        protected override String GetProceduresDefinition()
        {
            var allCommand = this._dbHelper.CreateCommand<MSSQLDatabaseScriptExporter>("GetProcedures");

            var procedureNames = allCommand?.GetDatas(r => r.GetString(0));

            if (!procedureNames.IsEmpty())
            {
                var sql = new StringBuilder();

                foreach (var procedure in procedureNames)
                {
                    var ddlCommand = this._dbHelper.CreateCommand<MSSQLDatabaseScriptExporter>("GetProcedureDefinition");

                    var ddls = ddlCommand?.AddParameter("@procedure", procedure).GetDatas(r=>r.GetString(0));

                    foreach (var d in ddls)
                    {
                        sql.Append(d.Replace("\t", "  "));
                    }

                    sql.AppendLine("GO\r\n");
                }

                return sql.ToString();
            }

            return null;
        }

        protected override String GetAddDatasScript()
        {
            var command = this._dbHelper.CreateCommand<MSSQLDatabaseScriptExporter>("GetTables");
            var tables = command?.GetDatas<Table>();

            if (tables.IsEmpty())
            {
                return null;
            }

            var sql = new StringBuilder();

            foreach (var item in tables)
            {
                var fullName = $"[{item.Schema}].[{item.Name}]";
                var ddlCommand = this._dbHelper.CreateCommand<MSSQLDatabaseScriptExporter>("GetAddDatasScript");

                var datas = ddlCommand?.AddParameter("@table", fullName).GetDatas(r=>r.GetString(0));
                
                if (datas.IsEmpty())
                {
                    continue;
                }
                
                if (item.HasIdentityColumn == true)
                {
                    sql.AppendLine($"SET IDENTITY_INSERT {fullName} ON;\r\nGO");
                }

                foreach (var d in datas)
                {
                    sql.AppendLine($"{d}\r\nGO");
                }

                if (item.HasIdentityColumn == true)
                {
                    sql.AppendLine($"SET IDENTITY_INSERT {fullName} OFF;\r\nGO");
                }
            }

            return sql.ToString();
        }

        #endregion
    }
}
