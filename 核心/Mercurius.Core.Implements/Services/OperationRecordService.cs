using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Core.Interfaces.Entities;
using Mercurius.Core.Interfaces.Entities.SO;
using Mercurius.Core.Interfaces.Services;
using Mercurius.EntityBase;
using Mercurius.ServiceBase;
using Mercurius.RepositoryBase;

namespace Mercurius.Core.Implements.Services
{
    /// <summary>
    /// 操作记录服务接口实现。
    /// </summary>
    public class OperationRecordService : ServiceSupport, IOperationRecordService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Repositories.Core.OperationRecord";

        #endregion

        #region IOperationRecordService接口实现

        /// <summary>
        /// 查询操作记录。
        /// </summary>
        /// <param name="so">查询对象</param>
        /// <returns>操作记录结果</returns>
        public ResponseSet<OperationRecord> SearchOperationRecords(OperationRecordSO so)
        {
            return this.InvokePagingService(nameof(SearchOperationRecords),
                (out int totalRecords) => this.Persistence.QueryForPaginatedList<OperationRecord>(NS, "SearchOperationRecords", out totalRecords, so), so);
        }

        #endregion
    }
}
