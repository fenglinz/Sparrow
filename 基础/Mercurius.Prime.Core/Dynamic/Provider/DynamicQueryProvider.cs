using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Reflection;
using System.Text;
using Mercurius.Prime.Core.Ado;
using Mercurius.Prime.Core.Cache;
using Mercurius.Prime.Core.Entities;
using Mercurius.Prime.Core.Logger;
using Mercurius.Prime.Core.Utils;

namespace Mercurius.Prime.Core.Dynamic
{
    /// <summary>
    /// 动态查询提供者。
    /// </summary>
    public abstract class DynamicQueryProvider
    {
        #region 内部类

        /// <summary>
        /// 分页数据信息。
        /// </summary>
        /// <typeparam name="TList">实体类型</typeparam>
        internal class PagedData<TList>
        {
            #region 属性

            /// <summary>
            /// 数据集合。
            /// </summary>
            public TList Datas { get; }

            /// <summary>
            /// 总记录数。
            /// </summary>
            public int TotalRecords { get; }

            #endregion

            #region 构造方法

            /// <summary>
            /// 构造方法。
            /// </summary>
            /// <param name="totalRecords">总记录数</param>
            /// <param name="datas">数据信息集合</param>
            public PagedData(int totalRecords, TList datas)
            {
                this.Datas = datas;
                this.TotalRecords = totalRecords;
            }

            #endregion
        }

        #endregion

        #region 常量

        private const string ArgumnetCanNotNull = "参数不能为空！";
        private const string TableOrViewNotExists = "数据库中不存在此表或视图！";

        /// <summary>
        /// 查询操作。
        /// </summary>
        protected static readonly string[] Operations = { "=", ">", ">=", "<", "<=" };

        #endregion

        #region 字段

        /// <summary>
        /// 命令参数索引。
        /// </summary>
        protected int _parameterIndex;

        /// <summary>
        /// 数据库访问工具类。
        /// </summary>
        protected readonly DbHelper _dbHelper;

        /// <summary>
        /// 同步锁对象。
        /// </summary>
        private static object locker = new object();

        /// <summary>
        /// 表信息字典。
        /// Key:实体类型、Value:表名称。
        /// </summary>
        private static readonly Dictionary<Type, Table> TableDictionary;

        /// <summary>
        /// 实体信息集合字典。
        /// Key:实体类型、Value:实体信息集合。
        /// </summary>
        private static readonly Dictionary<Type, Columns> ColumnsDictionary;

        #endregion

        #region 属性

        /// <summary>
        /// 日志记录接口对象。
        /// </summary>
        public ILogger Logger { get; set; }

        /// <summary>
        /// 缓存对象。
        /// </summary>
        public CacheProvider Cache { get; set; }

        /// <summary>
        /// 是否启用缓存。
        /// </summary>
        internal bool Cacheable { get; set; } = true;

        /// <summary>
        /// 获取数据库元数据信息对象。
        /// </summary>
        public DbMetadata DbMetadata
        {
            get { return this._dbHelper.DbMetadata; }
            protected set { this._dbHelper.DbMetadata = value; }
        }

        #endregion

        #region 构造方法

        /// <summary>
        /// 静态构造方法。
        /// </summary>
        static DynamicQueryProvider()
        {
            TableDictionary = new Dictionary<Type, Table>();
            ColumnsDictionary = new Dictionary<Type, Columns>();
        }

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="connectionStringName">config文件中connectionString节点名称</param>
        protected DynamicQueryProvider(string connectionStringName = "Default")
        {
            this._dbHelper = new DbHelper(connectionStringName);
        }

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="providerName">数据库提供者名称</param>
        /// <param name="connectionString">数据库连接字符串</param>
        protected DynamicQueryProvider(string providerName, string connectionString)
        {
            this._dbHelper = new DbHelper(providerName, connectionString);
        }

        #endregion

        #region 抽象方法

        /// <summary>
        /// 获取安全的表名称(处理特殊表名和大小写)。
        /// </summary>
        /// <param name="table">表名称</param>
        /// <returns>安全的表名称</returns>
        protected abstract string GetSafeTableName(string table);

        /// <summary>
        /// 创建查询条件片段。
        /// </summary>
        /// <param name="propertyName">属性名</param>
        /// <param name="op">查询操作</param>
        /// <returns>2元组：结果一、查询条件片段；结果二、查询参数</returns>
        protected abstract Tuple<string, string> CreateFragment(string propertyName, Op op);

        /// <summary>
        /// 添加数据。
        /// </summary>
        /// <param name="command">SQL命令执行对象</param>
        /// <param name="tableName">表名称</param>
        /// <param name="allColumns">所有列信息</param>
        /// <returns>命令执行对象</returns>
        protected abstract void ConfigureCreateCommand(DbCommand command, string tableName, Columns allColumns);

        /// <summary>
        /// 更新数据。
        /// </summary>
        /// <param name="command">SQL命令执行对象</param>
        /// <param name="tableName">表名称</param>
        /// <param name="allColumns">所有列</param>
        /// <param name="columns">所有列信息</param>
        /// <param name="criteria">更新条件</param>
        /// <returns>命令执行对象</returns>
        protected abstract void ConfigureUpdateCommand(DbCommand command, string tableName, Columns allColumns, Columns columns, Criteria criteria = null);

        /// <summary>
        /// 添加或者更新数据。
        /// </summary>
        /// <param name="command">SQL命令执行对象</param>
        /// <param name="tableName">表名称</param>
        /// <param name="allColumns">所有列信息</param>
        /// <returns>命令执行对象</returns>
        protected abstract void ConfigureCreateOrUpdateCommand(DbCommand command, string tableName, Columns allColumns);

        /// <summary>
        /// 删除数据。
        /// </summary>
        /// <param name="command">SQL命令执行对象</param>
        /// <param name="tableName">表名称</param>
        /// <param name="allColumns">所有列信息</param>
        /// <param name="criteria">删除条件</param>
        /// <returns>命令执行对象</returns>
        protected abstract void ConfigureRemoveCommand(DbCommand command, string tableName, Columns allColumns, Criteria criteria = null);

        /// <summary>
        /// 根据查询条件返回一条结果。
        /// </summary>
        /// <param name="command">SQL命令执行对象</param>
        /// <param name="tableName">表名称</param>
        /// <param name="allColumns">所有列信息</param>
        /// <param name="criteria">查询条件</param>
        /// <param name="columns">数据库信息返回列表</param>
        /// <returns>命令执行对象</returns>
        protected abstract void ConfigureSingleCommand(DbCommand command, string tableName, Columns allColumns, Criteria criteria = null, string[] columns = null);

        /// <summary>
        /// 根据查询条件返回所有结果。
        /// </summary>
        /// <param name="command">SQL命令执行对象</param>
        /// <param name="tableName">表名称</param>
        /// <param name="allColumns">所有列信息</param>
        /// <param name="criteria">查询条件</param>
        /// <param name="columns">数据库信息返回列表</param>
        /// <returns>命令执行对象</returns>
        protected abstract void ConfigureListCommand(DbCommand command, string tableName, Columns allColumns, Criteria criteria = null, string[] columns = null);

        /// <summary>
        /// 根据查询条件分页返回数据。
        /// </summary>
        /// <param name="command">SQL命令执行对象</param>
        /// <param name="tableName">表名称</param>
        /// <param name="allColumns">所有列信息</param>
        /// <param name="pageIndex">当前页数</param>
        /// <param name="pageSize">每页显示记录数</param>
        /// <param name="totalRecords">总记录数</param>
        /// <param name="criteria">查询条件</param>
        /// <param name="columns">数据库信息返回列表</param>
        /// <returns>命令执行对象</returns>
        protected abstract void ConfigurePagedListCommand(DbCommand command, string tableName, Columns allColumns, int pageIndex, int pageSize, out int totalRecords, Criteria criteria = null, string[] columns = null);

        #endregion

        #region 受保护方法

        /// <summary>
        /// 记录Command命令信息。
        /// </summary>
        /// <param name="description">描述</param>
        /// <param name="command">SQL命令对象</param>
        protected void RecordCommandInfo(string description, DbCommand command)
        {
            if (command != null)
            {
                var sqlBuilder = new StringBuilder();

                sqlBuilder.AppendFormat("{0}: {1}", description, command.CommandText);

                var index = 1;

                if (!command.Parameters.IsEmpty())
                {
                    sqlBuilder.AppendFormat("  参数信息: ");
                }

                foreach (DbParameter item in command.Parameters)
                {
                    sqlBuilder.AppendFormat(command.Parameters.Count != index++ ?
                        "{0}={1}({2}), " : "{0}={1}({2})", item.ParameterName, item.Value, item.DbType);
                }

                this.Logger?.Write("动态查询", description, sqlBuilder.ToString(), Level.Debug);
            }
        }

        #endregion

        #region 公开方法

        #region TryConnect

        /// <summary>
        /// 尝试连接数据库。
        /// </summary>
        /// <returns>是否连接成功</returns>
        public bool TryConnect()
        {
            return this._dbHelper.TryConnect();
        }

        #endregion

        #region Create

        /// <summary>
        /// 添加数据。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="entity">实体对象</param>
        /// <returns>返回值或者受影响的行数</returns>
        public decimal Create<T>(T entity) where T : class, new()
        {
            return this.Create(ResolveTable<T>().GetFullTable(), ResolveColumns(entity));
        }

        /// <summary>
        /// 添加数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="columnValues">字段-值集合</param>
        /// <returns>返回值或者受影响的行数</returns>
        public decimal Create(string tableName, NameValueCollection columnValues)
        {
            return this.Create(tableName, this.GetColumns(tableName, columnValues));
        }

        #endregion

        #region Update

        /// <summary>
        /// 更新数据。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="entity">更新数据对象</param>
        /// <param name="criteria">更新条件</param>
        /// <returns>受影响的条数</returns>
        public int Update<T>(object entity, Criteria criteria = null) where T : class, new()
        {
            var allColumns = ResolveColumns(entity as T);
            var updateColumns = entity is T ? allColumns : GetColumns(entity);

            return this.Update(ResolveTable<T>().GetFullTable(), allColumns, updateColumns, criteria);
        }

        /// <summary>
        /// 更新数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="fields">更新数据对象</param>
        /// <param name="criteria">更行条件</param>
        /// <returns>受影响的条数</returns>
        public int Update(string tableName, object fields, Criteria criteria = null)
        {
            var columnValues = fields as NameValueCollection;
            var allColumns = this.DbMetadata.GetColumns(tableName).AsColumns();
            var updateColumns = columnValues != null ? this.GetColumns(tableName, columnValues) : GetColumns(fields);

            return this.Update(tableName, allColumns, updateColumns, criteria);
        }

        #endregion

        #region CreateOrUpdate

        /// <summary>
        /// 添加或者修改数据。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="entity">实体对象</param>
        /// <returns>受影响的条数或者自增长列的值</returns>
        public int CreateOrUpdate<T>(T entity) where T : class, new()
        {
            return this.CreateOrUpdate(ResolveTable<T>().GetFullTable(), ResolveColumns(entity));
        }

        /// <summary>
        /// 添加或者修改数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="columnValues">字段-值集合</param>
        /// <returns>受影响的条数或者自增长列的值</returns>
        public int CreateOrUpdate(string tableName, NameValueCollection columnValues)
        {
            return this.CreateOrUpdate(tableName, this.GetColumns(tableName, columnValues));
        }

        #endregion

        #region Remove

        /// <summary>
        /// 删除数据。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="criteria">删除条件</param>
        /// <returns>受影响的条数</returns>
        public int Remove<T>(Criteria criteria = null) where T : class, new()
        {
            return this.Remove(ResolveTable<T>().GetFullTable(), criteria);
        }

        /// <summary>
        /// 删除数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="criteria">删除条件</param>
        /// <returns>受影响的条数</returns>
        public int Remove(string tableName, Criteria criteria = null)
        {
            var command = this.CreateCommand();
            var allColumns = this.DbMetadata.GetColumns(tableName).AsColumns();

            this.ConfigureRemoveCommand(command, tableName, allColumns, criteria);

            this._parameterIndex = 0;

            command.Connection.SafeOpen();
            var result = command.ExecuteNonQuery();

            // 删除缓存。
            this.RemoveCache(tableName);

            return result;
        }

        #endregion

        #region Single

        /// <summary>
        /// 获取单条数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="criteria">查询条件</param>
        /// <param name="columns">返回字段集合</param>
        /// <returns>数据行对象</returns>
        public DataRow Single(string tableName, Criteria criteria = null, string[] columns = null)
        {
            DataRow result;
            var command = this.CreateCommand();
            var table = this.GetTableInfo(tableName);

            if (table == null)
            {
                throw new Exception(TableOrViewNotExists);
            }

            var allColumns = this.DbMetadata.GetColumns(tableName).AsColumns();

            if (!table.IsView)
            {
                // 从缓存中获取数据。
                result = this.GetCache<DataRow>(tableName, criteria);

                // 如缓存中存在数据，返回缓存数据。
                if (result != null)
                {
                    this._parameterIndex = 0;

                    return result;
                }
            }

            this.ConfigureSingleCommand(command, tableName, allColumns, criteria, columns);

            var dataTable = this._dbHelper.ExecuteDataTable(command);

            result = dataTable.Rows.Count > 0 ? dataTable.Rows[0] : null;

            if (!table.IsView)
            {
                // 添加缓存。
                this.AddCache(tableName, result, criteria);
            }

            return result;
        }

        /// <summary>
        /// 获取单条数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="criteria">查询条件</param>
        /// <param name="columns">返回的列集合</param>
        /// <returns>数据对象</returns>
        public T Single<T>(Criteria criteria = null, string[] columns = null) where T : class, new()
        {
            T result;
            var command = this.CreateCommand();
            var table = ResolveTable<T>();

            if (table == null)
            {
                throw new Exception(TableOrViewNotExists);
            }

            var allColumns = ResolveColumns<T>();

            if (!table.IsView)
            {
                // 从缓存中获取数据。
                result = this.GetCache<T>(table.GetFullTable(), criteria);

                // 如缓存中存在数据，返回缓存数据。
                if (result != null)
                {
                    this._parameterIndex = 0;

                    return result;
                }
            }

            this.ConfigureSingleCommand(command, table.GetFullTable(), allColumns, criteria, columns);

            result = command.GetData<T>();

            if (!table.IsView)
            {
                // 添加缓存。
                this.AddCache(table.GetFullTable(), result, criteria);
            }

            return result;
        }

        #endregion

        #region List

        /// <summary>
        /// 获取所有数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="criteria">查询条件</param>
        /// <param name="columns">返回列的集合</param>
        /// <returns>所有数据</returns>
        public DataTable List(string tableName, Criteria criteria = null, string[] columns = null)
        {
            DataTable result;
            var command = this.CreateCommand();
            var table = this.GetTableInfo(tableName);

            if (table == null)
            {
                throw new Exception(TableOrViewNotExists);
            }

            var allColumns = this.DbMetadata.GetColumns(tableName).AsColumns();

            if (!table.IsView)
            {
                // 从缓存中获取数据。
                result = this.GetCache<DataTable>(tableName, criteria);

                // 如缓存中存在数据，返回缓存数据。
                if (result != null)
                {
                    this._parameterIndex = 0;

                    return result;
                }
            }

            this.ConfigureListCommand(command, tableName, allColumns, criteria, columns);

            result = this._dbHelper.ExecuteDataTable(command);

            if (!table.IsView)
            {
                // 添加缓存。
                this.AddCache(tableName, result, criteria);
            }

            return result;
        }

        /// <summary>
        /// 返回所有数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="criteria">查询条件</param>
        /// <param name="columns">返回的列集合</param>
        /// <returns>所有数据</returns>
        public IList<T> List<T>(Criteria criteria = null, string[] columns = null) where T : class, new()
        {
            IList<T> result;
            var command = this.CreateCommand();
            var table = ResolveTable<T>();

            if (table == null)
            {
                throw new Exception(TableOrViewNotExists);
            }

            var allColumns = ResolveColumns<T>();

            if (!table.IsView)
            {
                // 从缓存中获取数据。
                result = this.GetCache<IList<T>>(table.GetFullTable(), criteria);

                // 如缓存中存在数据，返回缓存数据。
                if (result != null)
                {
                    this._parameterIndex = 0;

                    return result;
                }
            }

            this.ConfigureListCommand(command, table.GetFullTable(), allColumns, criteria, columns);

            result = command.GetDatas<T>();

            if (!table.IsView)
            {
                // 添加缓存。
                this.AddCache(table.GetFullTable(), result, criteria);
            }

            return result;
        }

        #endregion

        #region PagedList

        /// <summary>
        /// 分页返回数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="pageIndex">页序号</param>
        /// <param name="pageSize">每页显示数据条数</param>
        /// <param name="totalRecords">总记录数</param>
        /// <param name="criteria">查询条件</param>
        /// <param name="columns">返回的列集合</param>
        /// <returns>数据表</returns>
        public DataTable PagedList(string tableName, int pageIndex, int pageSize, out int totalRecords, Criteria criteria = null, string[] columns = null)
        {
            var cacheKey = string.Empty;
            var command = this.CreateCommand();
            var table = this.GetTableInfo(tableName);

            if (table == null)
            {
                throw new Exception(TableOrViewNotExists);
            }

            var allColumns = this.DbMetadata.GetColumns(tableName).AsColumns();

            if (!table.IsView)
            {
                cacheKey = $"{tableName.Replace(',', '_').ToUpper()}_{pageIndex}_{pageSize}_{criteria.AsJson()}";

                // 从缓存中获取数据。
                var result = this.GetCache<PagedData<DataTable>>(cacheKey, criteria);

                // 如缓存中存在数据，返回缓存数据。
                if (result != null)
                {
                    this._parameterIndex = 0;

                    totalRecords = result.TotalRecords;

                    return result.Datas;
                }
            }

            this.ConfigurePagedListCommand(command, tableName, allColumns, pageIndex, pageSize, out totalRecords, criteria, columns);

            var datas = this._dbHelper.ExecuteDataTable(command);

            if (!table.IsView)
            {
                // 添加缓存。
                this.AddCache(cacheKey, new PagedData<DataTable>(totalRecords, datas), criteria);
            }

            return datas;
        }

        /// <summary>
        /// 分页返回数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="pageIndex">页序号</param>
        /// <param name="pageSize">每页显示记录数</param>
        /// <param name="totalRecords">总记录数</param>
        /// <param name="criteria">查询条件</param>
        /// <param name="columns">返回的列集合</param>
        /// <returns>数据集合</returns>
        public IList<T> PagedList<T>(int pageIndex, int pageSize, out int totalRecords, Criteria criteria, string[] columns) where T : class, new()
        {
            var cacheKey = string.Empty;
            var command = this.CreateCommand();
            var table = ResolveTable<T>();

            if (table == null)
            {
                throw new Exception(TableOrViewNotExists);
            }

            var allColumns = ResolveColumns<T>();

            if (!table.IsView)
            {
                cacheKey = $"{table.GetFullTable()}${pageIndex}${pageSize}${criteria.AsJson()}";

                // 从缓存中获取数据。
                var result = this.GetCache<PagedData<IList<T>>>(cacheKey, criteria);

                // 如缓存中存在数据，返回缓存数据。
                if (result != null)
                {
                    this._parameterIndex = 0;

                    totalRecords = result.TotalRecords;

                    return result.Datas;
                }
            }

            this.ConfigurePagedListCommand(command, table.GetFullTable(), allColumns, pageIndex, pageSize, out totalRecords, criteria, columns);

            var datas = command.GetDatas<T>();

            if (!table.IsView)
            {
                // 添加缓存。
                this.AddCache(cacheKey, new PagedData<IList<T>>(totalRecords, datas), criteria);
            }

            return datas;
        }

        #endregion

        #endregion

        #region 事务处理

        /// <summary>
        /// 开始事务处理。
        /// </summary>
        /// <param name="isolationLevel">事务锁定级别</param>
        /// <returns>动态查询对象</returns>
        public DynamicQueryProvider BeginTransaction(IsolationLevel? isolationLevel = null)
        {
            this._dbHelper.BeginTransaction(isolationLevel);

            return this;
        }

        /// <summary>
        /// 提交事务。
        /// </summary>
        public void Commit()
        {
            this._dbHelper.Commit();
        }

        /// <summary>
        /// 回滚事务。
        /// </summary>
        public void Rollback()
        {
            this._dbHelper.Rollback();
        }

        #endregion

        #region IDisposable接口实现

        /// <summary>
        /// 提交/回滚事务。
        /// </summary>
        public void Dispose()
        {
            this._dbHelper.Dispose();
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 根据实体类型元数据解析表名称。
        /// </summary>
        /// <returns>表名称</returns>
        private static Table ResolveTable<T>()
        {
            var typeInfo = typeof(T);

            lock (locker)
            {
                if (TableDictionary.ContainsKey(typeInfo))
                {
                    return TableDictionary[typeInfo];
                }

                var tableAttr = typeInfo.GetCustomAttribute<TableAttribute>(true);
                var tableName = tableAttr == null ? typeInfo.Name : tableAttr.Name;
                var items = tableName.Split('.');

                TableDictionary.Add(typeInfo, new Table
                {
                    Name = items.Length > 1 ? items[1] : items[0],
                    Schema = items.Length > 1 ? items[0] : string.Empty,
                    IsView = tableAttr != null && tableAttr.IsView
                });
            }

            return TableDictionary[typeInfo];
        }

        /// <summary>
        /// 解析数据库实体信息。
        /// </summary>
        /// <param name="entity">实体信息</param>
        /// <returns>表的实体数据信息集合</returns>
        private static Columns ResolveColumns<T>(T entity = null) where T : class, new()
        {
            var typeInfo = typeof(T);

            lock (locker)
            {
                if (!ColumnsDictionary.ContainsKey(typeInfo) || ColumnsDictionary[typeInfo].IsEmpty())
                {
                    var props = from p in typeInfo.GetProperties()
                                let c = p.GetCustomAttribute<ColumnAttribute>(true)
                                where
                                   (c == null || (c != null && !c.IsIgnore))
                                select new Column
                                {
                                    Name = c == null ? p.Name : string.IsNullOrWhiteSpace(c.Name) ? p.Name : c.Name,
                                    PropertyName = p.Name,
                                    Description = c?.Description,
                                    IsNullable = c?.IsNullable ?? true,
                                    IsPrimaryKey = c?.IsPrimaryKey ?? false,
                                    IsIdentity = c?.IsIdentity ?? false,
                                    IsReadOnly = c?.IsReadOnly ?? false,
                                    Value = entity == null ? null : p.GetValue(entity)
                                };

                    if (ColumnsDictionary.ContainsKey(typeInfo))
                    {
                        ColumnsDictionary[typeInfo].Add(props);
                    }
                    else
                    {
                        ColumnsDictionary.Add(typeInfo, new Columns { props });
                    }
                }
                else if (entity != null)
                {
                    var columns = ColumnsDictionary[typeInfo];

                    foreach (var column in columns)
                    {
                        column.Value = typeInfo.GetProperty(column.PropertyName).GetValue(entity);
                    }
                }

                return ColumnsDictionary[typeInfo];
            }
        }

        /// <summary>
        /// 获取实体的名称值集合。
        /// </summary>
        /// <param name="instance">实体对象</param>
        /// <returns>名称值集合</returns>
        private static Columns GetColumns(object instance)
        {
            return (from prop in PropertyHelper.GetProperties(instance)
                    select new Column
                    {
                        Name = prop.Name,
                        PropertyName = prop.Name,
                        Value = prop.GetValue(instance)
                    }).AsColumns();
        }

        /// <summary>
        /// 获取数据库字段元数据。
        /// </summary>
        /// <param name="tableName">字段名</param>
        /// <param name="columnValues">字段值</param>
        /// <returns>字段元数据集合</returns>
        private Columns GetColumns(string tableName, NameValueCollection columnValues = null)
        {
            if (string.IsNullOrWhiteSpace(tableName))
            {
                throw new ArgumentException(ArgumnetCanNotNull, nameof(tableName));
            }

            var metaColumns = this.DbMetadata.GetColumns(tableName);

            if (columnValues.IsEmpty())
            {
                return new Columns { metaColumns };
            }

            foreach (var item in metaColumns)
            {
                if (columnValues.AllKeys.Contains(item.PropertyName))
                {
                    item.Value = columnValues[item.PropertyName];
                }
            }

            return new Columns { metaColumns };
        }

        /// <summary>
        /// 创建数据库命令执行对象。
        /// </summary>
        /// <returns>数据库命令执行对象</returns>
        private DbCommand CreateCommand()
        {
            return this._dbHelper.CreateCommand();
        }

        /// <summary>
        /// 获取表的元数据信息。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <returns>表的元数据信息</returns>
        private Table GetTableInfo(string tableName)
        {
            if (string.IsNullOrWhiteSpace(tableName))
            {
                throw new ArgumentNullException(ArgumnetCanNotNull, nameof(tableName));
            }

            return this.DbMetadata.GetTable(tableName);
        }

        /// <summary>
        /// 添加数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="allColumns">添加字段集合</param>
        /// <returns>返回值或者受影响的行数</returns>
        private decimal Create(string tableName, Columns allColumns)
        {
            var command = this.CreateCommand();

            this.ConfigureCreateCommand(command, tableName, allColumns);

            this._parameterIndex = 0;

            command.Connection.SafeOpen();

            var result = command.CommandText.Contains("SELECT") ? Convert.ToDecimal(command.ExecuteScalar()) : command.ExecuteNonQuery();

            // 删除缓存。
            this.RemoveCache(tableName);

            return result;
        }

        /// <summary>
        /// 更新数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="allColumns">表的说有字段信息集合</param>
        /// <param name="columns">更新字段集合</param>
        /// <param name="criteria">更新条件</param>
        /// <returns>受影响的条数</returns>
        private int Update(string tableName, Columns allColumns, Columns columns, Criteria criteria = null)
        {
            var command = this.CreateCommand();

            this.ConfigureUpdateCommand(command, tableName, allColumns, columns, criteria);

            this._parameterIndex = 0;

            command.Connection.SafeOpen();

            var result = command.ExecuteNonQuery();

            // 删除缓存
            this.RemoveCache(tableName);

            return result;
        }

        /// <summary>
        /// 添加或者修改数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="allColumns">字段-值集合</param>
        /// <returns>受影响的条数或者自增长列的值</returns>
        private int CreateOrUpdate(string tableName, Columns allColumns)
        {
            var command = this.CreateCommand();

            this.ConfigureCreateOrUpdateCommand(command, tableName, allColumns);

            this._parameterIndex = 0;

            command.Connection.SafeOpen();
            var result = command.ExecuteNonQuery();

            // 删除缓存。
            this.RemoveCache(tableName);

            return result;
        }

        #region 缓存处理

        /// <summary>
        /// 添加缓存。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="value">缓存数据</param>
        /// <param name="criteria">查询条件</param>
        private void AddCache(string tableName, object value, Criteria criteria = null)
        {
            if (!this.Cacheable || this.Cache == null || value == null)
            {
                return;
            }

            var cacheKey = this.Cache.GetCacheKey(tableName, criteria.AsJson());

            this._parameterIndex = 0;

            this.Cache.Add(cacheKey, value);
        }

        /// <summary>
        /// 获取缓存值。
        /// </summary>
        /// <typeparam name="R">返回值类型</typeparam>
        /// <returns>缓存值</returns>
        private R GetCache<R>(string tableName, Criteria criteria = null)
        {
            if (!this.Cacheable || this.Cache == null)
            {
                return default(R);
            }

            var cacheKey = this.Cache.GetCacheKey(tableName, $"{typeof(R).FullName}_{criteria.AsJson()}");

            return this.Cache.Get<R>(cacheKey);
        }

        /// <summary>
        /// 删除缓存。
        /// </summary>
        private void RemoveCache(string tableName)
        {
            if (!this.Cacheable || this.Cache == null)
            {
                return;
            }

            var cacheKey = this.Cache.GetCacheKey(tableName, "");

            this.Cache?.RemoveStarts(cacheKey);
        }

        #endregion

        #endregion
    }
}
