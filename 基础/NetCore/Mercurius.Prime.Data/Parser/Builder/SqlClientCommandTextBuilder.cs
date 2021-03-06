﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Log;
using Mercurius.Prime.Data.Parser.Resolver;

namespace Mercurius.Prime.Data.Parser.Builder
{
    /// <summary>
    /// 基于SQL Server的sql命令构建器
    /// </summary>
    public class SqlClientCommandTextBuilder : CommandTextBuilder
    {
        #region Fields

        /// <summary>
        /// 比较映射.
        /// </summary>
        private static readonly Dictionary<CompareType, string> CompareMappings = new Dictionary<CompareType, string>
        {
            { CompareType.Null, "{1}[{0}] IS NULL " },
            { CompareType.NotNull, "{1}[{0}] IS NOT NULL " },
            { CompareType.Equal, "{2}[{0}]=@{1} " },
            { CompareType.NotEqual, "{2}[{0}]<>@{1} " },
            { CompareType.Like, "{2}[{0}] LIKE '%'+@{1}+'%' " },
            { CompareType.StartsWith, "{2}[{0}] LIKE @{1}+'%' " },
            { CompareType.EndsWith, "{2}[{0}] LIKE '%'+@{1} " },
            { CompareType.GreaterThan, "{2}[{0}]>@{1} " },
            { CompareType.GreaterEqual, "{2}[{0}]>=@{1} " },
            { CompareType.LessThan, "{2}[{0}]<@{1} " },
            { CompareType.LessEqual, "{2}[{0}]<=@{1} " },
            { CompareType.In, "{2}[{0}] IN @{1} " },
            { CompareType.NotIn, "{2}[{0}] NOT IN @{1} " },
            { CompareType.None, "{0} " }
        };

        #endregion

        #region Constructor

        /// <summary>
        /// 默认构造方法
        /// </summary>
        public SqlClientCommandTextBuilder()
        {
            this.Resolver = new EntityResolver();
        }

        #endregion

        /// <summary>
        /// 获取分页查询命令
        /// </summary>
        /// <typeparam name="S"></typeparam>
        /// <typeparam name="T"></typeparam>
        /// <param name="command"></param>
        /// <param name="action"></param>
        /// <returns></returns>
        public override (string QueryCommandText, string TotalCommandText) GetQueryForPagedListCommandText<S, T>(CommandText command, Action<SelectCriteria<S>> action = null)
        {
            var segment = this.GetPagedDynamicCriterias(action);

            return this.QueryForPagedWarpper(command.Text + segment.Segment, segment.OrderBys);
        }

        /// <summary>
        /// 获取分页查询命令
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="selectors">返回列</param>
        /// <param name="action">查询条件设置回调</param>
        /// <returns>
        /// Item1: 查询当前页数据的sql命令
        /// Item2: 查询符合条件的总记录数
        /// </returns>
        public override (string QueryCommandText, string TotalCommandText) GetQueryForPagedListCommandText<S, T>(Action<SelectCriteria<S>> action = null, params string[] selectors)
        {
            var columns = this.Resolver.Resolve<T>();
            var commandText = this.CommandTextCacheHandler(columns.TableName, nameof(GetQueryCommandText), () =>
            {
                var filters = selectors.IsEmpty() ?
                     columns :
                     (from c in columns
                      where
                        selectors.Contains(c.PropertyName, StringComparer.OrdinalIgnoreCase) || selectors.Contains(c.Name, StringComparer.OrdinalIgnoreCase)
                      select c);

                return this.GetQueryCommandText(columns.TableName, columns);
            });

            var segment = this.GetPagedDynamicCriterias(action);

            // 追加查询条件
            commandText += segment.Segment;

            var orders = segment.OrderBys;

            if (orders.IsEmpty())
            {
                orders = new List<OrderColumn>();

                var finded = columns.Where(c => c.IsIdentity);

                if (finded.IsEmpty())
                {
                    orders.Add(new OrderColumn
                    {
                        Column = columns.First().Name,
                        OrderBy = "ASC"
                    });
                }
                else
                {
                    foreach (var item in finded)
                    {
                        orders.Add(new OrderColumn
                        {
                            Column = item.Name,
                            OrderBy = "ASC"
                        });
                    }
                }
            }

            var tuple = this.QueryForPagedWarpper(commandText, orders);

            // 记录日志
            if (this.Logger?.IsEnabledFor(Level.Debug) == true)
            {
                this.Logger.WriteFormat(Level.Debug, "表【{0}】的分页查询sql：数据 - {1}，总记录 - {2}", columns.TableName, tuple.QueryCommandText, tuple.TotalCommandText);
            }

            return tuple;
        }

        /// <summary>
        /// 获取create sql命令
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="columns">列信息</param>
        /// <returns>sql命令</returns>
        protected override string GetCreateCommandText(string tableName, IEnumerable<Column> columns)
        {
            var fields = new StringBuilder();
            var values = new StringBuilder();

            foreach (var item in columns)
            {
                fields.AppendFormat("[{0}]", item.Name);
                values.AppendFormat("@{0}", item.PropertyName);

                if (item != columns.Last())
                {
                    fields.Append(",");
                    values.Append(",");
                }
            }

            return $"INSERT INTO [{tableName}]({fields}) VALUES({values})";
        }

        /// <summary>
        /// 获取update sql命令
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="columns">需要更新列的集合</param>
        /// <returns>update sql命令</returns>
        protected override string GetUpdateCommandText(string tableName, IEnumerable<Column> columns)
        {
            var update = new StringBuilder();

            foreach (var item in columns)
            {
                update.AppendFormat("[{0}]=@{1}", item.Name, item.PropertyName);

                if (item != columns.Last())
                {
                    update.Append(",");
                }
            }

            return $"UPDATE [{tableName}] SET {update}";
        }

        /// <summary>
        /// 获取delete sql命令
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <returns>delete sql命令</returns>
        protected override string GetDeleteCommandText(string tableName)
        {
            return $"DELETE FROM [{tableName}]";
        }

        /// <summary>
        /// 获取select sql命令
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="columns">返回列集合</param>
        /// <returns>select sql命令</returns>
        protected override string GetQueryCommandText(string tableName, IEnumerable<Column> columns)
        {
            var selectors = new StringBuilder();

            foreach (var item in columns)
            {
                selectors.AppendFormat("[{0}] AS {1}", item.Name, item.PropertyName);

                if (item != columns.Last())
                {
                    selectors.Append(",");
                }
            }

            return $"SELECT {selectors} FROM [{tableName}]";
        }

        /// <summary>
        /// 获取查询一条记录的sql命令
        /// </summary>
        /// <param name="commandText">select sql命令</param>
        /// <returns>查询一条记录的sql命令</returns>
        protected override string QueryForObjectWarpper(string commandText)
        {
            return commandText.Replace("SELECT", "SELECT TOP 1");
        }

        /// <summary>
        /// 获取过滤条件的sql片段
        /// </summary>
        /// <param name="segments">sql片段对象集合</param>
        /// <returns>sql片段</returns>
        internal override string GetCriteriaSegment(IEnumerable<Segment> segments)
        {
            if (segments?.IsEmpty() == false)
            {
                var where = new StringBuilder();

                foreach (var item in segments)
                {
                    if (item.EffectiveFunc() && item.Complexes.IsEmpty())
                    {
                        where.Append(item.Concat == ConcatType.And ? "AND " : "OR ");

                        if (item.Compare == CompareType.Null || item.Compare == CompareType.NotNull)
                        {
                            where.AppendFormat(CompareMappings[item.Compare],
                                item.Compare == CompareType.None ? item.SqlExpression : item.Column,
                                item.Prefix.IsNullOrEmpty() ? string.Empty : $"{item.Prefix}.");
                        }
                        else
                        {
                            where.AppendFormat(CompareMappings[item.Compare],
                                item.Compare == CompareType.None ? item.SqlExpression : item.Column,
                                item.Parameter,
                                item.Prefix.IsNullOrEmpty() ? string.Empty : $"{item.Prefix}.");
                        }
                    }
                    else
                    {
                        var groups = this.GetCriteriaSegment(item.Complexes).Trim();

                        if (groups.IsNotBlank())
                        {
                            groups = groups.StartsWith("AND", StringComparison.OrdinalIgnoreCase) ? groups.Substring(4) : groups.Substring(3);

                            where.Append($"{(item.Concat == ConcatType.And ? "AND" : "OR")} ({groups}) ");
                        }
                    }
                }

                return where.ToString();
            }

            return string.Empty;
        }

        /// <summary>
        /// 获取查询条件的sql片段
        /// </summary>
        /// <param name="segments">sql片段对象集合</param>
        /// <param name="groupBys">分组集合</param>
        /// <param name="orderBys">排序集合</param>
        /// <returns>sql片段</returns>
        internal override string GetSelectCriteriaSegment(IEnumerable<Segment> segments, IEnumerable<GroupColumn> groupBys, IEnumerable<OrderColumn> orderBys)
        {
            var builder = new StringBuilder();
            var commandText = this.GetCriteriaSegment(segments);

            // 追加分组
            if (!groupBys.IsEmpty())
            {
                builder.Append("GROUP BY ");

                foreach (var item in groupBys)
                {
                    builder.AppendFormat("{2}[{0}]{1}",
                        item.Column,
                        item != groupBys.Last() ? "," : string.Empty,
                        item.Prefix.IsNullOrEmpty() ? string.Empty : $"{item.Prefix}."
                    );
                }
            }

            // 追加排序
            if (!orderBys.IsEmpty())
            {
                builder.Append("ORDER BY ");

                foreach (var item in orderBys)
                {
                    builder.AppendFormat("{3}[{0}] {1}{2}",
                        item.Column,
                        item.OrderBy,
                        item != orderBys.Last() ? "," : string.Empty,
                        item.Prefix.IsNullOrEmpty() ? string.Empty : $"{item.Prefix}."
                    );
                }
            }

            return $"{commandText}{builder}";
        }

        /// <summary>
        /// 获取分页查询的sql命令
        /// </summary>
        /// <param name="commandText">select sql命令</param>
        /// <returns>
        /// 值1：返回当前页记录的sql命令
        /// 值2：返回符合条件的总记录数
        /// </returns>
        internal override (string QueryCommandText, string TotalCommandText) QueryForPagedWarpper(string commandText, IEnumerable<OrderColumn> orderBys)
        {
            var orderSegment = new StringBuilder();

            if (orderBys.IsEmpty())
            {
                var firstColumn = commandText.Substring(0, commandText.IndexOf(",")).Substring(6).Trim();
                var asIndex = firstColumn.IndexOf(" as ", StringComparison.OrdinalIgnoreCase);

                if (asIndex != -1)
                {
                    firstColumn = firstColumn.Substring(0, asIndex);
                }

                orderSegment.Append(firstColumn);
                orderSegment.Append(" ASC");
            }
            else
            {
                foreach (var item in orderBys)
                {
                    orderSegment.AppendFormat("{3}[{0}] {1}{2}",
                            item.Column,
                            item.OrderBy,
                            item != orderBys.Last() ? "," : string.Empty,
                            item.Prefix.IsNullOrEmpty() ? string.Empty : $"{item.Prefix}."
                    );
                }
            }

            var beginIndex = commandText.IndexOf("select", StringComparison.OrdinalIgnoreCase);
            var sql1 = $"WITH CTE AS(SELECT ROW_NUMBER() OVER(ORDER BY {orderSegment}) AS RowIndex, {commandText.Substring(beginIndex + 6)}";

            sql1 += " ) SELECT * FROM CTE WHERE RowIndex BETWEEN (@PageIndex-1)*@PageSize+1 AND @PageIndex*@PageSize ORDER BY RowIndex ASC";

            var totalRecordsCommandText = $"SELECT COUNT(*) {commandText.Substring(commandText.IndexOf("FROM", StringComparison.OrdinalIgnoreCase))}";

            return (sql1, totalRecordsCommandText);
        }

        #region Private Methods

        private (string Segment, IList<OrderColumn> OrderBys) GetPagedDynamicCriterias<S>(Action<SelectCriteria<S>> action)
        {
            var criterias = string.Empty;
            IList<OrderColumn> orders = null;

            // 查询回调处理
            if (action != null)
            {
                var dynamicQuery = new SelectCriteria<S>();

                // 回调处理
                action.Invoke(dynamicQuery);

                orders = dynamicQuery.OrderBys;

                var segments = this.GetSelectCriteriaSegment(dynamicQuery.Segments, dynamicQuery.GroupBys, null);

                criterias = segments.IsNullOrEmpty() ? string.Empty : $" {(dynamicQuery.NeedWhere ? "WHERE" : string.Empty)}{dynamicQuery.TrimedSqlSegment(segments)} ";
            }

            return (criterias, orders);
        }

        #endregion
    }
}
