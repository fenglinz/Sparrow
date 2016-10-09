using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Sparrow.Contracts.Core
{
    /// <summary>
    /// 工具服务接口。
    /// </summary>
    public interface IUtilityService
    {
        /// <summary>
        /// 获取所有自定义表的DDL语句。
        /// </summary>
        /// <returns>表的DDL语句</returns>
        ResponseSet<string> GetTablesDefinition();

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
