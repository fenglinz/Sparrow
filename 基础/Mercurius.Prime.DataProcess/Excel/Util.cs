using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using Mercurius.Prime.Core.Data;
using Mercurius.Prime.Core.Data.Excel;

namespace Mercurius.Prime.DataProcess.Excel
{
    /// <summary>
    /// 工具类。
    /// </summary>
    public static class Util
    {
        #region 字段

        /// <summary>
        /// 导出配置项缓存字典。
        /// </summary>
        private static readonly Dictionary<Type, Configuration> ConfigurationDictionary;

        /// <summary>
        /// 元数据信息。
        /// </summary>
        private static readonly Dictionary<Type, IList<PropertyMetadata>> MetadataDictionary;

        #endregion

        #region 构造方法

        /// <summary>
        /// 静态构造方法。
        /// </summary>
        static Util()
        {
            ConfigurationDictionary = new Dictionary<Type, Configuration>();
            MetadataDictionary = new Dictionary<Type, IList<PropertyMetadata>>();
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 通过元数据解析导出配置信息。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <returns>导出配置信息</returns>
        public static Configuration ResolveConfiguration<T>() where T : class, new()
        {
            var type = typeof(T);

            if (ConfigurationDictionary.ContainsKey(type))
            {
                return ConfigurationDictionary[type];
            }

            var importExportAttribut = GetImportExportAttribute(type);

            if (importExportAttribut == null)
            {
                throw new Exception("该类型未添加ImportExport特性标记！");
            }

            var configuration = new Configuration
            {
                SheetName = importExportAttribut.SheetName
            };

            var metadatas = from p in type.GetProperties()
                            let attr = p.GetCustomAttributes(typeof(ColumnMappingAttribute), true).FirstOrDefault() as ColumnMappingAttribute
                            where
                                attr != null
                            orderby attr.Order ascending
                            select new PropertyMetadata
                            {
                                Property = p,
                                ColumnMapping = attr
                            };

            MetadataDictionary.Add(type, metadatas.ToList());

            foreach (var item in metadatas)
            {
                configuration.Options.Add(new OptionItem
                {
                    Property = item.Property,
                    HeaderText = item.ColumnMapping.HeaderText,
                    ColumnName = item.ColumnMapping.ColumnName,
                    DataFormat = item.ColumnMapping.DataFormat,
                    DataType = GetDataType(item.Property.PropertyType),
                });
            }

            ConfigurationDictionary.Add(type, configuration);

            return configuration;
        }

        #endregion

        #region 内部方法

        /// <summary>
        /// 获取类型的属性元数据信息。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <returns>属性元数据信息</returns>
        internal static IList<PropertyMetadata> GetPropertyMetadatas<T>()
        {
            var type = typeof(T);

            return MetadataDictionary.ContainsKey(type) ? MetadataDictionary[type] : null;
        }

        #endregion

        #region 私有方法

        private static ImportExportAttribute GetImportExportAttribute(Type type)
        {
            return type.GetCustomAttributes(typeof(ImportExportAttribute), false).FirstOrDefault() as ImportExportAttribute;
        }

        private static DataType GetDataType(Type type)
        {
            var result = DataType.String;

            if (type == typeof(DateTime))
            {
                result = DataType.DateTime;
            }
            else if (type == typeof(bool))
            {
                result = DataType.Boolean;
            }
            else if (type.IsPrimitive)
            {
                result = DataType.Numeric;
            }

            return result;
        }

        #endregion

        #region 内部类

        /// <summary>
        /// 属性元数据类。
        /// </summary>
        internal class PropertyMetadata
        {
            /// <summary>
            /// 属性元数据。
            /// </summary>
            public PropertyInfo Property { get; set; }

            /// <summary>
            /// 该属性的导入导出映射。
            /// </summary>
            public ColumnMappingAttribute ColumnMapping { get; set; }
        }

        #endregion
    }
}
