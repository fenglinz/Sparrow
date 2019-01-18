using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Reflection;
using Dapper;
using Mercurius.Prime.Core.Ado;
using Mercurius.Prime.Core.Entities;

namespace Mercurius.Prime.Core.Services
{
    /// <summary>
    /// XCommand扩展方法。
    /// </summary>
    public static class XCommandExtension
    {
        #region 添加Where

        /// <summary>
        /// 添加where片段
        /// </summary>
        /// <param name="command">XCommand对象</param>
        /// <param name="trimeds">trim列表(默认：and,or)</param>
        /// <returns>XCommand对象</returns>
        public static XCommand Where(this XCommand command, params string[] trimeds)
        {
            if (command.Where != null)
            {
                throw new Exception("Where设置必须在是第一个sql片段！");
            }

            command.Where = new WhereSegment
            {
                Trimeds = trimeds.IsEmpty() ? WhereSegment.DefaultTrimed : trimeds
            };

            return command;
        }

        #endregion

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <typeparam name="P"></typeparam>
        /// <param name="command"></param>
        /// <param name="so"></param>
        /// <param name="sqlSegment"></param>
        /// <param name="expression"></param>
        /// <param name="prefix"></param>
        /// <returns></returns>
        public static XCommand Segment<T, P>(
            this XCommand command, T so,
            Expression<Func<T, P>> sqlSegment,
            Expression<Func<bool>> expression = null, string prefix = "")
        {
            var body = sqlSegment.Body as MemberExpression;

            if (body != null)
            {
                var attr = body.Member.GetCustomAttribute<ColumnAttribute>();
                var columnName = attr == null ? body.Member.Name : attr.Name;

                command.Segments.Add(new SqlSegment
                {
                    Text = $"AND {(string.IsNullOrWhiteSpace(prefix) ? "" : prefix + ".")}{columnName}",
                    EffectiveExpression = expression == null ? () => true : expression
                });
            }

            return command;
        }

        /// <summary>
        /// 添加and连接的sql片段
        /// </summary>
        /// <param name="command">XCommand命令对象</param>
        /// <param name="segment">sql片段</param>
        /// <param name="expression">片段有效判断lambda表达式</param>
        /// <returns>XCommand命令对象</returns>
        public static XCommand Segment(this XCommand command, string segment, Expression<Func<bool>> expression = null)
        {
            command.Segments.Add(new SqlSegment
            {
                Text = segment.Trim().StartsWith("AND", StringComparison.OrdinalIgnoreCase) ? segment : $" AND {segment}",
                EffectiveExpression = expression == null ? () => true : expression
            });

            return command;
        }

        /// <summary>
        /// 添加or连接的sql片段
        /// </summary>
        /// <param name="command">XCommand命令对象</param>
        /// <param name="segment">sql片段</param>
        /// <param name="expression">片段有效判断lambda表达式</param>
        /// <returns>XCommand命令对象</returns>
        public static XCommand SegmentOr(this XCommand command, string segment, Expression<Func<bool>> expression = null)
        {
            command.Segments.Add(new SqlSegment
            {
                Text = segment.Trim().StartsWith("OR", StringComparison.OrdinalIgnoreCase) ? segment : $" OR {segment}",
                EffectiveExpression = expression == null ? () => true : expression
            });

            return command;
        }

        /// <summary>
        /// 添加升序排序。
        /// </summary>
        /// <param name="command">XCommand命令对象</param>
        /// <param name="columnName">字段名</param>
        /// <returns>XCommand命令对象</returns>
        public static XCommand OrderBy(this XCommand command, string columnName)
        {
            command.OrderBys.Add($"{columnName} ASC");

            return command;
        }

        /// <summary>
        /// 添加降序排序。
        /// </summary>
        /// <param name="command">XCommand命令对象</param>
        /// <param name="columnName">字段名</param>
        /// <returns>XCommand命令对象</returns>
        public static XCommand OrderByDescending(this XCommand command, string columnName)
        {
            command.OrderBys.Add($"{columnName} DESC");

            return command;
        }

        /// <summary>
        /// 添加分组方式
        /// </summary>
        /// <param name="command">分组方式</param>
        /// <param name="columnNames">分组字段集合</param>
        /// <returns>XCommand命令对象</returns>
        public static XCommand GroupBy(this XCommand command, params string[] columnNames)
        {
            if (columnNames.IsEmpty())
            {
                throw new ArgumentException("必须输入分组字段！");
            }

            foreach (var item in columnNames)
            {
                command.GroupBys.Add(item);
            }

            return command;
        }

        /// <summary>
        /// 执行查询。
        /// </summary>
        /// <param name="command">XCommand命令对象</param>
        /// <param name="param">参数</param>
        /// <param name="callback">查询设置回调</param>
        /// <returns>受影响的记录数</returns>
        public static int Execute(this XCommand command, object param, Action<XCommand> callback = null)
        {
            callback?.Invoke(command);

            return command.Connection.Execute(command.EffectiveCommandText, param);
        }

        /// <summary>
        /// 执行返回第一行第一列的查询。
        /// </summary>
        /// <typeparam name="T">返回结果类型</typeparam>
        /// <param name="command">XCommand命令对象</param>
        /// <param name="param">参数</param>
        /// <param name="callback">查询设置回调</param>
        /// <returns>第一行第一列的数据</returns>
        public static T ExecuteScalar<T>(this XCommand command, object param, Action<XCommand> callback = null)
        {
            callback?.Invoke(command);

            return command.Connection.ExecuteScalar<T>(command.EffectiveCommandText, param);
        }

        public static T QueryForObject<T>(this XCommand command, object param, Action<XCommand> callback = null)
        {
            callback?.Invoke(command);

            return command.Connection.QueryFirstOrDefault<T>(command.EffectiveCommandText, param);
        }

        public static IEnumerable<T> QueryForList<T>(this XCommand command, object param, Action<XCommand> callback = null)
        {
            callback?.Invoke(command);

            return command.Connection.Query<T>(command.EffectiveCommandText, param);
        }
    }
}