using System;
using System.Linq;
using System.Linq.Expressions;
using Mercurius.Prime.Core;
using static Mercurius.Prime.Data.Criteria;

namespace Mercurius.Prime.Data.Service
{
    /// <summary>
    /// 查询条件扩展类
    /// </summary>
    public static class SelectCriteriaExtension
    {
        #region Null

        public static SelectCriteria<T> Null<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.Null, ConcatType.And, func, usePrefix);
        }

        public static SelectCriteria<T> OrNull<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.Null, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region NotNull

        public static SelectCriteria<T> NotNull<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.NotNull, ConcatType.And, func, usePrefix);
        }

        public static SelectCriteria<T> OrNotNull<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.NotNull, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region Equal

        public static SelectCriteria<T> Equal<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.Equal, ConcatType.And, func, usePrefix);
        }

        public static SelectCriteria<T> OrEqual<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.Equal, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region NotEqual

        public static SelectCriteria<T> NotEqual<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.NotEqual, ConcatType.And, func, usePrefix);
        }

        public static SelectCriteria<T> OrNotEqual<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.NotEqual, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region Like

        public static SelectCriteria<T> Like<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.Like, ConcatType.And, func, usePrefix);
        }

        public static SelectCriteria<T> OrLike<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.Like, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region StartsWith

        public static SelectCriteria<T> StartsWith<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.StartsWith, ConcatType.And, func, usePrefix);
        }

        public static SelectCriteria<T> OrStartsWith<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.StartsWith, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region EndsWith

        public static SelectCriteria<T> EndsWith<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.EndsWith, ConcatType.And, func, usePrefix);
        }

        public static SelectCriteria<T> OrEndsWith<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.EndsWith, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region GreaterThan

        public static SelectCriteria<T> GreaterThan<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.GreaterThan, ConcatType.And, func, usePrefix);
        }

        public static SelectCriteria<T> OrGreaterThan<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.GreaterThan, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region GreaterEqual

        public static SelectCriteria<T> GreaterEqual<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.GreaterEqual, ConcatType.And, func, usePrefix);
        }

        public static SelectCriteria<T> OrGreaterEqual<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.GreaterEqual, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region LessThan

        public static SelectCriteria<T> LessThan<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.LessThan, ConcatType.And, func, usePrefix);
        }

        public static SelectCriteria<T> OrLessThan<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.LessThan, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region LessEqual

        public static SelectCriteria<T> LessEqual<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.LessEqual, ConcatType.And, func, usePrefix);
        }

        public static SelectCriteria<T> OrLessEqual<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.LessEqual, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region In

        public static SelectCriteria<T> In<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.In, ConcatType.And, func, usePrefix);
        }

        public static SelectCriteria<T> OrIn<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.In, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region NotIn

        public static SelectCriteria<T> NotIn<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.NotIn, ConcatType.And, func, usePrefix);
        }

        public static SelectCriteria<T> OrNotIn<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.NotIn, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region OrderBy

        public static SelectCriteria<T> OrderBy<T>(this SelectCriteria<T> criteria, string column)
        {
            if (criteria == null)
            {
                return criteria;
            }

            var tuple = column.Split('.');

            criteria.OrderBys?.Add(new OrderColumn
            {
                Prefix = tuple.Length > 1 ? tuple.FirstOrDefault() : string.Empty,
                Column = tuple.LastOrDefault(),
                OrderBy = "ASC"
            });

            return criteria;
        }

        public static SelectCriteria<T> OrderBy<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, bool usePrefix = false)
        {
            if (criteria == null)
            {
                return criteria;
            }

            var tuple = ResolveExpression(expression);

            criteria.OrderBys?.Add(new OrderColumn
            {
                Prefix = usePrefix ? tuple.Item3 : string.Empty,
                Column = tuple.Item1,
                OrderBy = "ASC"
            });

            return criteria;
        }

        public static SelectCriteria<T> OrderByDescending<T>(this SelectCriteria<T> criteria, string column)
        {
            if (criteria == null)
            {
                return criteria;
            }

            var tuple = column.Split('.');

            criteria.OrderBys?.Add(new OrderColumn
            {
                Prefix = tuple.Length > 1 ? tuple.FirstOrDefault() : string.Empty,
                Column = tuple.LastOrDefault(),
                OrderBy = "DESC"
            });

            return criteria;
        }

        public static SelectCriteria<T> OrderByDescending<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, bool usePrefix = false)
        {
            if (criteria == null)
            {
                return criteria;
            }

            var tuple = ResolveExpression(expression);

            criteria.OrderBys?.Add(new OrderColumn
            {
                Prefix = usePrefix ? tuple.Item3 : string.Empty,
                Column = tuple.Item1,
                OrderBy = "DESC"
            });

            return criteria;
        }

        #endregion

        #region GroupBy

        public static SelectCriteria<T> GroupBy<T>(this SelectCriteria<T> criteria,
            Expression<Func<T, object>> expression, bool usePrefix = false)
        {
            if (criteria == null)
            {
                return criteria;
            }

            var tuple = ResolveExpression(expression);

            criteria.GroupBys?.Add(new GroupColumn
            {
                Prefix = usePrefix ? tuple.Item3 : string.Empty,
                Column = tuple.Item1
            });

            return criteria;
        }

        #endregion
    }
}
