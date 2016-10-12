using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Sparrow.Contracts.Core
{
    /// <summary>
    /// 工具服务接口。
    /// </summary>
    public interface IUtilityService
    {
        /// <summary>
        /// 获取所有用户自定义架构。
        /// </summary>
        /// <returns>架构名称</returns>
        ResponseSet<string> GetSchemas();

        /// <summary>
        /// 获取所有表的信息。
        /// </summary>
        /// <returns>表信息集合</returns>
        ResponseSet<Table> GetTables();

        /// <summary>
        /// 获取所有自定义表的DDL语句。
        /// </summary>
        /// <returns>表的DDL语句</returns>
        ResponseSet<string> GetTablesDefinition();

        /// <summary>
        /// 获取表的数据添加脚本。
        /// </summary>
        /// <param name="fullName">表的完整名称</param>
        /// <returns>表的数据添加脚本</returns>
        ResponseSet<string> GetAddDatasScript(string fullName);

        /// <summary>
        /// 获取数据库中的所有用户自定义过程(包括函数)完整名称。
        /// </summary>
        /// <returns>用户自定义过程完整名称</returns>
        ResponseSet<string> GetProcedures();

        /// <summary>
        /// 获取数据库中过程(包括函数)的详细定义。
        /// </summary>
        /// <param name="fullName">过程完整名称</param>
        /// <returns>过程定义</returns>
        ResponseSet<string> GetProcedureDefinition(string fullName);
    }
}
