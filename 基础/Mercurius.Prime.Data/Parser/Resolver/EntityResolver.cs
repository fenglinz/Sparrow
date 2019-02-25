using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Entity;

namespace Mercurius.Prime.Data.Parser.Resolver
{
    /// <summary>
    /// 通过实体信息解析sql.
    /// </summary>
    internal class EntityResolver : IResolver
    {
        #region 字段

        /// <summary>
        /// 类型对应的字段信息
        /// </summary>
        [ThreadStatic]
        private static readonly Dictionary<Type, Columns> typeColumns;

        #endregion

        #region 构造方法

        /// <summary>
        /// 静态构造方法.
        /// </summary>
        static EntityResolver()
        {
            typeColumns = new Dictionary<Type, Columns>();
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 解析实体元数据.
        /// </summary>
        /// <param name="typeInfo">类型</param>
        /// <returns>解析结果</returns>
        public Columns Resolve<T>()
        {
            var typeInfo = typeof(T);

            if (!typeColumns.ContainsKey(typeInfo))
            {
                var tableAttr = typeInfo.GetCustomAttribute<TableAttribute>();
                var properties = from p in typeInfo.GetProperties()
                                 let columnAttr = p.GetCustomAttribute<ColumnAttribute>()
                                 where columnAttr?.IsIgnore != true
                                 select new
                                 {
                                     Property = p,
                                     ColumnAttribute = columnAttr
                                 };

                if (properties.IsEmpty())
                {
                    return null;
                }

                var columns = new Columns
                {
                    TableName = tableAttr?.Name.IsNotBlank() == true ? tableAttr.Name : typeInfo.Name
                };

                foreach (var item in properties)
                {
                    columns.Add(new Column
                    {
                        Name = item.ColumnAttribute?.Name.IsNotBlank() == true ? item.ColumnAttribute.Name : item.Property.Name,
                        PropertyName = item.Property.Name,
                        DataLength = item.ColumnAttribute?.DataLength,
                        IsIdentity = item.ColumnAttribute?.IsIdentity == true,
                        IsNullable = item.ColumnAttribute == null ? true : item.ColumnAttribute.IsNullable,
                        IsPrimaryKey = item.ColumnAttribute == null ? false : item.ColumnAttribute.IsPrimaryKey,
                        IsReadOnly = item.ColumnAttribute == null ? false : item.ColumnAttribute.IsReadOnly,
                        Description = item.ColumnAttribute?.Description
                    });
                }

                typeColumns.Add(typeInfo, columns);
            }

            return typeColumns[typeInfo];
        }

        #endregion
    }
}
