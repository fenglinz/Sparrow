using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Threading.Tasks;
using Dapper;

namespace Mercurius.Prime.Data.Dapper
{
    /// <summary>
    /// 数据持久化执行对象
    /// </summary>
    public class ExecuteObject
    {
        #region Fields

        #endregion

        #region Constructor

        /// <summary>
        /// 
        /// </summary>
        /// <param name="func"></param>
        /// <param name="parameters"></param>
        internal ExecuteObject(Func<string> func, object parameters, CommandType commandType = CommandType.Text)
        {
            this.CommandTextFunc = func;
            this.CommandType = commandType;
            this.ParameterObject = parameters;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="func"></param>
        /// <param name="parameters"></param>
        internal ExecuteObject(Func<string> func, DapperParameters parameters, CommandType commandType = CommandType.Text)
        {
            this.CommandTextFunc = func;
            this.CommandType = commandType;
            this.Parameters = parameters;
        }

        #endregion

        #region Properties

        internal CommandType CommandType { get; set; }

        /// <summary>
        /// 动态查询语句回调
        /// </summary>
        internal Func<string> CommandTextFunc { get; set; }

        internal object ParameterObject { get; set; }

        /// <summary>
        /// dapper查询条件
        /// </summary>
        internal DapperParameters Parameters { get; set; }

        #endregion

        #region Public Method

        public async Task<int> Execute(DbConnection connection, DbTransaction transaction = null)
        {
            await connection.OpenAsync();

            return await connection?.ExecuteAsync(this.CommandTextFunc(), this.ParameterObject ?? this.Parameters.DynamicParameters, transaction, commandType: this.CommandType);
        }

        public async Task<T> QueryForObject<T>(DbConnection connection, DbTransaction transaction = null)
        {
            await connection.OpenAsync();


            return await connection?.QueryFirstOrDefaultAsync<T>(this.CommandTextFunc(), this.ParameterObject ?? this.Parameters.DynamicParameters, transaction, commandType: this.CommandType);
        }

        public async Task<IEnumerable<T>> QueryForList<T>(DbConnection connection, DbTransaction transaction = null)
        {
            await connection.OpenAsync();

            return await connection?.QueryAsync<T>(this.CommandTextFunc(), this.ParameterObject ?? this.Parameters.DynamicParameters, transaction, commandType: this.CommandType);
        }

        #endregion
    }
}
