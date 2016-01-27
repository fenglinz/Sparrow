using System;
using System.Collections.Generic;
using System.Data;
using IBatisNet.DataMapper;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Entities;

namespace Mercurius.Sparrow.Repositories
{
    /// <summary>
    /// 基于IBatis.Net持久化类。
    /// </summary>
    public sealed class Persistence
    {
        #region 属性

        /// <summary>
        /// 获取或者设置SqlMapper管理对象。
        /// </summary>
        public SqlMapperManager SqlMapperManager { get; set; }

        #endregion

        #region 公开方法

        /// <summary>
        /// 创建实体信息。
        /// </summary>
        /// <param name="ns">Statement命名空间</param>
        /// <param name="innerId">SqlMap内部命令Id</param>
        /// <param name="parameterObject">参数信息</param>
        public void Create(StatementNamespace ns, string innerId, object parameterObject)
        {
            parameterObject = this.GetParameterObject(parameterObject);

            this.SqlMapperManager[RWDecision.Write].Insert(ns.GetStatementId(innerId), parameterObject);
        }

        /// <summary>
        /// 执行更新操作。
        /// </summary>
        /// <param name="ns">Statement命名空间</param>
        /// <param name="innerId">SqlMap内部命令Id</param>
        /// <param name="parameterObject">参数信息</param>
        /// <returns>受影响的行数</returns>
        public int Update(StatementNamespace ns, string innerId, object parameterObject = null)
        {
            parameterObject = this.GetParameterObject(parameterObject);

            return this.SqlMapperManager[RWDecision.Write].Update(ns.GetStatementId(innerId), parameterObject);
        }

        /// <summary>
        /// 删除实体信息。
        /// </summary>
        /// <param name="ns">Statement命名空间</param>
        /// <param name="innerId">SqlMap内部命令Id</param>
        /// <param name="searchObject">查询参数</param>
        /// <returns>受影响的行数</returns>
        public int Delete(StatementNamespace ns, string innerId, object searchObject = null)
        {
            searchObject = this.GetParameterObject(searchObject);

            return this.SqlMapperManager[RWDecision.Write].Delete(ns.GetStatementId(innerId), searchObject);
        }

        /// <summary>
        /// 查询实体信息，并返回单个数据。
        /// </summary>
        /// <param name="ns">Statement命名空间</param>
        /// <param name="innerId">SqlMap内部命令Id</param>
        /// <param name="searchObject">查询参数</param>
        /// <returns>返回实体信息</returns>
        public T QueryForObject<T>(StatementNamespace ns, string innerId, object searchObject = null)
        {
            searchObject = this.GetParameterObject(searchObject);

            return this.SqlMapperManager[RWDecision.Read].QueryForObject<T>(ns.GetStatementId(innerId), searchObject);
        }

        /// <summary>
        /// 查询实体信息。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="ns">Statement命名空间</param>
        /// <param name="innerId">SqlMap内部命令Id</param>
        /// <param name="searchObject">查询参数</param>
        /// <returns>实体信息集合</returns>
        public IList<T> QueryForList<T>(StatementNamespace ns, string innerId, object searchObject = null)
        {
            searchObject = this.GetParameterObject(searchObject);

            return this.SqlMapperManager[RWDecision.Read].QueryForList<T>(ns.GetStatementId(innerId), searchObject);
        }

        /// <summary>
        /// 分页查询实体信息。
        /// <p>
        /// 查询总记录数的SqlMap命令Id必须为：statementId实参+Count
        /// </p>
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="ns">Statement命名空间</param>
        /// <param name="innerId">SqlMap内部命令Id</param>
        /// <param name="totalRecords">总记录数</param>
        /// <param name="searchObject">查询参数</param>
        /// <returns>实体信息集合</returns>
        public IList<T> QueryForPaginatedList<T>(StatementNamespace ns, string innerId, out int totalRecords, object searchObject = null)
        {
            searchObject = this.GetParameterObject(searchObject);
            totalRecords = this.QueryForObject<int>(ns, innerId + "Count", searchObject);

            return this.QueryForList<T>(ns, innerId, searchObject);
        }

        /// <summary>
        /// 查询数据为DataTable。
        /// </summary>
        /// <param name="ns">Statement命名空间</param>
        /// <param name="innerId">SqlMap命令Id</param>
        /// <param name="searchObject">参数信息</param>
        /// <returns>DataTable对象</returns>
        public DataTable QueryForDataTable(StatementNamespace ns, string innerId, object searchObject = null)
        {
            var result = new DataSet();
            var isSessionLocal = false;
            var session = this.SqlMapperManager[RWDecision.Read].LocalSession;
            var statementName = ns.GetStatementId(innerId);

            if (session == null)
            {
                session = new SqlMapSession(this.SqlMapperManager[RWDecision.Read]);
                session.OpenConnection();
                isSessionLocal = true;
            }

            var command = this.GetDbCommand(statementName, this.GetParameterObject(searchObject));

            // 解决无法读取Oracle Long类型的数据。
            //if (command is OracleCommand)
            //{
            //    (command as OracleCommand).InitialLONGFetchSize = -1;
            //}
            try
            {
                command.Connection = session.Connection;
                var adapter = session.CreateDataAdapter(command);

                adapter.Fill(result);
            }
            finally
            {
                if (isSessionLocal)
                {
                    session.CloseConnection();
                }
            }

            return result.Tables[0];
        }

        /// <summary>
        /// 执行存储过程。
        /// </summary>
        /// <param name="rw">读-写库选择</param>
        /// <param name="produceName">存储过程名称</param>
        /// <param name="commandHandler">Command命令处理回调</param>
        public void ExecuteStoredProcedure(RWDecision rw, string produceName, Action<IDbCommand> commandHandler = null)
        {
            this.SqlMapperManager[rw].ExecuteStoredProcedure(produceName, commandHandler);
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 获取数据库命令处理对象。
        /// </summary>
        /// <param name="statementId">SqlMap命令Id</param>
        /// <param name="parameterObject">命令参数对象</param>
        /// <returns>数据库命令处理对象</returns>
        private IDbCommand GetDbCommand(string statementId, object parameterObject)
        {
            var statement = this.SqlMapperManager[RWDecision.Read].GetMappedStatement(statementId).Statement;
            var mappedStatement = this.SqlMapperManager[RWDecision.Read].GetMappedStatement(statementId);
            var session = this.SqlMapperManager[RWDecision.Read].LocalSession ?? this.SqlMapperManager[RWDecision.Read].OpenConnection();
            var request = statement.Sql.GetRequestScope(mappedStatement, parameterObject, session);

            mappedStatement.PreparedCommand.Create(request, session, statement, parameterObject);

            var result = session.CreateCommand(CommandType.Text);

            result.CommandType = statement.CommandType;
            result.CommandText = request.IDbCommand.CommandText;

            foreach (IDataParameter item in request.IDbCommand.Parameters)
            {
                var parameter = session.CreateDataParameter();
                parameter.ParameterName = item.ParameterName;
                parameter.Value = item.Value;
                parameter.DbType = item.DbType;
                parameter.Direction = item.Direction;

                result.Parameters.Add(parameter);
            }

            return result;
        }

        /// <summary>
        /// 创建字典参数。
        /// </summary>
        /// <param name="obj">属性</param>
        /// <returns>字典</returns>
        private object GetParameterObject(object obj)
        {
            if (obj == null)
            {
                return null;
            }

            var type = obj.GetType();

            // 非匿名类型对象时直接返回。
            if (obj is string || obj is Domain || obj is SearchObject ||
                obj is IDictionary<string, object> || obj is IDictionary<string, string> ||
                type.IsPrimitive || type.IsValueType)
            {
                return obj;
            }

            // 匿名类型对象时转换为字典对象。
            var result = new Dictionary<string, object>();

            foreach (var property in ParameterHelper.GetProperties(obj))
            {
                result.Add(property.Name, property.GetValue(obj));
            }

            return result;
        }

        #endregion
    }
}
