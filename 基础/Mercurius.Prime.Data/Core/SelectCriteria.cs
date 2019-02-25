using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Prime.Core;
using Mercurius.Prime.Data.Parser.Builder;

namespace Mercurius.Prime.Data
{
    /// <summary>
    /// 查询语句的动态查询条件
    /// </summary>
    public abstract class SelectCriteria : Criteria
    {
        #region 属性

        /// <summary>
        /// 排序集合
        /// </summary>
        internal IList<OrderColumn> OrderBys { get; private set; } = new List<OrderColumn>();

        /// <summary>
        /// 分组集合
        /// </summary>
        internal IList<GroupColumn> GroupBys { get; private set; } = new List<GroupColumn>();

        #endregion

        #region 构造方法

        /// <summary>
        /// 默认构造方法
        /// </summary>
        internal SelectCriteria(CommandTextBuilder commandTextBuilder = null)
        {
            this._commandTextBuilder = commandTextBuilder;
        }

        #endregion

        internal override string GetCriteriaSegment()
        {
            return this._commandTextBuilder?.GetSelectCriteriaSegment(this.Segments, this.GroupBys, this.OrderBys);
        }

        #region 公开方法

        #endregion
    }

    /// <summary>
    /// 泛型查询语句的动态查询条件
    /// </summary>
    /// <typeparam name="T">实体类型</typeparam>
    public sealed class SelectCriteria<T> : SelectCriteria
    {
        #region 构造方法

        /// <summary>
        /// 构造方法
        /// </summary>
        /// <param name="commandTextBuilder"></param>
        public SelectCriteria(CommandTextBuilder commandTextBuilder = null) : base(commandTextBuilder) { }

        #endregion

        #region 公开方法
        #region Where

        /// <summary>
        /// 添加where关键字
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="criteria">查询语句的动态查询对象</param>
        /// <param name="trimeds">去掉不需要的前后缀列表</param>
        /// <returns>查询语句的动态查询对象</returns>
        public SelectCriteria<T> Where(string[] trimeds = null)
        {
            if (this.NeedWhere)
            {
                throw new Exception(WhereExistsErrorMessage);
            }

            if (!this.Segments.IsEmpty())
            {
                throw new Exception(WhereMustFirstErrorMessage);
            }

            if (!trimeds.IsEmpty())
            {
                this.Trimeds = trimeds;
            }

            this.NeedWhere = true;

            return this;
        }

        #endregion

        #region Segment

        public SelectCriteria<T> Segment(
            Expression<Func<T, object>> expression,
            CompareType compare = CompareType.Equal,
            ConcatType concat = ConcatType.And,
            Func<bool> func = null,
            bool usePrefix = false
        )
        {
            var tuple = ResolveExpression(expression);
            var item = new Segment
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
                this.Segments.Last().Complexes.Add(item);
            }
            else
            {
                this.Segments.Add(item);
            }

            return this;
        }

        #endregion

        /// <summary>
        /// 添加复杂条件(带'()'的条件组)
        /// </summary>
        /// <param name="action">复杂条件设置回调</param>
        /// <returns>动态条件对象</returns>
        public SelectCriteria<T> Complexes(Action<SelectCriteria<T>> action)
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
