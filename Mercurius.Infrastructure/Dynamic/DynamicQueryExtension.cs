using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Infrastructure.Dynamic
{
    /// <summary>
    /// 动态查询扩展。
    /// </summary>
    public static class DynamicQueryExtension
    {
        #region 公开方法

        /// <summary>
        /// 将数据库字段元数据集合转换为字段元数据集合类型。
        /// </summary>
        /// <param name="columns">字段元数据集合</param>
        /// <returns>字段元数据集合类型</returns>
        public static Columns AsColumns(this IEnumerable<Column> columns)
        {
            var result = new Columns();

            return result.Add(columns);
        }

        /// <summary>
        /// 排序扩展。
        /// </summary>
        /// <param name="query">动态查询对象</param>
        /// <param name="proertyName">排序属性名</param>
        /// <param name="orderBy">排序方式</param>
        /// <returns>查询条件集合</returns>
        public static Criteria OrderBy(this DynamicQuery query, string proertyName, OrderBy orderBy = Dynamic.OrderBy.Asc)
        {
            var result = new Criteria(query);

            return result.OrderBy(proertyName, orderBy);
        }

        /// <summary>
        /// 排序扩展。
        /// </summary>
        /// <param name="query">动态查询对象</param>
        /// <param name="orders">排序集合</param>
        /// <returns>查询条件集合</returns>
        public static Criteria OrderBy(this DynamicQuery query, params Order[] orders)
        {
            var result = new Criteria(query);

            return result.OrderBy(orders);
        }

        #endregion
    }
}
