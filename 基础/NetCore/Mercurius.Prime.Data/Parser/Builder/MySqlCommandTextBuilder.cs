using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Mercurius.Prime.Core;
using Mercurius.Prime.Data.Parser.Resolver;

namespace Mercurius.Prime.Data.Parser.Builder
{
    /// <summary>
    /// 基于mysql的命令生成器.
    /// </summary>
    public class MySqlCommandTextBuilder : CommandTextBuilder
    {
        #region 字段

        /// <summary>
        /// 比较映射.
        /// </summary>
        private static readonly Dictionary<CompareType, string> CompareMappings = new Dictionary<CompareType, string>
        {
            { CompareType.Null, "{1}`{0}` IS NULL " },
            { CompareType.NotNull, "{1}`{0}` IS NOT NULL " },
            { CompareType.Equal, "{2}`{0}`=@{1} " },
            { CompareType.NotEqual, "{2}`{0}`<>@{1} " },
            { CompareType.Like, "{2}`{0}` LIKE CONCAT('%',@{1},'%') " },
            { CompareType.StartsWith, "{2}`{0}` LIKE CONCAT(@{1},'%') " },
            { CompareType.EndsWith, "{2}`{0}` LIKE CONCAT('%',@{1}) " },
            { CompareType.GreaterThan, "{2}`{0}`>@{1} " },
            { CompareType.GreaterEqual, "{2}`{0}`>=@{1} " },
            { CompareType.LessThan, "{2}`{0}`<@{1} " },
            { CompareType.LessEqual, "{2}`{0}`<=@{1} " },
            { CompareType.In, "{2}`{0}` IN @{1} " },
            { CompareType.NotIn, "{2}`{0}` NOT IN @{1} " },
            { CompareType.None, "{0} " }
        };

        private static readonly string TotalRecordsCommandText = "SELECT FOUND_ROWS()";

        #endregion

        #region 构造方法

        public MySqlCommandTextBuilder()
        {
            this.Resolver = new EntityResolver();
        }

        #endregion

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
                fields.AppendFormat("`{0}`", item.Name);
                values.AppendFormat("@{0}", item.PropertyName);

                if (item != columns.Last())
                {
                    fields.Append(",");
                    values.Append(",");
                }
            }

            return $"INSERT INTO `{tableName}`({fields}) VALUES({values})";
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
                update.AppendFormat("`{0}`=@{1}", item.Name, item.PropertyName);

                if (item != columns.Last())
                {
                    update.Append(",");
                }
            }

            return $"UPDATE `{tableName}` SET {update}";
        }

        /// <summary>
        /// 获取delete sql命令
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <returns>delete sql命令</returns>
        protected override string GetDeleteCommandText(string tableName)
        {
            return $"DELETE FROM `{tableName}`";
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
                selectors.AppendFormat("`{0}` AS {1}", item.Name, item.PropertyName);

                if (item != columns.Last())
                {
                    selectors.Append(",");
                }
            }

            return $"SELECT {selectors} FROM `{tableName}`";
        }

        /// <summary>
        /// 获取查询一条记录的sql命令
        /// </summary>
        /// <param name="commandText">select sql命令</param>
        /// <returns>查询一条记录的sql命令</returns>
        protected override string QueryForObjectWarpper(string commandText)
        {
            return $"{commandText} LIMIT 1";
        }

        /// <summary>
        /// 获取分页查询的sql命令
        /// </summary>
        /// <param name="commandText">select sql命令</param>
        /// <returns>
        /// 值1：返回当前页记录的sql命令
        /// 值2：返回符合条件的总记录数
        /// </returns>
        protected override Tuple<string, string> QueryForPagedWarpper(string commandText)
        {
            var sql1 = commandText.Replace("SELECT", "SELECT SQL_CALC_FOUND_ROWS");

            sql1 += " LIMIT @OffsetRows, @PageSize";

            return new Tuple<string, string>(sql1, TotalRecordsCommandText);
        }

        /// <summary>
        /// 获取更新、删除条件的sql片段
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
                    builder.AppendFormat("{2}`{0}`{1}",
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
                    builder.AppendFormat("{3}`{0}` {1}{2}",
                        item.Column,
                        item.OrderBy,
                        item != orderBys.Last() ? "," : string.Empty,
                        item.Prefix.IsNullOrEmpty() ? string.Empty : $"{item.Prefix}."
                    );
                }
            }

            return $"{commandText}{builder}";
        }

    }
}
