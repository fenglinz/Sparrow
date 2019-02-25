using System;
using System.Linq.Expressions;

namespace Mercurius.Prime.Data.Service
{
    /// <summary>
    /// 过滤条件扩展类。
    /// </summary>
    public static class CriteriaExtension
    {
        #region 字段

        /// <summary>
        /// 查询表达式错误信息
        /// </summary>
        internal static readonly string SegmentExpressionErrorMessage = "查询Lambda表达式错误，必须为简单的返回属性的表达式！";

        #endregion

        #region Null

        public static Criteria<T> Null<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.Null, ConcatType.And, func, usePrefix);
        }

        public static Criteria<T> OrNull<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.Null, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region NotNull

        public static Criteria<T> NotNull<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.NotNull, ConcatType.And, func, usePrefix);
        }

        public static Criteria<T> OrNotNull<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.NotNull, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region Equal

        public static Criteria<T> Equal<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.Equal, ConcatType.And, func, usePrefix);
        }

        public static Criteria<T> OrEqual<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.Equal, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region NotEqual

        public static Criteria<T> NotEqual<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.NotEqual, ConcatType.And, func, usePrefix);
        }

        public static Criteria<T> OrNotEqual<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.NotEqual, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region Like

        public static Criteria<T> Like<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.Like, ConcatType.And, func, usePrefix);
        }

        public static Criteria<T> OrLike<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.Like, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region StartsWith

        public static Criteria<T> StartsWith<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.StartsWith, ConcatType.And, func, usePrefix);
        }

        public static Criteria<T> OrStartsWith<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.StartsWith, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region EndsWith

        public static Criteria<T> EndsWith<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.EndsWith, ConcatType.And, func, usePrefix);
        }

        public static Criteria<T> OrEndsWith<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.EndsWith, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region GreaterThan

        public static Criteria<T> GreaterThan<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.GreaterThan, ConcatType.And, func, usePrefix);
        }

        public static Criteria<T> OrGreaterThan<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.GreaterThan, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region GreaterEqual

        public static Criteria<T> GreaterEqual<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.GreaterEqual, ConcatType.And, func, usePrefix);
        }

        public static Criteria<T> OrGreaterEqual<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.GreaterEqual, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region LessThan

        public static Criteria<T> LessThan<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.LessThan, ConcatType.And, func, usePrefix);
        }

        public static Criteria<T> OrLessThan<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.LessThan, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region LessEqual

        public static Criteria<T> LessEqual<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.LessEqual, ConcatType.And, func, usePrefix);
        }

        public static Criteria<T> OrLessEqual<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.LessEqual, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region In

        public static Criteria<T> In<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.In, ConcatType.And, func, usePrefix);
        }

        public static Criteria<T> OrIn<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.In, ConcatType.Or, func, usePrefix);
        }

        #endregion

        #region NotIn

        public static Criteria<T> NotIn<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.NotIn, ConcatType.And, func, usePrefix);
        }

        public static Criteria<T> OrNotIn<T>(this Criteria<T> criteria,
            Expression<Func<T, object>> expression, Func<bool> func = null, bool usePrefix = false)
        {
            return criteria.Segment(expression, CompareType.NotIn, ConcatType.Or, func, usePrefix);
        }

        #endregion
    }
}