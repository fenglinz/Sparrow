using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Prime.Core.Services;

namespace Mercurius.Core.Interfaces.SearchObjects
{
    /// <summary>
    /// 操作记录查询信息。
    /// </summary>
    public class OperationRecordSO : SearchObject
    {
        #region 属性

        /// <summary>
        /// 业务类型。
        /// </summary>
        public string BusinessCategory { get; set; }

        /// <summary>
        /// 业务编号。
        /// </summary>
        public string BusinessSerialNumber { get; set; }

        #endregion
    }
}
