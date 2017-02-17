using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Data;
using System.Linq.Expressions;
using Newtonsoft.Json;

namespace Mercurius.Prime.Core.Dynamic
{
    /// <summary>
    /// 查询条件集合。
    /// </summary>
    public class Criteria
    {
        #region 属性

        /// <summary>
        /// 查询条件。
        /// </summary>
        [JsonProperty]
        internal List<Condition> Conditions { get; }

        /// <summary>
        /// 排序条件。
        /// </summary>
        [JsonProperty]
        internal List<Order> Orders { get; }

        /// <summary>
        /// 有效的查询条件。
        /// </summary>
        internal IList<Condition> EffectiveConditions => this.Conditions?.Where(c => (int)c.Op >= 6 || !string.IsNullOrWhiteSpace(c.Value?.ToString())).ToList();

        public DynamicQuery DynamicQuery { get; set; }

        #endregion

        #region 构造方法

        public Criteria()
        {
            this.Orders = new List<Order>();
            this.Conditions = new List<Condition>();
        }

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="dynamicQuery">SQL命令构建器</param>
        public Criteria(DynamicQuery dynamicQuery) : this()
        {
            this.DynamicQuery = dynamicQuery;
        }

        #endregion

        #region 查询&排序

        /// <summary>
        /// 清空查询条件。
        /// </summary>
        public void Clear()
        {
            this.Orders.Clear();
            this.Conditions.Clear();
        }

        /// <summary>
        /// 添加并且条件。
        /// </summary>
        /// <param name="condition">查询条件</param>
        /// <returns>查询条件集合</returns>
        public Criteria And(Condition condition)
        {
            condition.JoinType = "AND";
            this.Conditions.Add(condition);

            return this;
        }

        /// <summary>
        /// 添加或查询条件。
        /// </summary>
        /// <param name="condition">查询条件</param>
        /// <returns>查询条件集合</returns>
        public Criteria Or(Condition condition)
        {
            condition.JoinType = "OR";
            this.Conditions.Add(condition);

            return this;
        }

        /// <summary>
        /// 添加排序。
        /// </summary>
        /// <param name="orders">排序信息集合</param>
        /// <returns>动态查询对象</returns>
        public Criteria OrderBy(params Order[] orders)
        {
            if (!orders.IsEmpty())
            {
                orders.ForEach(o => this.Orders.Add(o));
            }

            return this;
        }

        /// <summary>
        /// 添加排序。
        /// </summary>
        /// <param name="propertyName">查询属性名称</param>
        /// <param name="orderBy">排序方式(默认升序)</param>
        /// <returns>动态查询对象</returns>
        public Criteria OrderBy(string propertyName, OrderBy orderBy = Dynamic.OrderBy.Asc)
        {
            this.Orders.Add(new Order(propertyName, orderBy));

            return this;
        }

        #endregion

        /// <summary>
        /// 是否启用缓存。
        /// </summary>
        /// <param name="cacheable">是否启用缓存</param>
        public Criteria Cacheable(bool cacheable)
        {
            this.DynamicQuery.Cacheable(cacheable);

            return this;
        }

        #region Create

        /// <summary>
        /// 添加数据。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="entity">实体对象</param>
        /// <returns>自动增长列或受影响的记录数</returns>
        public decimal Create<T>(T entity) where T : class, new()
        {
            return this.DynamicQuery.Create(entity);
        }

        /// <summary>
        /// 添加数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="columnValues">字段-值集合</param>
        /// <returns>自动增长列值或受影响的条数</returns>
        public decimal Create(string tableName, NameValueCollection columnValues)
        {
            return this.DynamicQuery.Create(tableName, columnValues);
        }

        #endregion

        #region Update

        /// <summary>
        /// 更新数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="fields">更新字段-值实体数据对象</param>
        /// <returns>受影响的行数</returns>
        public int Update(string tableName, object fields)
        {
            return this.DynamicQuery.Update(tableName, fields, this);
        }

        /// <summary>
        /// 跟新数据。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="fields">更新字段实体对象</param>
        /// <returns>受影响的记录数</returns>
        public int Update<T>(object fields) where T : class, new()
        {
            return this.DynamicQuery.Update<T>(fields, this);
        }

        #endregion

        #region CreateOrUpdate

        /// <summary>
        /// 添加或者修改数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="columnValues">字段-值集合</param>
        /// <returns>受影响的行数</returns>
        public int CreateOrUpdate(string tableName, NameValueCollection columnValues)
        {
            return this.DynamicQuery.CreateOrUpdate(tableName, columnValues);
        }

        /// <summary>
        /// 添加或者更新数据。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="entity">实体对象</param>
        /// <returns>受影响的记录数</returns>
        public int CreateOrUpdate<T>(T entity) where T : class, new()
        {
            return this.DynamicQuery.CreateOrUpdate(entity);
        }

        #endregion

        #region Remove

        /// <summary>
        /// 删除数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <returns>受影响的行数</returns>
        public int Remove(string tableName)
        {
            return this.DynamicQuery.Remove(tableName, this);
        }

        /// <summary>
        /// 删除数据。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <returns>受影响的记录数</returns>
        public int Remove<T>() where T : class, new()
        {
            return this.DynamicQuery.Remove<T>(this);
        }

        #endregion

        #region Single

        /// <summary>
        /// 查询单条数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="columns">返回的列集合</param>
        /// <returns>数据行对象</returns>
        public DataRow Single(string tableName, string[] columns = null)
        {
            return this.DynamicQuery.Single(tableName, this, columns);
        }

        /// <summary>
        /// 查询单条数据。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="columns">返回的列集合</param>
        /// <returns>实体对象</returns>
        public T Single<T>(string[] columns = null) where T : class, new()
        {
            return this.DynamicQuery.Single<T>(this, columns);
        }

        #endregion

        #region List

        /// <summary>
        /// 查询所有数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="columns">返回的列集合</param>
        /// <returns>数据表对象</returns>
        public DataTable List(string tableName, string[] columns = null)
        {
            return this.DynamicQuery.List(tableName, this, columns);
        }

        /// <summary>
        /// 查询所有数据。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="columns">返回列的集合</param>
        /// <returns>数据集合</returns>
        public IList<T> List<T>(string[] columns = null) where T : class, new()
        {
            return this.DynamicQuery.List<T>(this, columns);
        }

        #endregion

        #region PagedList

        /// <summary>
        /// 分页查询数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="pageIndex">页序号</param>
        /// <param name="pageSize">每页显示记录大小</param>
        /// <param name="totalRecords">总记录数</param>
        /// <param name="columns">返回列集合</param>
        /// <returns>数据表对象</returns>
        public DataTable PagedList(string tableName, int pageIndex, int pageSize, out int totalRecords, string[] columns = null)
        {
            return this.DynamicQuery.PagedList(tableName, pageIndex, pageSize, out totalRecords, this, columns);
        }

        /// <summary>
        /// 分页查询数据。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="pageIndex">页序号</param>
        /// <param name="pageSize">每页显示记录大小</param>
        /// <param name="totalRecords">总记录数</param>
        /// <param name="columns">返回列集合</param>
        /// <returns>实体集合</returns>
        public IList<T> PagedList<T>(int pageIndex, int pageSize, out int totalRecords, string[] columns = null) where T : class, new()
        {
            return this.DynamicQuery.PagedList<T>(pageIndex, pageSize, out totalRecords, this, columns);
        }

        #endregion
    }

    /// <summary>
    /// 查询信息。
    /// </summary>
    /// <typeparam name="T">实体类型</typeparam>
    public class Criteria<T> : Criteria where T : class, new()
    {
        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="dynamicQuery">动态查询对象</param>
        internal Criteria(DynamicQuery dynamicQuery) : base(dynamicQuery)
        {
        }

        #endregion

        #region 查询&排序

        /// <summary>
        /// 添加并且条件。
        /// </summary>
        /// <returns>查询条件集合</returns>
        public Criteria<T> And(Expression<Func<T, object>> expression, object value, Op op = Op.Eq)
        {
            var result = new Condition
            {
                Op = op,
                Value = value,
                JoinType = "AND",
                PropertyName = expression.GetPropertyName()
            };

            this.Conditions.Add(result);

            return this;
        }

        /// <summary>
        /// 添加或查询条件。
        /// </summary>
        /// <returns>查询条件集合</returns>
        public Criteria<T> Or(Expression<Func<T, object>> expression, object value, Op op = Op.Eq)
        {
            var result = new Condition
            {
                Op = op,
                Value = value,
                JoinType = "OR",
                PropertyName = expression.GetPropertyName()
            };

            this.Conditions.Add(result);

            return this;
        }

        /// <summary>
        /// 添加排序。
        /// </summary>
        /// <param name="expression"></param>
        /// <param name="orderBy">排序方式(默认升序)</param>
        /// <returns>动态查询对象</returns>
        public Criteria<T> OrderBy(Expression<Func<T, object>> expression, OrderBy orderBy = Dynamic.OrderBy.Asc)
        {
            this.Orders.Add(new Order(expression.GetPropertyName(), orderBy));

            return this;
        }

        #endregion

        /// <summary>
        /// 是否启用缓存。
        /// </summary>
        /// <param name="cacheable">是否启用缓存</param>
        public new Criteria<T> Cacheable(bool cacheable)
        {
            this.DynamicQuery.Cacheable(cacheable);

            return this;
        }

        /// <summary>
        /// 添加数据。
        /// </summary>
        /// <param name="entity">实体对象</param>
        /// <returns>自动增长列或受影响的记录数</returns>
        public decimal Create(T entity)
        {
            return this.DynamicQuery.Create(entity);
        }

        /// <summary>
        /// 更新数据。
        /// </summary>
        /// <param name="fields">更新数据实体对象</param>
        /// <returns>受影响的记录数</returns>
        public int Update(object fields)
        {
            return this.DynamicQuery.Update<T>(fields, this);
        }

        /// <summary>
        /// 添加或者更新数据。
        /// </summary>
        /// <param name="entity">实体对象</param>
        /// <returns>受影响的记录数</returns>
        public int CreateOrUpdate(T entity)
        {
            return this.DynamicQuery.CreateOrUpdate(entity);
        }

        /// <summary>
        /// 删除数据。
        /// </summary>
        /// <returns>受影响的记录数</returns>
        public int Remove()
        {
            return this.DynamicQuery.Remove<T>(this);
        }

        /// <summary>
        /// 查询单条数据。
        /// </summary>
        /// <param name="columns">返回的列集合</param>
        /// <returns>实体对象</returns>
        public T Single(string[] columns = null)
        {
            return this.DynamicQuery.Single<T>(this, columns);
        }

        /// <summary>
        /// 查询所有数据。
        /// </summary>
        /// <param name="columns">返回的列集合</param>
        /// <returns>实体对象集合</returns>
        public IList<T> List(string[] columns = null)
        {
            return this.DynamicQuery.List<T>(this, columns);
        }

        /// <summary>
        /// 分页查询数据。
        /// </summary>
        /// <param name="pageIndex">页序号</param>
        /// <param name="pageSize">每页显示记录数</param>
        /// <param name="totalRecords">总记录数</param>
        /// <param name="columns">返回的列集合</param>
        /// <returns>实体对象集合</returns>
        public IList<T> PagedList(int pageIndex, int pageSize, out int totalRecords, string[] columns = null)
        {
            return this.DynamicQuery.PagedList<T>(pageIndex, pageSize, out totalRecords, this, columns);
        }
    }
}
