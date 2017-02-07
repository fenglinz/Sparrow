using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Linq;
using System.Linq.Expressions;
using Mercurius.Infrastructure.Ado;
using static Mercurius.Infrastructure.Dynamic.ConditionExtension;

namespace Mercurius.Infrastructure.Dynamic
{
    /// <summary>
    /// 动态查询对象。
    /// </summary>
    public class DynamicQuery : IDataAccess, IDisposable
    {
        #region 属性

        /// <summary>
        /// 动态查询提供者对象。
        /// </summary>
        public DynamicQueryProvider Provider { get; set; }

        #endregion

        #region 公开方法

        /// <summary>
        /// 是否启用缓存。
        /// </summary>
        /// <param name="cacheable">是否启用缓存</param>
        internal void Cacheable(bool cacheable)
        {
            this.Provider.Cacheable = cacheable;
        }

        /// <summary>
        /// 添加查询条件。
        /// </summary>
        /// <param name="conditions">查询条件</param>
        /// <returns>查询条件集合</returns>
        public Criteria Where(object conditions)
        {
            var criteria = new Criteria(this);

            if (conditions != null)
            {
                if (conditions is Condition)
                {
                    criteria.Conditions.Add(conditions as Condition);
                }
                else if (conditions is IEnumerable<Condition>)
                {
                    var items = conditions as IEnumerable<Condition>;

                    if (!items.IsEmpty())
                    {
                        criteria.Conditions.AddRange(items.Where(i => i.Value != null));
                    }
                }
                else
                {
                    var items = from i in PropertyHelper.GetProperties(conditions)
                                let v = i.GetValue(conditions)
                                where v != null
                                select Eq(i.Name, v);

                    criteria.Conditions.AddRange(items);
                }
            }

            return criteria;
        }

        /// <summary>
        /// 添加查询条件。
        /// </summary>
        /// <param name="propertyName">属性名</param>
        /// <param name="value">值</param>
        /// <param name="op">查询方式</param>
        /// <returns>查询条件集合</returns>
        public Criteria Where(string propertyName, object value = null, Op op = Op.Eq)
        {
            var criteria = new Criteria(this);

            criteria.Conditions.Add(new Condition(propertyName, op, value));

            return criteria;
        }

        /// <summary>
        /// 添加查询条件。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="expression">属性表达式</param>
        /// <param name="value">值</param>
        /// <param name="op">查询方式</param>
        /// <returns>查询条件集合</returns>
        public Criteria<T> Where<T>(Expression<Func<T, object>> expression, object value = null, Op op = Op.Eq) where T : class, new()
        {
            var criteria = new Criteria<T>(this);

            criteria.Conditions.Add(new Condition(expression.GetPropertyName(), op, value));

            return criteria;
        }

        #endregion

        #region IDataAccess接口实现

        #region Create

        /// <summary>
        /// 添加数据。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="entity">实体对象</param>
        /// <returns>自动增长列或者受影响的行数</returns>
        public decimal Create<T>(T entity) where T : class, new()
        {
            return this.Provider.Create(entity);
        }

        /// <summary>
        /// 添加数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="columnValues">字段-值集合</param>
        /// <returns>自动增长列或者受影响的行数</returns>
        public decimal Create(string tableName, NameValueCollection columnValues)
        {
            return this.Provider.Create(tableName, columnValues);
        }

        #endregion

        #region Update

        /// <summary>
        /// 更新数据。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="entity">数据对象</param>
        /// <param name="criteria">更新条件</param>
        /// <returns>受影响的行数</returns>
        public int Update<T>(object entity, Criteria criteria = null) where T : class, new()
        {
            return this.Provider.Update<T>(entity, criteria);
        }

        /// <summary>
        /// 更新数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="fields">更新字段集合</param>
        /// <param name="criteria">更新条件</param>
        /// <returns>受影响的行数</returns>
        public int Update(string tableName, object fields, Criteria criteria = null)
        {
            return this.Provider.Update(tableName, fields, criteria);
        }

        #endregion

        #region CreateOrUpdate

        /// <summary>
        /// 添加或者更新数据。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="entity">实体对象</param>
        /// <returns>受影响的行数</returns>
        public int CreateOrUpdate<T>(T entity) where T : class, new()
        {
            return this.Provider.CreateOrUpdate(entity);
        }

        /// <summary>
        /// 添加或者更新数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="columnValues">字段-值集合</param>
        /// <returns>受影响的行数</returns>
        public int CreateOrUpdate(string tableName, NameValueCollection columnValues)
        {
            return this.Provider.CreateOrUpdate(tableName, columnValues);
        }

        #endregion

        #region Remove

        /// <summary>
        /// 删除数据。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="criteria">删除条件</param>
        /// <returns>受影响的行数</returns>
        public int Remove<T>(Criteria criteria = null) where T : class, new()
        {
            return this.Provider.Remove<T>(criteria);
        }

        /// <summary>
        /// 删除数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="criteria">删除条件</param>
        /// <returns>受影响的行数</returns>
        public int Remove(string tableName, Criteria criteria = null)
        {
            return this.Provider.Remove(tableName, criteria);
        }

        #endregion

        #region Single

        /// <summary>
        /// 获取单条数据。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="criteria">查询条件</param>
        /// <param name="columns">返回的列集合</param>
        /// <returns>数据对象</returns>
        public T Single<T>(Criteria criteria = null, string[] columns = null) where T : class, new()
        {
            return this.Provider.Single<T>(criteria, columns);
        }

        /// <summary>
        /// 获取单条数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="criteria">查询条件</param>
        /// <param name="columns">返回的列集合</param>
        /// <returns>数据行对象</returns>
        public DataRow Single(string tableName, Criteria criteria = null, string[] columns = null)
        {
            return this.Provider.Single(tableName, criteria, columns);
        }

        #endregion

        #region List

        /// <summary>
        /// 查询所有数据。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="criteria">查询条件</param>
        /// <param name="columns">返回的列集合</param>
        /// <returns>数据集合</returns>
        public IList<T> List<T>(Criteria criteria = null, string[] columns = null) where T : class, new()
        {
            return this.Provider.List<T>(criteria, columns);
        }

        /// <summary>
        /// 查询所有数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="criteria">查询条件</param>
        /// <param name="columns">返回的列集合</param>
        /// <returns>表数据</returns>
        public DataTable List(string tableName, Criteria criteria = null, string[] columns = null)
        {
            return this.Provider.List(tableName, criteria, columns);
        }

        #endregion

        #region PagedList

        /// <summary>
        /// 分页查询数据。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="pageIndex">当前页</param>
        /// <param name="pageSize">每页显示的记录数</param>
        /// <param name="totalRecords">总记录数</param>
        /// <param name="criteria">查询条件</param>
        /// <param name="columns">返回的列集合</param>
        /// <returns>数据集合</returns>
        public IList<T> PagedList<T>(int pageIndex, int pageSize, out int totalRecords, Criteria criteria = null, string[] columns = null) where T : class, new()
        {
            return this.Provider.PagedList<T>(pageIndex, pageSize, out totalRecords, criteria, columns);
        }

        /// <summary>
        /// 分页查询数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="pageIndex">当前页</param>
        /// <param name="pageSize">每页显示的记录数</param>
        /// <param name="totalRecords">总记录数</param>
        /// <param name="criteria">查询条件</param>
        /// <param name="columns">返回的列集合</param>
        /// <returns>数据表对象</returns>
        public DataTable PagedList(string tableName, int pageIndex, int pageSize, out int totalRecords, Criteria criteria = null, string[] columns = null)
        {
            return this.Provider.PagedList(tableName, pageIndex, pageSize, out totalRecords, criteria, columns);
        }

        #endregion

        #endregion

        #region IDisposable接口实现

        /// <summary>
        /// 释放数据库连接。
        /// </summary>
        public void Dispose()
        {
            this.Provider.Dispose();
        }

        #endregion
    }
}
