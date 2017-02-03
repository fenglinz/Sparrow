using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Prime.Core.Entities;

namespace Mercurius.Kernel.Contracts.Core.Entities
{
    /// <summary>
    /// 操作记录实体信息。
    /// </summary>
    [Table("OperationRecord")]
    public class OperationRecord : Entity
    {
        #region 属性

        /// <summary>
        /// 操作记录编号。
        /// </summary>
        [Column("Id", IsPrimaryKey = true, IsIdentity = true)]
        public int Id { get; set; }

        /// <summary>
        /// 业务分类。
        /// </summary>
        public string BusinessCategory { get; set; }

        /// <summary>
        /// 业务流水号。
        /// </summary>
        public string BusinessSerialNumber { get; set; }

        /// <summary>
        /// 记录内容。
        /// </summary>
        public string Content { get; set; }

        /// <summary>
        /// 登录IP地址。
        /// </summary>
        public string LogOnIPAddress { get; set; }

        /// <summary>
        /// 添加记录的用户编号。
        /// </summary>
        public string AddedUserId { get; set; }

        /// <summary>
        /// 添加记录的时间。
        /// </summary>
        public DateTime AddedDateTime { get; set; }

        #endregion
    }
}
