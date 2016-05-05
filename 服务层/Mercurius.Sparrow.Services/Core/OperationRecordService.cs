using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Contracts.Core;
using Mercurius.Sparrow.Entities.Core;
using Mercurius.Sparrow.Entities.Core.SO;
using Mercurius.Sparrow.Services.Support;
using static Mercurius.Sparrow.Repositories.StatementNamespaces.Core;

namespace Mercurius.Sparrow.Services.Core
{
    /// <summary>
    /// 操作记录服务接口实现。
    /// </summary>
    public class OperationRecordService : ServiceSupport, IOperationRecordService
    {
        #region IOperationRecordService接口实现

        /// <summary>
        /// 查询操作记录。
        /// </summary>
        /// <param name="so">查询对象</param>
        /// <returns>操作记录结果</returns>
        public ResponseSet<OperationRecord> SearchOperationRecords(OperationRecordSO so)
        {
            return this.InvokePagingService(nameof(SearchOperationRecords),
                (out int totalRecords) => this.Persistence.QueryForPaginatedList<OperationRecord>(OperationRecordNamespace, "SearchOperationRecords", out totalRecords, so), so);
        }

        #endregion
    }
}
