using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Infrastructure.Dynamic
{
    /// <summary>
    /// 排序方式。
    /// </summary>
    public class Order
    {
        #region 属性

        /// <summary>
        /// 查询属性名称。
        /// </summary>
        public string PropertyName { get; set; }

        /// <summary>
        /// 排序方式。
        /// </summary>
        public OrderBy OrderBy { get; set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="propertyName">属性名称</param>
        /// <param name="orderBy">排序方式</param>
        public Order(string propertyName, OrderBy orderBy = OrderBy.Asc)
        {
            this.OrderBy = orderBy;
            this.PropertyName = propertyName;
        }

        #endregion
    }
}
