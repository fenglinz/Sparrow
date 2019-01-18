using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using Mercurius.Prime.Core.Ado;

namespace Mercurius.Prime.Core.Dapper
{
    /// <summary>
    /// 查询对象。
    /// </summary>
    public class QueryObject<T>
    {
        #region 属性

        /// <summary>
        /// 
        /// </summary>
        private string SqlText { get; set; }

        /// <summary>
        /// 查询对象
        /// </summary>
        private T SearchObject { get; set; }

        /// <summary>
        /// where条件。
        /// </summary>
        private WhereSegment Where { get; set; }

        /// <summary>
        /// 执行片段
        /// </summary>
        private IList<SqlSegment<T>> Segments { get; set; } = new List<SqlSegment<T>>();

        /// <summary>
        /// 排序
        /// </summary>
        private IList<string> OrderBys { get; set; } = new List<string>();

        /// <summary>
        /// 获取有效的SQL执行命令.
        /// </summary>
        /// <returns>sql命令</returns>
        internal string CommandText
        {
            get
            {
                var builder = new StringBuilder(this.SqlText);
                var segmentBuilder = new StringBuilder();

                for (var index = 0; index < this.Segments.Count; index++)
                {
                    var item = this.Segments[index];

                    if (item.Predicate.Invoke(this.SearchObject))
                    {
                        segmentBuilder.Append(item.Text);
                    }
                }

                if (segmentBuilder.Length > 0)
                {
                    var sqlSegment = segmentBuilder.ToString().Trim();

                    if (this.Where != null)
                    {
                        builder.Append(" WHERE ");

                        if (!this.Where.Trimeds.IsEmpty())
                        {
                            foreach (var item in this.Where.Trimeds)
                            {
                                if (sqlSegment.StartsWith(item, StringComparison.OrdinalIgnoreCase))
                                {
                                    sqlSegment = sqlSegment.Substring(item.Length - 1);
                                }
                            }
                        }
                    }

                    builder.AppendFormat(" {0} ", sqlSegment);
                }

                // 追加排序
                if (!this.OrderBys.IsEmpty())
                {
                    builder.Append(" ORDER BY ");

                    for (var index = 0; index < this.OrderBys.Count; index++)
                    {
                        var item = this.OrderBys[index];

                        builder.AppendFormat("{0}{1}", item, index < this.OrderBys.Count - 1 ? "," : "");
                    }
                }

                Debug.WriteLine(builder);

                return builder.ToString();
            }
        }

        #endregion

        #region 构造方法

        private QueryObject()
        {

        }

        #endregion

        public static implicit operator QueryObject<T>(XCommand command)
        {
            return new QueryObject<T>
            {
                SqlText = command.Text
            };
        }
    }
}
