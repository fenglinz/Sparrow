using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Prime.Core.Ado
{
    /// <summary>
    /// 附加命令。
    /// </summary>
    public class AttachCommand
    {
        #region 属性

        /// <summary>
        /// 数据库提供者名称。
        /// </summary>
        internal string ProviderName { get; set; }

        /// <summary>
        /// 执行该命令的数据库连接对象。
        /// </summary>
        internal DbConnection Connection { get; set; }

        /// <summary>
        /// 命令名称。
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// SQL命令类型。
        /// </summary>
        public CommandType Type { get; set; }

        /// <summary>
        /// SQL命令。
        /// </summary>
        public string Text { get; set; }

        /// <summary>
        /// 查询方式(默认第一行第一列)。
        /// </summary>
        public QueryMode Mode { get; set; } = QueryMode.Scalar;

        #endregion

        #region 重载

        /// <summary>
        /// 将AttachCommand对象隐式转换为为XCommand对象。
        /// </summary>
        /// <param name="attach">附加命令对象</param>
        public static implicit operator XCommand(AttachCommand attach)
        {
            if (attach == null)
            {
                return null;
            }

            return new XCommand
            {
                Name = attach.Name,
                Type = attach.Type,
                Text = attach.Text
            };
        }

        #endregion
    }
}
