using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Reflection;
using Mercurius.Prime.Core.Entity;

namespace Mercurius.Prime.Data.Ado
{
    /// <summary>
    /// 对ADO.Net扩展。
    /// </summary>
    public static class AdoNetExtensions
    {
        #region 常量

        /// <summary>
        /// 未设置数据库连接对象。
        /// </summary>
        private const string UNSET_CONNECTION = "未设置DbCommand的数据库连接对象！";

        /// <summary>
        /// DataReader对象已经关闭。
        /// </summary>
        private const string DATAREADER_ALREADY_CLOSED = "DataReader对象已经关闭！";

        #endregion

        #region 字段

        private static readonly Dictionary<Type, IList<PropertyInfo>> PropertiesDictionary;

        #endregion

        #region 构造方法

        /// <summary>
        /// 静态构造方法。
        /// </summary>
        static AdoNetExtensions()
        {
            PropertiesDictionary = new Dictionary<Type, IList<PropertyInfo>>();
        }

        #endregion

        #region ADO.Net对象创建扩展方法

        /// <summary>
        /// 尝试连接数据库。
        /// </summary>
        /// <param name="connection">数据库连接对象</param>
        /// <param name="isConnect">是否连接成功</param>
        /// <returns>连接错误信息</returns>
        public static string TryConnect(this DbConnection connection, out bool isConnect)
        {
            try
            {
                connection.Open();

                isConnect = true;
            }
            catch (Exception exception)
            {
                isConnect = false;

                return exception.Message;
            }
            finally
            {
                connection.Close();
            }

            return null;
        }

        /// <summary>
        /// 为SQL命令执行对象添加参数。
        /// </summary>
        /// <param name="command">SQL命令执行对象</param>
        /// <param name="name">参数名称</param>
        /// <param name="value">参数值</param>
        /// <param name="dbType">DbType类型</param>
        /// <param name="size">长度</param>
        /// <param name="direction">参数类型</param>
        /// <returns>SQL命令执行对象</returns>
        public static DbCommand AddParameter(
            this DbCommand command,
            string name,
            object value,
            DbType? dbType = null,
            int? size = null,
            ParameterDirection direction = ParameterDirection.Input)
        {
            if (command == null)
            {
                throw new ArgumentNullException(nameof(command));
            }

            var parameter = command.CreateParameter();

            parameter.ParameterName = name;
            parameter.Direction = direction;
            parameter.IsNullable = value == null;
            parameter.DbType = dbType.HasValue ? dbType.Value : ResolveDbType(value);
            parameter.Value = string.IsNullOrWhiteSpace(value?.ToString()) ? DBNull.Value : value;

            if (size.HasValue)
            {
                parameter.Size = size.Value;
            }

            command.Parameters.Add(parameter);

            return command;
        }

        /// <summary>
        /// 执行查询。
        /// </summary>
        /// <param name="command">数据库命令对象</param>
        /// <returns>受影响的记录数</returns>
        public static int Execute(this DbCommand command)
        {
            if (command == null)
            {
                throw new ArgumentNullException(nameof(command));
            }

            if (command.Connection == null)
            {
                throw new ArgumentException(UNSET_CONNECTION);
            }

            if (command.Connection.State != ConnectionState.Open)
            {
                command.Connection.Open();
            }

            return command.ExecuteNonQuery();
        }

        /// <summary>
        /// 获取参数值。
        /// </summary>
        /// <typeparam name="T">参数值类型</typeparam>
        /// <param name="command">SQL命令执行对象</param>
        /// <param name="parameterName">参数名称</param>
        /// <returns>参数值</returns>
        public static T GetParameterValue<T>(this DbCommand command, string parameterName)
        {
            if (command.Parameters.Contains(parameterName))
            {
                return (T)command.Parameters[parameterName].Value;
            }

            throw new ArgumentOutOfRangeException(parameterName);
        }

        #endregion

        #region 数据转换扩展

        /// <summary>
        /// 从数据库命令中获取数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="command">数据库命令对象</param>
        /// <returns>数据信息</returns>
        public static T GetData<T>(this DbCommand command) where T : new()
        {
            if (command == null)
            {
                throw new ArgumentNullException(nameof(command));
            }

            if (command.Connection == null)
            {
                throw new ArgumentException(UNSET_CONNECTION);
            }

            if (command.Connection.State != ConnectionState.Open)
            {
                command.Connection.Open();
            }

            if (command.Transaction == null)
            {
                return command.ExecuteReader().GetData<T>();
            }

            return command.ExecuteReader().GetData<T>();
        }

        /// <summary>
        /// 从数据库命令中获取数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="command">数据库命令对象</param>
        /// <param name="dataMappingHandler">数据映射回调</param>
        /// <returns>数据信息</returns>
        public static T GetData<T>(this DbCommand command, Func<DbDataReader, T> dataMappingHandler)
        {
            if (command == null)
            {
                throw new ArgumentNullException(nameof(command));
            }

            if (command.Connection == null)
            {
                throw new ArgumentException(UNSET_CONNECTION);
            }

            if (command.Connection.State != ConnectionState.Open)
            {
                command.Connection.Open();
            }

            if (command.Transaction == null)
            {
                return command.ExecuteReader().GetData(dataMappingHandler);
            }

            return command.ExecuteReader().GetData(dataMappingHandler);
        }

        /// <summary>
        /// 从数据库命令中获取数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="command">数据库命令对象</param>
        /// <returns>数据集合</returns>
        public static IList<T> GetDatas<T>(this DbCommand command) where T : new()
        {
            if (command == null)
            {
                throw new ArgumentNullException(nameof(command));
            }

            if (command.Connection == null)
            {
                throw new ArgumentException(UNSET_CONNECTION);
            }

            if (command.Connection.State != ConnectionState.Open)
            {
                command.Connection.Open();
            }

            if (command.Transaction == null)
            {
                return command.ExecuteReader().GetDatas<T>();
            }

            return command.ExecuteReader().GetDatas<T>();
        }

        /// <summary>
        /// 从数据库命令中获取数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="command">数据库命令对象</param>
        /// <param name="dataMappingHandler">数据映射回调</param>
        /// <returns>数据集合</returns>
        public static IList<T> GetDatas<T>(this DbCommand command, Func<DbDataReader, T> dataMappingHandler)
        {
            if (command == null)
            {
                throw new ArgumentNullException(nameof(command));
            }

            if (command.Connection == null)
            {
                throw new ArgumentException(UNSET_CONNECTION);
            }

            if (command.Connection.State != ConnectionState.Open)
            {
                command.Connection.Open();
            }

            if (command.Transaction == null)
            {
                return command.ExecuteReader().GetDatas(dataMappingHandler);
            }

            return command.ExecuteReader().GetDatas(dataMappingHandler);
        }

        /// <summary>
        /// 从DataReader中获取单条数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="dataReader">DataReader对象</param>
        /// <returns>数据对象</returns>
        public static T GetData<T>(this DbDataReader dataReader) where T : new()
        {
            if (dataReader == null)
            {
                throw new ArgumentNullException(nameof(dataReader));
            }

            if (dataReader.IsClosed)
            {
                throw new ArgumentException(DATAREADER_ALREADY_CLOSED);
            }

            using (dataReader)
            {
                return dataReader.Read() ? ReflectionDataMapping<T>(dataReader) : default(T);
            }
        }

        /// <summary>
        /// 从DataReader对象中获取数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="dataReader">DataReader对象</param>
        /// <param name="dataMappingHandler">数据映射回调</param>
        /// <returns>数据信息</returns>
        public static T GetData<T>(this DbDataReader dataReader, Func<DbDataReader, T> dataMappingHandler)
        {
            if (dataReader == null)
            {
                throw new ArgumentNullException(nameof(dataReader));
            }

            if (dataMappingHandler == null)
            {
                throw new ArgumentNullException(nameof(dataMappingHandler));
            }

            if (dataReader.IsClosed)
            {
                throw new ArgumentException(DATAREADER_ALREADY_CLOSED);
            }

            using (dataReader)
            {
                return dataReader.Read() ? dataMappingHandler(dataReader) : default(T);
            }
        }

        /// <summary>
        /// 从DataReader对象中获取数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="dataReader">DataReader对象</param>
        /// <returns>数据集合</returns>
        public static IList<T> GetDatas<T>(this DbDataReader dataReader) where T : new()
        {
            if (dataReader == null)
            {
                throw new ArgumentNullException(nameof(dataReader));
            }

            if (dataReader.IsClosed)
            {
                throw new Exception(DATAREADER_ALREADY_CLOSED);
            }

            var datas = new List<T>();

            using (dataReader)
            {
                while (dataReader.Read())
                {
                    var data = ReflectionDataMapping<T>(dataReader);

                    datas.Add(data);
                }

                return datas;
            }
        }

        /// <summary>
        /// 从DataReader对象中获取数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="dataReader">DataReader对象</param>
        /// <param name="dataMappingHandler">数据映射回调</param>
        /// <returns>数据集合</returns>
        public static IList<T> GetDatas<T>(this DbDataReader dataReader, Func<DbDataReader, T> dataMappingHandler)
        {
            if (dataReader == null)
            {
                throw new ArgumentNullException(nameof(dataReader));
            }

            if (dataMappingHandler == null)
            {
                throw new ArgumentNullException(nameof(dataMappingHandler));
            }

            if (dataReader.IsClosed)
            {
                throw new Exception(DATAREADER_ALREADY_CLOSED);
            }

            var datas = new List<T>();

            using (dataReader)
            {
                while (dataReader.Read())
                {
                    var data = dataMappingHandler(dataReader);

                    datas.Add(data);
                }

                dataReader.Close();

                return datas;
            }
        }

        /// <summary>
        /// 从DataTable中获取数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="dataTable">DataTable对象</param>
        /// <returns>数据集合</returns>
        public static IList<T> GetDatas<T>(this DataTable dataTable) where T : new()
        {
            if (dataTable == null)
            {
                throw new ArgumentNullException(nameof(dataTable));
            }

            return (from DataRow dataRow in dataTable.Rows
                    select
                        ReflectionDataMapping<T>(dataRow)).ToList();
        }

        /// <summary>
        /// 从DataTable中获取数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="dataTable">DataTable对象</param>
        /// <param name="dataMappingHandler">数据映射回调</param>
        /// <returns>数据集合</returns>
        public static IList<T> GetDatas<T>(
            this DataTable dataTable,
            Func<DataRow, T> dataMappingHandler) where T : new()
        {
            if (dataTable == null)
            {
                throw new ArgumentNullException(nameof(dataTable));
            }

            if (dataMappingHandler == null)
            {
                throw new ArgumentNullException(nameof(dataMappingHandler));
            }

            return (from DataRow dataRow in dataTable.Rows
                    select
                        dataMappingHandler(dataRow)).ToList();
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 根据反射建立的数据映射。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="dataReader">DataReader对象</param>
        /// <returns>数据</returns>
        internal static T ReflectionDataMapping<T>(DbDataReader dataReader) where T : new()
        {
            var data = new T();
            var type = typeof(T);

            if (!PropertiesDictionary.ContainsKey(type))
            {
                PropertiesDictionary.Add(type, type.GetProperties());
            }

            var columnNames = new List<string>();

            for (var index = 0; index < dataReader.FieldCount; index++)
            {
                columnNames.Add(dataReader.GetName(index));
            }

            var properties = PropertiesDictionary[type];

            foreach (var property in properties)
            {
                if (!property.CanRead || !property.CanWrite)
                {
                    continue;
                }

                var name = property.Name;
                var columns = property.GetCustomAttributes(typeof(ColumnAttribute), true);

                if (columns.Length > 0)
                {
                    var column = columns[0] as ColumnAttribute;

                    name = string.IsNullOrWhiteSpace(column.Name) ? name : column.Name;
                }

                if ((!property.PropertyType.IsValueType &&
                     property.PropertyType != typeof(string)) || !columnNames.Contains(name))
                {
                    continue;
                }

                var fieldValue = dataReader[name];

                if (!Convert.IsDBNull(fieldValue))
                {
                    property.SetValue(data, fieldValue);
                }
                else if (!property.PropertyType.IsValueType)
                {
                    property.SetValue(data, null);
                }
            }

            return data;
        }

        /// <summary>
        /// 根据反射建立的数据映射。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="dataRow">数据行信息</param>
        /// <returns>数据</returns>
        private static T ReflectionDataMapping<T>(DataRow dataRow) where T : new()
        {
            var data = new T();
            var type = typeof(T);

            if (!PropertiesDictionary.ContainsKey(type))
            {
                PropertiesDictionary.Add(type, type.GetProperties());
            }

            var columnNames = (from DataColumn column in dataRow.Table.Columns select column.ColumnName).ToList();
            var properties = PropertiesDictionary[type];

            foreach (var property in properties)
            {
                if (!property.CanRead || !property.CanWrite)
                {
                    continue;
                }

                var name = property.Name;
                var columns = property.GetCustomAttributes(typeof(ColumnAttribute), true);

                if (columns.Length > 0)
                {
                    var column = columns[0] as ColumnAttribute;

                    name = string.IsNullOrWhiteSpace(column.Name) ? name : column.Name;
                }

                if ((!property.PropertyType.IsValueType &&
                    property.PropertyType != typeof(string)) || !columnNames.Contains(name))
                {
                    continue;
                }
                var fieldValue = dataRow[name];

                if (!Convert.IsDBNull(fieldValue))
                {
                    property.SetValue(data, fieldValue, null);
                }
                else if (!property.PropertyType.IsValueType)
                {
                    property.SetValue(data, null);
                }
            }

            return data;
        }

        /// <summary>
        /// 解析DbType。
        /// </summary>
        /// <param name="value">数据</param>
        /// <returns>DbType类型</returns>
        internal static DbType ResolveDbType(object value)
        {
            var result = DbType.String;

            if (value is int || value is int?)
            {
                result = DbType.Int32;
            }

            if (value is uint || value is uint?)
            {
                result = DbType.UInt32;
            }

            if (value is short || value is short?)
            {
                result = DbType.Int16;
            }

            if (value is ushort || value is ushort?)
            {
                result = DbType.UInt16;
            }

            if (value is long || value is long?)
            {
                result = DbType.Int64;
            }

            if (value is ulong || value is ulong?)
            {
                result = DbType.UInt64;
            }

            if (value is DateTime || value is DateTime?)
            {
                result = DbType.DateTime;
            }

            if (value is float || value is float?)
            {
                result = DbType.Single;
            }

            if (value is double || value is double?)
            {
                result = DbType.Double;
            }

            if (value is decimal || value is decimal?)
            {
                result = DbType.Decimal;
            }

            if (value is bool || value is bool?)
            {
                result = DbType.Boolean;
            }

            if (value is byte || value is byte?)
            {
                result = DbType.Byte;
            }

            if (value is Guid || value is Guid?)
            {
                result = DbType.Guid;
            }

            if (value is byte[])
            {
                result = DbType.Binary;
            }

            if (value is char || value is char? || value is char[])
            {
                result = DbType.String;
            }

            return result;
        }

        #endregion
    }
}
