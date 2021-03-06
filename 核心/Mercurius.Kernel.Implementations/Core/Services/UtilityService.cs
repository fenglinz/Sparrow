﻿using Mercurius.Kernel.Contracts.Core.Services;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Ado;
using Mercurius.Prime.Core.Services;
using Mercurius.Prime.Data.Support;

namespace Mercurius.Kernel.Implementations.Core.Services
{
    /// <summary>
    /// 工具服务接口实现。
    /// </summary>
    public class UtilityService : ServiceSupport, IUtilityService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Kernel.Repositories.Core.RepositoryUtils";

        #endregion

        #region IUtilityService接口实现

        /// <summary>
        /// 获取所有用户自定义架构。
        /// </summary>
        /// <returns>架构名称</returns>
        public ResponseSet<string> GetSchemas()
        {
            return this.QueryForList<string>(NS, "GetSchemas");
        }

        /// <summary>
        /// 获取所有表的信息。
        /// </summary>
        /// <returns>表信息集合</returns>
        public ResponseSet<Table> GetTables()
        {
            return this.QueryForList<Table>(NS, "GetTables");
        }

        /// <summary>
        /// 获取所有自定义表的DDL语句。
        /// </summary>
        /// <returns>表的DDL语句</returns>
        public ResponseSet<string> GetTablesDefinition()
        {
            return this.QueryForList<string>(NS, "GetTablesDefinition");
        }

        /// <summary>
        /// 获取表的数据添加脚本。
        /// </summary>
        /// <param name="fullName">表的完整名称</param>
        /// <returns>表的数据添加脚本</returns>
        public ResponseSet<string> GetAddDatasScript(string fullName)
        {
            return this.QueryForList<string>(NS, "GetAddDatasScript", fullName);
        }

        /// <summary>
        /// 获取数据库中的所有用户自定义过程(包括函数)完整名称。
        /// </summary>
        /// <returns>用户自定义过程完整名称</returns>
        public ResponseSet<string> GetProcedures()
        {
            return this.QueryForList<string>(NS, "GetProcedures");
        }

        /// <summary>
        /// 获取数据库中过程(包括函数)的详细定义。
        /// </summary>
        /// <param name="fullName">过程完整名称</param>
        /// <returns>过程定义</returns>
        public ResponseSet<string> GetProcedureDefinition(string fullName)
        {
            return this.QueryForList<string>(NS, "GetProcedureDefinition", fullName);
        }

        #endregion
    }
}
