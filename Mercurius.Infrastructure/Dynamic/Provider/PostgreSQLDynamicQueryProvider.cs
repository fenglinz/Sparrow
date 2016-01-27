using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Infrastructure.Dynamic
{
    /// <summary>
    /// 针对SQL Server数据库的动态查询对象。
    /// </summary>
    public class PostgreSQLDynamicQueryProvider : DynamicQueryProvider
    {
        #region 常量

        private const string CriteriaFormat = "\"{0}\" {1} :{2}";

        #endregion

        #region 字段

        private readonly DbTypeResolve _dbTypeResolve;

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        public PostgreSQLDynamicQueryProvider(string connectionStringName = "Default")
            : base(connectionStringName)
        {
            this._dbHelper.DbMetadata = new PostgreSQLMetadata();
            this._dbTypeResolve = new DbTypeResolve(DatabaseType.PostgreSQL);
        }

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="providerName">数据库提供者名称</param>
        /// <param name="connectionString">数据库连接字符串</param>
        public PostgreSQLDynamicQueryProvider(string providerName, string connectionString)
            : base(providerName, connectionString)
        {
            this._dbHelper.DbMetadata = new PostgreSQLMetadata();
            this._dbTypeResolve = new DbTypeResolve(DatabaseType.PostgreSQL);
        }

        #endregion

        #region 抽象方法实现

        protected override string GetSafeTableName(string table)
        {
            table = table.Replace("\"", string.Empty).Replace("\"", string.Empty);

            if (table.Contains("."))
            {
                var items = table.Split('.');

                return $"\"{items.FirstOrDefault()}\".\"{items.LastOrDefault()}\"";
            }

            return $"public.\"{table}\"";
        }

        /// <summary>
        /// 创建查询条件片段。
        /// </summary>
        /// <param name="propertyName">属性名</param>
        /// <param name="op">查询操作</param>
        /// <returns>2元组：结果一、查询条件片段；结果二、查询参数</returns>
        protected override Tuple<string, string> CreateFragment(string propertyName, Op op)
        {
            var criteria = string.Empty;
            var parameterName = string.Empty;

            switch (op)
            {
                case Op.Eq:
                case Op.Gt:
                case Op.Ge:
                case Op.Lt:
                case Op.Le:
                    parameterName = propertyName + (this._parameterIndex++);
                    criteria = string.Format(CriteriaFormat, propertyName, Operations[(int)op], parameterName);

                    break;
                case Op.Like:
                    parameterName = propertyName + (this._parameterIndex++);
                    criteria = $"\"{propertyName}\" LIKE '%'||:{parameterName}||'%'";

                    break;
                case Op.IsNull:
                    criteria = $"\"{propertyName}\" IS NULL";

                    break;
                case Op.IsNotNull:
                    criteria = $"\"{propertyName}\" IS NOT NULL";

                    break;
            }

            return new Tuple<string, string>(criteria, parameterName);
        }

        /// <summary>
        /// 添加数据。
        /// </summary>
        /// <param name="command">SQL命令执行对象</param>
        /// <param name="tableName">表名称</param>
        /// <param name="allColumns">所有列信息</param>
        /// <returns>命令执行对象</returns>
        protected override void ConfigureCreateCommand(DbCommand command, string tableName, Columns allColumns)
        {
            var index = 1;
            var insertColumns = allColumns.Where(c => !c.IsIdentity);
            var commandTextBuilder = new StringBuilder();

            commandTextBuilder.AppendFormat("INSERT INTO {0} (", this.GetSafeTableName(tableName));

            foreach (var column in insertColumns)
            {
                commandTextBuilder.AppendFormat(index++ == insertColumns.Count() ? "\"{0}\"" : "\"{0}\",", column.Name);
            }

            commandTextBuilder.AppendFormat(") VALUES (");

            index = 1;
            foreach (var item in insertColumns)
            {
                var format = index++ == insertColumns.Count() ? ":{0}" : ":{0}, ";

                commandTextBuilder.AppendFormat(format, item.Name);
                command.AddParameter($":{item.Name}", item.Value, this._dbTypeResolve.GetDbType(item.DataType));
            }

            commandTextBuilder.Append(")");

            if (allColumns.Any(c => c.IsIdentity))
            {
                var identity = allColumns.First(i => i.IsIdentity);

                commandTextBuilder.AppendFormat(";SELECT currval(pg_get_serial_sequence('{0}', '{1}'));", this.GetSafeTableName(tableName), identity.Name);
            }

            command.CommandType = CommandType.Text;
            command.CommandText = commandTextBuilder.ToString();

            this.RecordCommandInfo("添加记录", command);
        }

        /// <summary>
        /// 更新数据。
        /// </summary>
        /// <param name="command">SQL命令执行对象</param>
        /// <param name="tableName">表名称</param>
        /// <param name="allColumns">所有列信息</param>
        /// <param name="columns">更新列集合</param>
        /// <param name="criteria"></param>
        /// <returns>命令执行对象</returns>
        protected override void ConfigureUpdateCommand(DbCommand command, string tableName, Columns allColumns, Columns columns, Criteria criteria = null)
        {
            var index = 1;
            var commandTextBuilder = new StringBuilder();

            commandTextBuilder.AppendFormat("UPDATE {0} SET ", this.GetSafeTableName(tableName));

            foreach (var item in columns)
            {
                var format = index++ == columns.Count() ? "\"{0}\"=:{0}" : "\"{0}\"=:{0},";

                commandTextBuilder.AppendFormat(format, columns[item.Name].Name);
                command.AddParameter($":{columns[item.Name].Name}", item.Value, this._dbTypeResolve.GetDbType(columns[item.Name].DataType));
            }

            var effectiveConditions = criteria?.EffectiveConditions;

            if (effectiveConditions.IsEmpty())
            {
                var primaryKeys = columns.Where(c => c.IsPrimaryKey).Select(c => c.Name);

                if (primaryKeys.Any())
                {
                    commandTextBuilder.Append(" WHERE ");

                    index = 1;
                    foreach (var item in primaryKeys)
                    {
                        commandTextBuilder.AppendFormat(primaryKeys.Count() == index++ ? " \"{0}\"=:{0}" : "\"{0}\"=:{0} AND ", columns[item].Name);
                        command.AddParameter($":{columns[item].Name}", columns[item].Value, this._dbTypeResolve.GetDbType(columns[item].DataType));
                    }
                }
            }
            else
            {
                index = 1;
                commandTextBuilder.Append(" WHERE ");

                foreach (var item in effectiveConditions)
                {

                    var columnName = allColumns[item.PropertyName].Name;
                    var fragment = this.CreateFragment(columnName, item.Op);

                    commandTextBuilder.Append(fragment.Item1);

                    if (index < effectiveConditions.Count)
                    {
                        commandTextBuilder.AppendFormat(" {0} ", effectiveConditions[index].JoinType);
                    }

                    if ((int)item.Op <= 5)
                    {
                        command.AddParameter($":{fragment.Item2}", item.Value, this._dbTypeResolve.GetDbType(columns[item.PropertyName].DataType));
                    }

                    index++;
                }
            }

            command.CommandType = CommandType.Text;
            command.CommandText = commandTextBuilder.ToString();

            this.RecordCommandInfo("更新记录", command);
        }

        /// <summary>
        /// 添加或者更新数据。
        /// </summary>
        /// <param name="command">SQL命令执行对象</param>
        /// <param name="tableName">表名称</param>
        /// <param name="allColumns">所有列信息</param>
        /// <returns>命令执行对象</returns>
        protected override void ConfigureCreateOrUpdateCommand(DbCommand command, string tableName, Columns allColumns)
        {
            var primaryKeys = allColumns.Where(c => c.IsPrimaryKey);
            var updateColumns = allColumns.Where(c => !c.IsPrimaryKey && !c.IsIdentity);
            var insertColumns = allColumns.Where(c => !c.IsIdentity);
            var commandTextBuilder = new StringBuilder();

            if (primaryKeys.IsEmpty())
            {
                throw new Exception("实体没有设置主键！");
            }

            commandTextBuilder.Append("BEGIN;");
            commandTextBuilder.AppendFormat("UPDATE {0} SET ", this.GetSafeTableName(tableName));

            var index = 1;
            foreach (var item in updateColumns)
            {
                var format = index++ == updateColumns.Count() ? "\"{0}\"=:{0}1" : "\"{0}\"=:{0}1,";

                commandTextBuilder.AppendFormat(format, item.Name);
                command.AddParameter($":{item.Name}1", item.Value, this._dbTypeResolve.GetDbType(item.DataType));
            }

            commandTextBuilder.Append(" WHERE ");

            index = 1;
            foreach (var item in primaryKeys)
            {
                commandTextBuilder.AppendFormat(primaryKeys.Count() == index++ ? "\"{0}\"=:{0}1" : "\"{0}\"=:{0}1 AND ", item.Name);
                command.AddParameter($":{item.Name}1", item.Value, this._dbTypeResolve.GetDbType(item.DataType));
            }

            commandTextBuilder.Append(";");
            commandTextBuilder.AppendFormat("INSERT INTO {0} (", this.GetSafeTableName(tableName));

            index = 1;
            foreach (var column in insertColumns)
            {
                commandTextBuilder.AppendFormat(index++ == insertColumns.Count() ? "\"{0}\"" : "\"{0}\",", column.Name);
            }

            commandTextBuilder.AppendFormat(") SELECT ");

            index = 1;
            foreach (var column in insertColumns)
            {
                var format = index++ == insertColumns.Count() ? ":{0}2" : ":{0}2,";

                commandTextBuilder.AppendFormat(format, column.Name);
                command.AddParameter($":{column.Name}2", column.Value, this._dbTypeResolve.GetDbType(column.DataType));
            }

            commandTextBuilder.AppendFormat(" WHERE NOT EXISTS(SELECT 1 FROM {0} WHERE ", this.GetSafeTableName(tableName));

            index = 1;
            foreach (var primaryKey in primaryKeys)
            {
                commandTextBuilder.AppendFormat(primaryKeys.Count() == (index++) ? "\"{0}\"=:{0}" : "\"{0}\"=:{0} AND ", primaryKey.Name);
                command.AddParameter($":{primaryKey.Name}", primaryKey.Value, this._dbTypeResolve.GetDbType(primaryKey.DataType));
            }

            commandTextBuilder.Append("); ");
            commandTextBuilder.Append("COMMIT;");

            command.CommandType = CommandType.Text;
            command.CommandText = commandTextBuilder.ToString();

            this.RecordCommandInfo("添加或者更新数据", command);
        }

        /// <summary>
        /// 删除数据。
        /// </summary>
        /// <param name="command">SQL命令执行对象</param>
        /// <param name="tableName">表名称</param>
        /// <param name="allColumns">所有列信息</param>
        /// <param name="criteria"></param>
        /// <returns>命令执行对象</returns>
        protected override void ConfigureRemoveCommand(DbCommand command, string tableName, Columns allColumns, Criteria criteria = null)
        {
            var commandTextBuilder = new StringBuilder();

            commandTextBuilder.AppendFormat("DELETE FROM {0}", this.GetSafeTableName(tableName));

            var effectiveConditions = criteria?.EffectiveConditions;

            if (!effectiveConditions.IsEmpty())
            {
                commandTextBuilder.Append(" WHERE ");

                var index = 1;
                foreach (var item in effectiveConditions)
                {
                    var fragment = this.CreateFragment(allColumns[item.PropertyName].Name, item.Op);

                    commandTextBuilder.Append(fragment.Item1);

                    if (index < effectiveConditions.Count)
                    {
                        commandTextBuilder.AppendFormat(" {0} ", effectiveConditions[index].JoinType);
                    }

                    if ((int)item.Op <= 5)
                    {
                        command.AddParameter($":{fragment.Item2}", item.Value, this._dbTypeResolve.GetDbType(allColumns[item.PropertyName].DataType));
                    }

                    index++;
                }
            }

            command.CommandType = CommandType.Text;
            command.CommandText = commandTextBuilder.ToString();

            this.RecordCommandInfo("删除记录", command);
        }

        /// <summary>
        /// 根据查询条件返回一条结果。
        /// </summary>
        /// <param name="command">SQL命令执行对象</param>
        /// <param name="tableName">表名称</param>
        /// <param name="allColumns">所有列信息</param>
        /// <param name="criteria"></param>
        /// <param name="columns">数据库信息返回列表</param>
        /// <returns>命令执行对象</returns>
        protected override void ConfigureSingleCommand(DbCommand command, string tableName, Columns allColumns, Criteria criteria = null, string[] columns = null)
        {
            var commandTextBuilder = new StringBuilder();

            if (columns != null && columns.Length > 0)
            {
                commandTextBuilder.Append("select ");

                var index = 0;
                foreach (var item in columns)
                {
                    index++;
                    commandTextBuilder.AppendFormat(columns.Length == index ? "\"{0}\"" : "\"{0}\",", allColumns[item].Name);
                }

                commandTextBuilder.AppendFormat(" from {0}", this.GetSafeTableName(tableName));
            }
            else
            {
                commandTextBuilder.AppendFormat("select * from {0}", this.GetSafeTableName(tableName));
            }

            var effectiveConditions = criteria?.EffectiveConditions;

            // 添加查询条件。
            if (!effectiveConditions.IsEmpty())
            {
                commandTextBuilder.Append(" WHERE ");

                var index = 1;
                foreach (var item in effectiveConditions)
                {
                    var fragment = this.CreateFragment(allColumns[item.PropertyName].Name, item.Op);

                    commandTextBuilder.Append(fragment.Item1);

                    if (index < effectiveConditions.Count)
                    {
                        commandTextBuilder.AppendFormat(" {0} ", effectiveConditions[index].JoinType);
                    }

                    if ((int)item.Op <= 5)
                    {
                        command.AddParameter($":{fragment.Item2}", item.Value, this._dbTypeResolve.GetDbType(allColumns[item.PropertyName].DataType));
                    }

                    index++;
                }
            }

            // 添加排序条件。
            if (criteria != null && !criteria.Orders.IsEmpty())
            {
                var index = 1;
                commandTextBuilder.Append(" ORDER BY ");

                foreach (var order in criteria.Orders)
                {
                    commandTextBuilder.AppendFormat((criteria.Orders.Count == index++) ? "\"{0}\" {1}" : "\"{0}\" {1},",
                        allColumns[order.PropertyName].Name, order.OrderBy);
                }
            }

            commandTextBuilder.Append(" LIMIT 1");

            command.CommandType = CommandType.Text;
            command.CommandText = commandTextBuilder.ToString();

            this.RecordCommandInfo("查询单个结果", command);
        }

        /// <summary>
        /// 根据查询条件返回所有结果。
        /// </summary>
        /// <param name="command">SQL命令执行对象</param>
        /// <param name="tableName">表名称</param>
        /// <param name="allColumns">所有列信息</param>
        /// <param name="criteria"></param>
        /// <param name="columns">数据库信息返回列表</param>
        /// <returns>命令执行对象</returns>
        protected override void ConfigureListCommand(DbCommand command, string tableName, Columns allColumns, Criteria criteria = null, string[] columns = null)
        {
            var commandTextBuilder = new StringBuilder();

            if (columns != null && columns.Length > 0)
            {
                commandTextBuilder.Append("SELECT ");

                var index = 0;
                foreach (var item in columns)
                {
                    index++;
                    commandTextBuilder.AppendFormat(columns.Length == index ? "\"{0}\"" : "\"{0}\",", allColumns[item].Name);
                }

                commandTextBuilder.AppendFormat(" FROM {0}", this.GetSafeTableName(tableName));
            }
            else
            {
                commandTextBuilder.AppendFormat("SELECT * FROM {0}", this.GetSafeTableName(tableName));
            }

            var effectiveConditions = criteria?.EffectiveConditions;

            // 添加查询条件。
            if (!effectiveConditions.IsEmpty())
            {
                commandTextBuilder.Append(" WHERE ");

                var index = 1;
                foreach (var item in effectiveConditions)
                {
                    var fragment = this.CreateFragment(allColumns[item.PropertyName].Name, item.Op);

                    commandTextBuilder.Append(fragment.Item1);

                    if (index < effectiveConditions.Count)
                    {
                        commandTextBuilder.AppendFormat(" {0} ", effectiveConditions[index].JoinType);
                    }

                    if ((int)item.Op <= 5)
                    {
                        command.AddParameter($":{fragment.Item2}", item.Value, this._dbTypeResolve.GetDbType(allColumns[item.PropertyName].DataType));
                    }

                    index++;
                }
            }

            // 添加排序条件。
            if (criteria != null && !criteria.Orders.IsEmpty())
            {
                var index = 1;
                commandTextBuilder.Append(" ORDER BY ");

                foreach (var order in criteria.Orders)
                {
                    commandTextBuilder.AppendFormat((criteria.Orders.Count == index++) ? "\"{0}\" {1}" : "\"{0}\" {1},",
                        allColumns[order.PropertyName].Name, order.OrderBy);
                }
            }

            command.CommandType = CommandType.Text;
            command.CommandText = commandTextBuilder.ToString();

            this.RecordCommandInfo("查询所有", command);
        }

        /// <summary>
        /// 根据查询条件分页返回数据。
        /// </summary>
        /// <param name="command">SQL命令执行对象</param>
        /// <param name="tableName">表名称</param>
        /// <param name="allColumns">所有列信息</param>
        /// <param name="pageIndex">当前页数</param>
        /// <param name="pageSize">每页显示记录数</param>
        /// <param name="totalRecords">总记录数</param>
        /// <param name="criteria"></param>
        /// <param name="columns">数据库信息返回列表</param>
        /// <returns>命令执行对象</returns>
        protected override void ConfigurePagedListCommand(DbCommand command, string tableName, Columns allColumns, int pageIndex, int pageSize, out int totalRecords, Criteria criteria = null, string[] columns = null)
        {
            int index;
            var returnColumns = columns ?? allColumns.Select(c => c.Name);
            var commandTextBuilder = new StringBuilder();
            var totalRecordCommandTextBuilder = new StringBuilder();
            var conditionTextBuilder = new StringBuilder();

            commandTextBuilder.Append("SELECT ");
            totalRecordCommandTextBuilder.AppendFormat("SELECT COUNT(*) FROM {0} ", this.GetSafeTableName(tableName));

            commandTextBuilder.Append("ROW_NUMBER() OVER(ORDER BY ");

            var primaryKeys = allColumns.Where(c => c.IsPrimaryKey);

            // 添加排序条件。
            if (criteria != null && !criteria.Orders.IsEmpty())
            {
                index = 1;
                foreach (var order in criteria.Orders)
                {
                    commandTextBuilder.AppendFormat((criteria.Orders.Count == index++) ? "\"{0}\" {1}" : "\"{0}\" {1},",
                        allColumns[order.PropertyName].Name, order.OrderBy);
                }
            }
            else if (!primaryKeys.IsEmpty())
            {
                index = 1;
                foreach (var item in primaryKeys)
                {
                    commandTextBuilder.AppendFormat(primaryKeys.Count() == index ? "\"{0}\"" : "\"{0}\",", item.Name);

                    index++;
                }
            }
            else
            {
                commandTextBuilder.AppendFormat("\"{0}\"", allColumns.FirstOrDefault().Name);
            }

            commandTextBuilder.Append(") AS \"RowIndex\"");

            foreach (var item in returnColumns)
            {
                commandTextBuilder.AppendFormat(",\"{0}\"", allColumns[item].Name);
            }

            commandTextBuilder.AppendFormat(" FROM {0} ", this.GetSafeTableName(tableName));

            var effectiveConditions = criteria?.EffectiveConditions;

            // 添加查询条件。
            if (!effectiveConditions.IsEmpty())
            {
                index = 1;
                foreach (var item in effectiveConditions)
                {
                    var fragment = this.CreateFragment(allColumns[item.PropertyName].Name, item.Op);

                    conditionTextBuilder.Append(fragment.Item1);

                    if (index < effectiveConditions.Count)
                    {
                        conditionTextBuilder.AppendFormat(" {0} ", effectiveConditions[index].JoinType);
                    }

                    if ((int)item.Op <= 5)
                    {
                        command.AddParameter($":{fragment.Item2}", item.Value);
                    }

                    index++;
                }
            }

            if (!string.IsNullOrWhiteSpace(conditionTextBuilder.ToString()))
            {
                commandTextBuilder.Append("WHERE ");
                commandTextBuilder.Append(conditionTextBuilder);

                totalRecordCommandTextBuilder.Append("WHERE ");
                totalRecordCommandTextBuilder.Append(conditionTextBuilder);
            }

            commandTextBuilder.Append(" Order By \"RowIndex\" ASC ");
            commandTextBuilder.AppendFormat("OFFSET (:pageIndex-1)*:pageSize LIMIT :pageSize");

            command.CommandType = CommandType.Text;
            command.CommandText = totalRecordCommandTextBuilder.ToString();

            this.RecordCommandInfo("获取总记录数", command);

            command.Connection.SafeOpen();
            totalRecords = Convert.ToInt32(command.ExecuteScalar());

            command.AddParameter(":pageIndex", pageIndex).AddParameter(":pageSize", pageSize);

            command.CommandText = commandTextBuilder.ToString();

            this.RecordCommandInfo("分页查询", command);
        }

        #endregion
    }
}
