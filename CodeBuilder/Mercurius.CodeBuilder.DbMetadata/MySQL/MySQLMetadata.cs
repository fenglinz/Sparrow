﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Mercurius.CodeBuilder.Core;
using Mercurius.CodeBuilder.Core.Database;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Ado;
using Mercurius.Infrastructure.Data;

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
            var dbHelper = DbHelperCreator.Create(DatabaseType.MySQL, this.ServerUri, "mysql", this.Account, this.Password);

            var reader = dbHelper.ExecuteReader("show TABLES");

            while (reader.Read())
            {
                result.Add(new CustomObject { Name = reader.GetString(0) });
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
            var dbHelper = DbHelperCreator.Create(DatabaseType.MySQL, this.ServerUri, "mysql", this.Account, this.Password);

            result.Name = tableName;
            result.ClassName = tableName.AsClassName();
            result.Description = result.ClassName;

            try
            {
                using (var reader = dbHelper.ExecuteReader(string.Format("DESC {0}", tableName)))
                {
                    while (reader.Read())
                    {
                        var field = new DbColumn
                        {
                            Name = reader.GetString(0),
                            PropertyName = reader.GetString(0).PascalNaming(),
                            IsIdentity = !Convert.IsDBNull(reader[5]) && reader.GetString(5).Contains("auto_increment"),
                            IsPrimaryKey = !Convert.IsDBNull(reader[3]) && reader.GetString(3).ToUpper().Contains("PRI"),
                            Nullable = reader.GetString(2) == "YES",
                            Description = reader.GetString(0),
                        };

                        var sqlType = reader.GetString(1).Split(' ')[0];

                        if (sqlType.Contains('('))
                        {
                            sqlType = sqlType.Substring(0, sqlType.IndexOf('('));
                        }

                        field.SqlType = sqlType;
                        field.BasicType = sqlType;

                        result.Columns.Add(field);
                    }
                }
            }
            catch { }

            return result;
        }

        #endregion
    }
}
