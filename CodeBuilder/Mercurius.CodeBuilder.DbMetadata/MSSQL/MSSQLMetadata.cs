using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Mercurius.CodeBuilder.Core;
using Mercurius.CodeBuilder.Core.Database;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Ado;
using DatabaseType = Mercurius.Infrastructure.Ado.DatabaseType;

namespace Mercurius.CodeBuilder.DbMetadata.MSSQL
{
    /// <summary>
    /// <para>
    /// MS SQL数据库元数据信息获取。
    /// </para>
    /// 
    /// <para>
    /// 作者：Fenglinz
    /// 日期：2011-11-04
    /// </para>
    /// </summary>
    public class MSSQLMetadata : Metadata
    {
        #region 字段

        private DbHelper _dbHelper = null;

        #endregion

        #region 重写Metadata

        /// <summary>
        /// 获取数据库名称集合。
        /// </summary>
        /// <returns>数据库名称集合</returns>
        public override IList<string> GetDatabaseNames()
        {
            var dbHelper = DbHelperCreator.Create(DatabaseType.MSSQL, this.ServerUri, "master", this.Account, this.Password);

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
                                    Schema = item.Schema,
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
            var arrays = tableName.Split('.');

            var result = new DbTable();
            var dbHelper = GetDbHelper(databaseName);
            var columns = dbHelper.DbMetadata.GetColumns(tableName);

            result.Schema = arrays[0];
            result.Name = arrays[0] == "dbo" ? arrays[1] : tableName;
            result.ModuleName = arrays[0] == "dbo" ? string.Empty : arrays[0];
            result.ClassName = arrays[1].AsClassName();

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
            return DbHelperCreator.Create(DatabaseType.MSSQL, this.ServerUri, database, this.Account, this.Password);
        }

        #endregion
    }
}
