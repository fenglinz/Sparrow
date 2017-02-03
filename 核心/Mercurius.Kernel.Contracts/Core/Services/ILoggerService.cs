using Mercurius.Kernel.Contracts.Core.Entities;
using Mercurius.Kernel.Contracts.Core.SearchObjects;
using Mercurius.Prime.Core.Services;

namespace Mercurius.Kernel.Contracts.Core.Services
{
    /// <summary>
    /// 日志服务接口。
    /// </summary>
    public interface ILoggerService
    {
        /// <summary>
        /// 获取日志表信息的分区信息。
        /// </summary>
        /// <returns>分区信息列表</returns>
        ResponseSet<Partition> GetPartitions();

        /// <summary>
        /// 清空日志信息。
        /// </summary>
        /// <returns>操作结果</returns>
        Response ClearLogs();

        /// <summary>
        /// 获取日志详细信息。
        /// </summary>
        /// <param name="partition">表分区名称</param>
        /// <param name="id">日志编号</param>
        /// <returns>日志信息</returns>
        Response<Log> GetLog(string partition, string id);

        /// <summary>
        /// 获取日志信息。
        /// </summary>
        /// <param name="so">日志查询条件</param>
        /// <returns>日志信息列表</returns>
        ResponseSet<Log> SearchLogs(LogSO so);
    }
}
