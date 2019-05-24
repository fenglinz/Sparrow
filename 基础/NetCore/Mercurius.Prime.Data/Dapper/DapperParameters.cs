using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using Dapper;

namespace Mercurius.Prime.Data
{
    /// <summary>
    /// dapper参数信息
    /// </summary>
    public class DapperParameters
    {
        #region Properties

        internal DynamicParameters DynamicParameters { get; set; }

        #endregion

        #region Constructor

        /// <summary>
        /// 
        /// </summary>
        /// <param name="template"></param>
        internal DapperParameters(object template)
        {
            this.DynamicParameters = new DynamicParameters(template);
        }

        #endregion

        #region Public Methods

        /// <summary>
        /// 添加输出参数
        /// </summary>
        /// <param name="name">参数名称</param>
        /// <param name="dbType">数据类型</param>
        /// <returns>dapper参数信息</returns>
        public DapperParameters Output(string name, DbType? dbType = null, int? size = null)
        {
            this.DynamicParameters.Add(name, null, dbType, ParameterDirection.Output, size);

            return this;
        }

        /// <summary>
        /// 添加输入输出参数
        /// </summary>
        /// <param name="name">参数名称</param>
        /// <param name="value">值</param>
        /// <param name="dbType">参数类型</param>
        /// <returns>dapper参数信息</returns>
        public DapperParameters InputOutput(string name, object value, DbType? dbType = null)
        {
            this.DynamicParameters.Add(name, value, dbType, ParameterDirection.InputOutput);

            return this;
        }

        /// <summary>
        /// 获取参数值
        /// </summary>
        /// <typeparam name="T">值类型</typeparam>
        /// <param name="name">参数名称</param>
        /// <returns>值</returns>
        public T Get<T>(string name)
        {
            return this.DynamicParameters.Get<T>(name);
        }

        #endregion
    }
}
