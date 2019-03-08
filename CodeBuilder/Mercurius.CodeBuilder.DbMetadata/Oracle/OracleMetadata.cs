using System;
using System.Collections.Generic;
using System.Linq;
using Mercurius.CodeBuilder.Core.Database;
using Mercurius.Prime.Core;
using Mercurius.Prime.Data.Ado;
using DatabaseType = Mercurius.Prime.Data.Database;

namespace Mercurius.CodeBuilder.DbMetadata.Oracle
{
    public class OracleMetadata : Metadata
    {
        #region 重写Metadata

        /// <summary>
        /// 获取数据库名称集合。
        /// </summary>
        /// <returns>数据库名称集合</returns>
        public override IList<string> GetDatabaseNames()
        {
            var dbHelper = GetDbHelper("orcl");

            return dbHelper.DbMetadata.GetDatabases();
        }

        /// <summary>
        /// 获取数据库中的所有自定义对象。
        /// </summary>
        /// <param name="databaseName">数据库名称</param>
        /// <returns>自定义对象名称集合</returns>
        public override IList<CustomObject> GetCustomObjects(string databaseName)
        {
            var dbHelper = GetDbHelper(databaseName);
            var tables = dbHelper.DbMetadata.GetTables();
            var result = new List<CustomObject>();

            // 获取表。
            if (!tables.IsEmpty())
            {
                result.AddRange(from Table item in tables
                    select new CustomObject
                    {
                        Name = item.Name,
                        Schema = item.Name.Split('_')[0],
                        Description = item.Comments
                    });
            }

            return result;
        }

        /// <summary>
        /// 获取表或视图的详细信息。
        /// </summary>
        /// <param name="databaseName">数据库名称</param>
        /// <param name="tableName">表或视图名称</param>
        /// <param name="isView">是否为视图</param>
        /// <returns>表或视图信息</returns>
        public override DbTable GetTableOrViewDetails(string databaseName, string tableName, bool isView = false)
        {
            var result = new DbTable();
            var dbHelper = GetDbHelper(databaseName);
            var columns = dbHelper.DbMetadata.GetColumns(tableName);

            result.Name = tableName;
            result.Schema = tableName.Contains('_') ? tableName.Split('_')[0] : "Core";
            result.ModuleName = result.Schema.AsClassName();
            result.ClassName = tableName.Contains('_') ? tableName.Substring(tableName.IndexOf('_')).AsClassName() : tableName.AsClassName();

            foreach (var item in columns)
            {
                var dbColumn = new DbColumn { Name = item.Name };

                dbColumn.PropertyName = dbColumn.Name.PascalNaming();
                dbColumn.IsIdentity = item.IsIdentity;
                dbColumn.IsPrimaryKey = item.IsPrimaryKey;
                dbColumn.Nullable = item.IsNullable;
                dbColumn.Description = item.Description;
                dbColumn.SqlType = item.DataType;
                dbColumn.Length = item.DataLength;
                dbColumn.BasicType = dbColumn.SqlType;
                dbColumn.IsAddColumn = base.IsAddColumn(dbColumn);
                dbColumn.IsUpdateColumn = base.IsUpdateColumn(dbColumn);

                result.Columns.Add(dbColumn);
            }

            return result;
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 获取数据库服务器对象。
        /// </summary>
        /// <returns></returns>
        private DbHelper GetDbHelper(string database)
        {
            return DbHelperCreator.Create(DatabaseType.Oracle, this.ServerUri, database, this.Account, this.Password, this.Port);
        }

        #endregion
    }
}
