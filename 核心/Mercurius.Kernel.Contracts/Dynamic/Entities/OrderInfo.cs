﻿using Mercurius.Prime.Core.Dynamic;
using Mercurius.Prime.Core.Entities;

namespace Mercurius.Kernel.Contracts.Dynamic.Entities
{
    /// <summary>
    /// 排序信息。
    /// </summary>
    [Table("Dynamic.Order")]
    public class OrderInfo
    {
        #region 属性

        /// <summary>
        /// 排序编号。
        /// </summary>
        [Column(IsPrimaryKey = true, IsIdentity = true)]
        public int Id { get; set; }

        /// <summary>
        /// 表名称。
        /// </summary>
        public string TableName { get; set; }

        /// <summary>
        /// 字段名。
        /// </summary>
        public string Column { get; set; }

        /// <summary>
        /// 排序方式。
        /// </summary>
        public int OrderBy { get; set; }

        #endregion

        #region 隐式转换

        /// <summary>
        /// 将排序实体信息隐式转换为排序信息。
        /// </summary>
        /// <param name="info">排序信息</param>
        public static explicit operator Order(OrderInfo info)
        {
            if (info == null)
            {
                return null;
            }

            return new Order(info.Column, (OrderBy)info.OrderBy);
        }

        #endregion
    }
}
