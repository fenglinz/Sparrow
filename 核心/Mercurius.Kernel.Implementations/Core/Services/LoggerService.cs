using System;
using System.Linq;
using Mercurius.Kernel.Contracts.Core.Entities;
using Mercurius.Kernel.Contracts.Core.SearchObjects;
using Mercurius.Kernel.Contracts.Core.Services;
using Mercurius.Prime.Core.Ado;
using Mercurius.Prime.Core.Logger;
using Mercurius.Prime.Core.Services;
using Mercurius.Prime.Data.Support;

namespace Mercurius.Kernel.Implementations.Core.Services
{
    /// <summary>
    /// 日志服务接口实现。
    /// </summary>
    [Module("日志管理")]
    public class LoggerService : ServiceSupport, ILoggerService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Kernel.Repositories.Core.Logger";
        private static readonly StatementNamespace UtilsNS = "Mercurius.Kernel.Repositories.Core.RepositoryUtils";

        #endregion

        #region ILoggerService接口实现

        /// <summary>
        /// 清空日志信息。
        /// </summary>
        /// <returns>操作结果</returns>
        public Response ClearLogs()
        {
            return this.Delete<Log>(NS, "ClearLogs", null);
        }

        /// <summary>
        /// 获取日志详细信息。
        /// </summary>
        /// <param name="partition">表分区名称</param>
        /// <param name="id">日志编号</param>
        /// <returns>日志信息</returns>
        public Response<Log> GetLog(string partition, string id)
        {
            var args = new { Partition = partition, Id = id };

            return this.QueryForObject<Log>(NS, "GetLog", args);
        }

        /// <summary>
        /// 获取日志信息。
        /// </summary>
        /// <param name="so">日志查询条件</param>
        /// <returns>日志信息列表</returns>
        public ResponseSet<Log> SearchLogs(LogSO so)
        {
            return this.QueryForPagedList<Log>(NS, "SearchLogs", so);
        }

        #endregion
    }
}
