using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Sparrow.Entities.Core
{
    /// <summary>
    /// 操作记录实体信息。
    /// </summary>
    [Table("OperationRecord")]
    public class OperationRecord
    {
        #region 属性

        /// <summary>
        /// 获取或者设置操作记录编号。
        /// </summary>
        [Column("Id", IsPrimaryKey = true, IsIdentity = true)]
        public int Id { get; set; }

        /// <summary>
        /// 获取或者设置业务编号。
        /// </summary>
        public string BusinessId { get; set; }

        /// <summary>
        /// 获取或者设置业务类型。
        /// </summary>
        public string BusinessType { get; set; }

        /// <summary>
        /// 获取或者设置用户编号。
        /// </summary>
        public string UserId { get; set; }

        /// <summary>
        /// 获取或者设置记录时间。
        /// </summary>
        public DateTime RecordDateTime { get; set; }

        /// <summary>
        /// 获取或者设置记录内容。
        /// </summary>
        public string RecordContent { get; set; }

        #endregion
    }
}
