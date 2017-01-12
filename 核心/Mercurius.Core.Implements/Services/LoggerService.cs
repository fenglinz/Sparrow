using System;
using System.Linq;
using Mercurius.Core.Interfaces.Entities;
using Mercurius.Core.Interfaces.SearchObjects;
using Mercurius.Core.Interfaces.Services;
using Mercurius.Prime.Core.Ado;
using Mercurius.Prime.Core.Logger;
using Mercurius.Prime.Core.Services;
using Mercurius.Prime.Data.IBatisNet;
using Mercurius.Prime.Data.Support;

namespace Mercurius.Core.Implements.Services
{
    /// <summary>
    /// 日志服务接口实现。
    /// </summary>
    [Module("日志管理")]
    public class LoggerService : ServiceSupport, ILoggerService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Sparrow.Repositories.Core.Logger";
        private static readonly StatementNamespace RepositoryUtilsNS = "Mercurius.Repositories.Core.RepositoryUtils";

        #endregion

        #region ILoggerService接口实现

        /// <summary>
        /// 获取日志表信息的分区信息。
        /// </summary>
        /// <returns>分区信息列表</returns>
        public ResponseSet<Partition> GetPartitions()
        {
            return this.InvokeService(
                nameof(GetPartitions),
                () =>
                {
                    var partitions = this.Persistence.QueryForDataTable(RepositoryUtilsNS, "GetPartitions", "SystemLog").GetDatas<Partition>();

                    partitions = (from p in partitions
                                  let d = p.HightValue.Length > 20 ? DateTime.Parse(p.HightValue.Substring(10, 10)).AddDays(-1) : DateTime.Now
                                  where
                                      p.HightValue.Length > 10
                                  orderby d ascending
                                  select new Partition { Name = p.Name, HightValue = d.ToString("yyyy-MM-dd") }).ToList();

                    return partitions;
                },
                false);
        }

        /// <summary>
        /// 清空日志信息。
        /// </summary>
        /// <returns>操作结果</returns>
        public Response ClearLogs()
        {
            return this.InvokeService(
                nameof(ClearLogs),
                () =>
                {
                    this.Persistence.Delete(NS, "ClearLogs");

                    this.ClearCache<Log>();
                });
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

            return this.InvokeService(nameof(GetLog), () => this.Persistence.QueryForObject<Log>(NS, "GetLog", args), args);
        }

        /// <summary>
        /// 获取日志信息。
        /// </summary>
        /// <param name="so">日志查询条件</param>
        /// <returns>日志信息列表</returns>
        public ResponseSet<Log> SearchLogs(LogSO so)
        {
            var totalRecords = 0;
            var result = this.InvokeService(nameof(SearchLogs), () => this.Persistence.QueryForPaginatedList<Log>(NS, "SearchLogs", out totalRecords, so), so, false);

            result.TotalRecords = totalRecords;

            return result;
        }

        #endregion
    }
}
