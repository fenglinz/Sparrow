using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Siskin.Repositories
{
    /// <summary>
    /// Satement命令命名空间信息。
    /// </summary>
    public class StatementNamespace
    {
        #region 字段

        /// <summary>
        /// Satement命名空间。
        /// </summary>
        private string _namesapce;

        #endregion

        #region 公开方法

        /// <summary>
        /// 获取Satement命令id。
        /// </summary>
        /// <param name="innerId">SqlMap配置文件内部id</param>
        /// <returns>Satement完整命令id</returns>
        public string GetStatementId(string innerId)
        {
            return $"{this._namesapce}.{innerId}";
        }

        #endregion

        #region 显示转换

        /// <summary>
        /// 将string类型显示转换为StatementNamespace对象。
        /// </summary>
        /// <param name="value">Statement命名空间字符串</param>
        /// <returns>StatementNamespace对象</returns>
        public static implicit operator StatementNamespace(string value)
        {
            return new StatementNamespace { _namesapce = value };
        }

        #endregion
    }
}
