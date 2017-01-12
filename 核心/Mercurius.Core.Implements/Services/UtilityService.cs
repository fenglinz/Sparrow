﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Core.Interfaces.Services;
using Mercurius.Prime.Core.Ado;
using Mercurius.Prime.Core.Services;
using Mercurius.Prime.Data.IBatisNet;
using Mercurius.Prime.Data.Support;

namespace Mercurius.Sparrow.Services.Core
{
    /// <summary>
    /// 工具服务接口实现。
    /// </summary>
    public class UtilityService : ServiceSupport, IUtilityService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Repositories.Core.RepositoryUtils";

        #endregion

        #region IUtilityService接口实现

        /// <summary>
        /// 获取所有用户自定义架构。
        /// </summary>
        /// <returns>架构名称</returns>
        public ResponseSet<string> GetSchemas()
        {
            return this.InvokeService(nameof(GetSchemas),
                () => this.Persistence.QueryForList<string>(NS, "GetSchemas"), cacheable: false);
        }

        /// <summary>
        /// 获取所有表的信息。
        /// </summary>
        /// <returns>表信息集合</returns>
        public ResponseSet<Table> GetTables()
        {
            return this.InvokeService(nameof(GetTables),
                () => this.Persistence.QueryForList<Table>(NS, "GetTables"), cacheable: false);
        }

        /// <summary>
        /// 获取所有自定义表的DDL语句。
        /// </summary>
        /// <returns>表的DDL语句</returns>
        public ResponseSet<string> GetTablesDefinition()
        {
            return this.InvokeService(nameof(GetTablesDefinition),
                () => this.Persistence.QueryForList<string>(NS, "GetTablesDefinition"), cacheable: false);
        }

        /// <summary>
        /// 获取表的数据添加脚本。
        /// </summary>
        /// <param name="fullName">表的完整名称</param>
        /// <returns>表的数据添加脚本</returns>
        public ResponseSet<string> GetAddDatasScript(string fullName)
        {
            return this.InvokeService(nameof(GetAddDatasScript),
                () => this.Persistence.QueryForList<string>(NS, "GetAddDatasScript", fullName), fullName, false);
        }

        /// <summary>
        /// 获取数据库中的所有用户自定义过程(包括函数)完整名称。
        /// </summary>
        /// <returns>用户自定义过程完整名称</returns>
        public ResponseSet<string> GetProcedures()
        {
            return this.InvokeService(nameof(GetProcedures),
                () => this.Persistence.QueryForList<string>(NS, "GetProcedures"), cacheable: false);
        }

        /// <summary>
        /// 获取数据库中过程(包括函数)的详细定义。
        /// </summary>
        /// <param name="fullName">过程完整名称</param>
        /// <returns>过程定义</returns>
        public ResponseSet<string> GetProcedureDefinition(string fullName)
        {
            return this.InvokeService(nameof(GetProcedureDefinition),
                () => this.Persistence.QueryForList<string>(NS, "GetProcedureDefinition", fullName), fullName, false);
        }

        #endregion
    }
}
