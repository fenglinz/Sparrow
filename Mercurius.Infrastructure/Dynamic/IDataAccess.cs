using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;

namespace Mercurius.Infrastructure.Dynamic
{
    /// <summary>
    /// 数据访问接口。
    /// </summary>
    internal interface IDataAccess
    {
        /// <summary>
        /// 添加数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="columnValues">字段-值集合</param>
        /// <returns>自动增长列或受影响的行数</returns>
        decimal Create(string tableName, NameValueCollection columnValues);

        /// <summary>
        /// 更新数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="fields">更新属性</param>
        /// <param name="criteria">更新条件</param>
        /// <returns>受影响的行数</returns>
        int Update(string tableName, object fields, Criteria criteria = null);

        /// <summary>
        /// 添加或者更新数据。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="columnValues">字段-值集合</param>
        /// <returns>受影响的行数</returns>
        int CreateOrUpdate(string tableName, NameValueCollection columnValues);

        /// <summary>
        /// 删除实体信息。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="criteria">删除条件</param>
        /// <returns>受影响的行数</returns>
        int Remove(string tableName, Criteria criteria = null);

        /// <summary>
        /// 获取单条实体信息。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="criteria">查询条件</param>
        /// <param name="columns">返回数据的列集合</param>
        /// <returns>实体信息</returns>
        DataRow Single(string tableName, Criteria criteria = null, string[] columns = null);

        /// <summary>
        /// 获取实体信息。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="criteria">查询条件</param>
        /// <param name="columns">返回数据的列集合</param>
        /// <returns>实体信息</returns>
        DataTable List(string tableName, Criteria criteria = null, string[] columns = null);

        /// <summary>
        /// 分页获取实体信息。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="pageIndex">当前页</param>
        /// <param name="pageSize">每页显示记录数</param>
        /// <param name="totalRecords">总记录数</param>
        /// <param name="criteria">查询条件</param>
        /// <param name="columns">返回数据的列集合</param>
        /// <returns>实体信息集合</returns>
        DataTable PagedList(string tableName, int pageIndex, int pageSize, out int totalRecords, Criteria criteria = null, string[] columns = null);

        /// <summary>
        /// 添加数据。
        /// </summary>
        /// <param name="entity">实体信息</param>
        /// <returns>自动增长列或受影响的行数</returns>
        decimal Create<T>(T entity) where T : class, new();

        /// <summary>
        /// 更新数据。
        /// </summary>
        /// <param name="fields">更新属性</param>
        /// <param name="criteria">更新条件</param>
        /// <returns>受影响的行数</returns>
        int Update<T>(object fields, Criteria criteria = null) where T : class, new();

        /// <summary>
        /// 添加或者更新数据。
        /// </summary>
        /// <param name="entity">实体信息</param>
        /// <returns>受影响的行数</returns>
        int CreateOrUpdate<T>(T entity) where T : class, new();

        /// <summary>
        /// 删除实体信息。
        /// </summary>
        /// <param name="criteria">查询条件</param>
        /// <returns>受影响的行数</returns>
        int Remove<T>(Criteria criteria = null) where T : class, new();

        /// <summary>
        /// 获取单条实体信息。
        /// </summary>
        /// <param name="criteria">查询条件</param>
        /// <param name="columns">返回数据的列集合</param>
        /// <returns>实体信息</returns>
        T Single<T>(Criteria criteria = null, string[] columns = null) where T : class, new();

        /// <summary>
        /// 获取实体信息。
        /// </summary>
        /// <param name="criteria">查询条件</param>
        /// <param name="columns">返回数据的列集合</param>
        /// <returns>实体信息</returns>
        IList<T> List<T>(Criteria criteria = null, string[] columns = null) where T : class, new();

        /// <summary>
        /// 分页获取实体信息。
        /// </summary>
        /// <param name="pageIndex">当前页</param>
        /// <param name="pageSize">每页显示记录数</param>
        /// <param name="totalRecords">总记录数</param>
        /// <param name="criteria">查询条件</param>
        /// <param name="columns">返回数据的列集合</param>
        /// <returns>实体信息集合</returns>
        IList<T> PagedList<T>(int pageIndex, int pageSize, out int totalRecords, Criteria criteria = null, string[] columns = null) where T : class, new();
    }
}
