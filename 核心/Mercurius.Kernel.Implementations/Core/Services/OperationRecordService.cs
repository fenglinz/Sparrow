using Mercurius.Kernel.Contracts.Core.Entities;
using Mercurius.Kernel.Contracts.Core.SearchObjects;
using Mercurius.Kernel.Contracts.Core.Services;
using Mercurius.Prime.Core.Services;
using Mercurius.Prime.Data.Support;

namespace Mercurius.Kernel.Implementations.Core.Services
{
    /// <summary>
    /// 操作记录服务接口实现。
    /// </summary>
    public class OperationRecordService : ServiceSupport, IOperationRecordService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Kernel.Repositories.Core.OperationRecord";

        #endregion

        #region IOperationRecordService接口实现

        /// <summary>
        /// 查询操作记录。
        /// </summary>
        /// <param name="so">查询对象</param>
        /// <returns>操作记录结果</returns>
        public ResponseSet<OperationRecord> SearchOperationRecords(OperationRecordSO so)
        {
            return this.QueryForPagedList<OperationRecord>(NS, "SearchOperationRecords", so);
        }

        #endregion
    }
}
