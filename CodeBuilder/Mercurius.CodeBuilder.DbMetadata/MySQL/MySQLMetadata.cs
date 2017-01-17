using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using Mercurius.CodeBuilder.Core;
using Mercurius.CodeBuilder.Core.Database;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.CodeBuilder.DbMetadata.MySQL
{
    /// <summary>
    /// <para>
    /// MySql数据库元数据信息获取。
    /// </para>
    /// 
    /// <para>
    /// 作者：Fenglinz
    /// 日期：2011-11-16
    /// </para>
    /// </summary>
    public class MySQLMetadata : Metadata
    {
        #region 重写Metadata

        /// <summary>
        /// 获取数据库名称集合。
        /// </summary>
        /// <returns>数据库名称集合</returns>
        public override IList<string> GetDatabaseNames()
        {
            var result = new List<string>();
            var dbHelper = DbHelperCreator.Create(DatabaseType.MySQL, this.ServerUri, "mysql", this.Account, this.Password);

            var reader = dbHelper.ExecuteReader("show DATABASES");

            while (reader.Read())
            {
                result.Add(reader.GetString(0));
            }

            return result;
        }

        /// <summary>
        /// 获取数据库中的所有自定义对象。
        /// </summary>
        /// <param name="databaseName">数据库名称</param>
        /// <returns>自定义对象名称集合</returns>
        public override IList<CustomObject> GetCustomObjects(string databaseName)
        {
            var result = new List<CustomObject>();
            var dbHelper = DbHelperCreator.Create(DatabaseType.MySQL, this.ServerUri, databaseName, this.Account, this.Password);

            var reader = dbHelper.ExecuteReader("show TABLES");

            while (reader.Read())
            {
                result.Add(new CustomObject { Name = reader.GetString(0), Type = CustomObjectType.Table });
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
            var dbHelper = DbHelperCreator.Create(DatabaseType.MySQL, this.ServerUri, databaseName, this.Account, this.Password);

            result.Name = tableName;
            result.ClassName = tableName.AsClassName();
            result.Description = result.ClassName;

            try
            {
                var columns = dbHelper.DbMetadata.GetColumns(tableName);

                foreach (var item in columns)
                {
                    var dbColumn = new DbColumn {Name = item.Name};

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
            }
            catch (Exception e)
            {
                Debug.WriteLine(e.Message);
            }

            return result;
        }

        #endregion
    }
}
