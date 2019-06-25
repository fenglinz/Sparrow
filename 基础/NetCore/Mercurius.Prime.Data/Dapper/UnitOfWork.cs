using System;
using System.Collections.Generic;
using System.Text;
using Dapper;

namespace Mercurius.Prime.Data.Dapper
{
    /// <summary>
    /// 工作单元
    /// </summary>
    internal class UnitOfWork
    {
        #region Properties

        public IEnumerable<ExecuteObject> ExcuteObjects { get; set; }

        #endregion
    }


}
