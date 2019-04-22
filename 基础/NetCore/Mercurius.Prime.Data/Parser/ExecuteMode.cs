using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Prime.Data.Parser
{
    /// <summary>
    /// 附加命令查询方式。
    /// </summary>
    public enum ExecuteMode
    {
        /// <summary>
        /// 更新或删除命令。
        /// </summary>
        Execute = 0,

        /// <summary>
        /// 获取第一行第一列的命令。
        /// </summary>
        Scalar,

        /// <summary>
        /// 单条记录。
        /// </summary>
        Single,

        /// <summary>
        /// 多条记录。
        /// </summary>
        List
    }
}
