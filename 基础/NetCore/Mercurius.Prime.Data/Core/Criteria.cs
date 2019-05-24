using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Entity;
using Mercurius.Prime.Data.Parser.Builder;
using static Mercurius.Prime.Data.Service.CriteriaExtension;

namespace Mercurius.Prime.Data
{
    /// <summary>
    /// 更新、删除动态条件
    /// </summary>
    public abstract class Criteria
    {
        #region 字段

        /// <summary>
        /// where条件的设置必须在第一项的异常信息
        /// </summary>
        internal static readonly string WhereMustFirstErrorMessage = "WHERE设置必须为第一项设置！";

        /// <summary>
        /// where条件多次设置异常信息
        /// </summary>
        internal static readonly string WhereExistsErrorMessage = "需要WHERE关键字已经设置，不需要再次重新设置！";

        /// <summary>
        /// 默认去掉的前缀和后缀
        /// </summary>
        internal static readonly string[] DefaultTrimed = { "AND", "OR" };

        /// <summary>
        /// 命令生成器
        /// </summary>
        protected CommandTextBuilder _commandTextBuilder;

        #endregion

        #region 属性

        /// <summary>
        /// 是否需要where条件.
        /// </summary>
        internal bool NeedWhere { get; set; } = false;

        /// <summary>
        /// 去掉的前缀和后缀
        /// </summary>
        internal IEnumerable<string> Trimeds { get; set; } = DefaultTrimed;

        /// <summary>
        /// 查询集合
        /// </summary>
        internal IList<Segment> Segments { get; private set; } = new List<Segment>();

        #endregion

        #region 业务属性

        /// <summary>
        /// 是否处于复合条件添加模式
        /// </summary>
        internal bool IsInComplexesMode { get; set; } = false;

        #endregion

        #region 构造方法

        /// <summary>
        /// 
        /// </summary>
        /// <param name="commandTextBuilder"></param>
        internal Criteria(CommandTextBuilder commandTextBuilder = null)
        {
            this._commandTextBuilder = commandTextBuilder;
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 添加过滤片段(任意)
        /// </summary>
        /// <param name="segment">sql片段</param>
        /// <param name="concat">连接方式枚举</param>
        /// <param name="func">片段有效判断回调</param>
        /// <returns>动态条件对象</returns>
        public Criteria Segment(string segment, ConcatType concat = ConcatType.And, Func<bool> func = null)
        {
            var item = new Segment
            {
                Compare = CompareType.None,
                SqlExpression = segment,
                Concat = concat,
                EffectiveFunc = func ?? (() => true)
            };

            if (this.IsInComplexesMode)
            {
                this.Segments.Last().Complexes.Add(item);
            }
            else
            {
                this.Segments.Add(item);
            }

            return this;
        }

        /// <summary>
        /// 添加过滤片段
        /// </summary>
        /// <param name="column">字段</param>
        /// <param name="paramName">查询参数名称(为空时使用column名称)</param>
        /// <param name="compare">比较方式</param>
        /// <param name="concat">连接方式枚举</param>
        /// <param name="func">片段有效判断回调</param>
        /// <returns>动态条件对象</returns>
        public Criteria Segment(string column, string paramName,
            CompareType compare = CompareType.Equal, ConcatType concat = ConcatType.And, Func<bool> func = null)
        {
            var item = new Segment
            {
                Column = column,
                Parameter = paramName.IsNullOrEmptyValue(column),
                Compare = compare,
                Concat = concat,
                EffectiveFunc = func ?? (() => true)
            };

            if (this.IsInComplexesMode)
            {
                this.Segments.Last().Complexes.Add(item);
            }
            else
            {
                this.Segments.Add(item);
            }

            return this;
        }

        /// <summary>
        /// 去掉多余的前后缀.
        /// </summary>
        /// <param name="sql">原始sql</param>
        /// <returns>去掉后的sql</returns>
        internal string TrimedSqlSegment(string sql)
        {
            if (sql.IsNotBlank() && !this.Trimeds.IsEmpty())
            {
                sql = sql.Trim();

                foreach (var item in this.Trimeds)
                {
                    if (sql.StartsWith(item, StringComparison.OrdinalIgnoreCase))
                    {
                        sql = sql.Substring(item.Length);
                    }

                    if (sql.EndsWith(item, StringComparison.OrdinalIgnoreCase))
                    {
                        sql = sql.Substring(0, sql.Length - item.Length);
                    }
                }
            }

            return sql;
        }

        /// <summary>
        /// 获取更新、删除条件sql片段
        /// </summary>
        /// <returns>sql片段</returns>
        internal virtual string GetCriteriaSegment()
        {
            return this._commandTextBuilder?.GetCriteriaSegment(this.Segments);
        }

        /// <summary>
        /// 添加需要带where条件的查询条件.
        /// </summary>
        /// <param name="trimeds">去掉不需要的前后缀列表</param>
        /// <returns>动态条件对象</returns>
        public Criteria Where(string[] trimeds = null)
        {
            if (!this.Segments.IsEmpty())
            {
                throw new Exception(WhereMustFirstErrorMessage);
            }

            if (this.NeedWhere)
            {
                throw new Exception(WhereExistsErrorMessage);
            }

            if (!trimeds.IsEmpty())
            {
                this.Trimeds = trimeds;
            }

            this.NeedWhere = true;

            return this;
        }

        #endregion

        #region 静态方法

        /// <summary>
        /// 根据Lambda表达式解析字段和查询参数
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="expression">Lambda表达式</param>
        /// <returns>
        /// Item1: 字段
        /// Item2: 查询参数
        /// Item3: Lambda表达式前缀
        /// </returns>
        internal static Tuple<string, string, string> ResolveExpression<T>(Expression<Func<T, object>> expression)
        {
            MemberExpression memberExpression = null;
            var unaryExpression = expression.Body as UnaryExpression;

            if (unaryExpression != null)
            {
                memberExpression = unaryExpression.Operand as MemberExpression;
            }
            else
            {
                memberExpression = expression.Body as MemberExpression;
            }

            if (memberExpression == null)
            {
                throw new Exception(SegmentExpressionErrorMessage);
            }

            var prefix = expression.Parameters[0].Name;
            var columnAttribute = memberExpression.Member.GetCustomAttribute<ColumnAttribute>();
            var column = columnAttribute?.Name.IsNotBlank() == true ? columnAttribute.Name : memberExpression.Member.Name;

            return new Tuple<string, string, string>(column, memberExpression.Member.Name, prefix);
        }

        #endregion
    }

    /// <summary>
    /// 泛型更新、删除动态条件
    /// </summary>
    /// <typeparam name="T">实体类型</typeparam>
    public sealed class Criteria<T> : Criteria
    {
        #region 构造方法

        /// <summary>
        /// 构造方法
        /// </summary>
        /// <param name="commandTextBuilder"></param>
        public Criteria(CommandTextBuilder commandTextBuilder = null) : base(commandTextBuilder) { }

        #endregion

        #region 公开方法

        /// <summary>
        /// 添加需要带where条件的查询条件.
        /// </summary>
        /// <param name="trimeds">去掉不需要的前后缀列表</param>
        /// <returns>动态条件对象</returns>
        public new Criteria<T> Where(string[] trimeds = null)
        {
            base.Where(trimeds);

            return this;
        }

        /// <summary>
        /// 添加过滤片段
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="expression">字段-参数Lambda表达式</param>
        /// <param name="compare">比较方式</param>
        /// <param name="concat">连接方式枚举</param>
        /// <param name="func">片段有效判断回调</param>
        /// <param name="usePrefix">是否启用Lambda变量作为前缀</param>
        /// <returns>动态条件对象</returns>
        public Criteria<T> Segment(Expression<Func<T, object>> expression,
            CompareType compare = CompareType.Equal, ConcatType concat = ConcatType.And, Func<bool> func = null, bool usePrefix = false)
        {
            var tuple = ResolveExpression(expression);
            var segment = new Segment
            {
                Prefix = usePrefix ? tuple.Item3 : string.Empty,
                Column = tuple.Item1,
                Parameter = tuple.Item2,
                Compare = compare,
                Concat = concat,
                EffectiveFunc = func ?? (() => true)
            };

            if (this.IsInComplexesMode)
            {
                var current = this.Segments.Last();

                current.Complexes.Add(segment);
            }
            else
            {
                this.Segments.Add(segment);
            }

            return this;
        }

        /// <summary>
        /// 添加复杂条件(带'()'的条件组)
        /// </summary>
        /// <param name="action">复杂条件设置回调</param>
        /// <returns>动态条件对象</returns>
        public Criteria<T> Complexes(Action<Criteria<T>> action)
        {
            if (action != null)
            {
                this.IsInComplexesMode = true;

                this.Segments.Add(new Segment
                {
                    Concat = ConcatType.And,
                    Complexes = new ComplexesSegment(),
                    EffectiveFunc = (() => true)
                });

                action.Invoke(this);

                this.IsInComplexesMode = false;
            }

            return this;
        }

        #endregion
    }
}
