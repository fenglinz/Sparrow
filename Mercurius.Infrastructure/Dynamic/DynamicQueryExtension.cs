using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Infrastructure.Dynamic
{
    public static class DynamicQueryExtension
    {
        public static Columns AsColumns(this IEnumerable<Column> columns)
        {
            var result = new Columns();

            return result.Add(columns);
        }

        public static Criteria OrderBy(this DynamicQuery query, string proertyName, OrderBy orderBy = Dynamic.OrderBy.Asc)
        {
            var result = new Criteria(query);

            return result.OrderBy(proertyName, orderBy);
        }

        public static Criteria OrderBy(this DynamicQuery query, params Order[] orders)
        {
            var result = new Criteria(query);

            return result.OrderBy(orders);
        }
    }
}
