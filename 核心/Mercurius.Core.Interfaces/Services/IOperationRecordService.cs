using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mercurius.EntityBase;
using Mercurius.Core.Interfaces.Entities;
using Mercurius.Core.Interfaces.Entities.SO;

namespace Mercurius.Core.Interfaces.Services
{
    /// <summary>
    /// 操作记录服务接口。
    /// </summary>
    public interface IOperationRecordService
    {
        /// <summary>
        /// 查询操作记录。
        /// </summary>
        /// <param name="so">查询对象</param>
        /// <returns>操作记录结果</returns>
        ResponseSet<OperationRecord> SearchOperationRecords(OperationRecordSO so);
    }
}
