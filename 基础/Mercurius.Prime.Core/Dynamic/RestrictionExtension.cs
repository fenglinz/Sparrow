using System;
using System.Linq.Expressions;
using Microsoft.VisualBasic;

namespace Mercurius.Prime.Core.Dynamic
{
    /// <summary>
    /// 
    /// </summary>
    public static class RestrictionExtension
    {
        #region 公开方法

        /// <summary>
        /// 等于。
        /// </summary>
        /// <param name="propertyName">属性名</param>
        /// <param name="value">值</param>
        /// <returns>数据库查询条件</returns>
        public static Restriction Eq(string propertyName, object value)
        {
            return new Restriction(propertyName, Op.Eq, value);
        }

        /// <summary>
        /// 等于。
        /// </summary>
        /// <typeparam name="TModel">实体类型</typeparam>
        /// <typeparam name="TProperty">属性类型</typeparam>
        /// <param name="expression">属性获取Lambda表达式</param>
        /// <param name="value">值</param>
        /// <returns>数据库查询条件</returns>
        public static Restriction Eq<TModel, TProperty>(Expression<Func<TModel, TProperty>> expression, TProperty value)
        {
            return Eq(expression.GetPropertyName(), value);
        }

        /// <summary>
        /// 大于。
        /// </summary>
        /// <param name="propertyName">属性名</param>
        /// <param name="value">值</param>
        /// <returns>数据库查询条件</returns>
        public static Restriction Gt(string propertyName, object value)
        {
            return new Restriction(propertyName, Op.Gt, value);
        }

        /// <summary>
        /// 大于。
        /// </summary>
        /// <typeparam name="TModel">实体类型</typeparam>
        /// <typeparam name="TProperty">属性类型</typeparam>
        /// <param name="expression">属性获取Lambda表达式</param>
        /// <param name="value">值</param>
        /// <returns>数据库查询条件</returns>
        public static Restriction Gt<TModel, TProperty>(Expression<Func<TModel, TProperty>> expression, TProperty value)
        {
            return Gt(expression.GetPropertyName(), value);
        }

        /// <summary>
        /// 大于等于。
        /// </summary>
        /// <param name="propertyName">属性名</param>
        /// <param name="value">值</param>
        /// <returns>数据库查询条件</returns>
        public static Restriction Ge(string propertyName, object value)
        {
            return new Restriction(propertyName, Op.Ge, value);
        }

        /// <summary>
        /// 大于等于。
        /// </summary>
        /// <typeparam name="TModel">实体类型</typeparam>
        /// <typeparam name="TProperty">属性类型</typeparam>
        /// <param name="expression">属性获取Lambda表达式</param>
        /// <param name="value"></param>
        /// <returns>数据库查询条件</returns>
        public static Restriction Ge<TModel, TProperty>(Expression<Func<TModel, TProperty>> expression, TProperty value)
        {
            return Ge(expression.GetPropertyName(), value);
        }

        /// <summary>
        /// 小于。
        /// </summary>
        /// <param name="propertyName">属性名</param>
        /// <param name="value">值</param>
        /// <returns>数据查询条件</returns>
        public static Restriction Lt(string propertyName, object value)
        {
            return new Restriction(propertyName, Op.Lt, value);
        }

        /// <summary>
        /// 小于。
        /// </summary>
        /// <typeparam name="TModel">实体类型</typeparam>
        /// <typeparam name="TProperty">属性类型</typeparam>
        /// <param name="expression">属性获取Lambda表达式</param>
        /// <param name="value">值</param>
        /// <returns>数据库查询条件</returns>
        public static Restriction Lt<TModel, TProperty>(Expression<Func<TModel, TProperty>> expression, TProperty value)
        {
            return Lt(expression.GetPropertyName(), value);
        }

        /// <summary>
        /// 小于等于。
        /// </summary>
        /// <param name="propertyName">属性名</param>
        /// <param name="value">值</param>
        /// <returns>数据库查询条件</returns>
        public static Restriction Le(string propertyName, object value)
        {
            return new Restriction(propertyName, Op.Le, value);
        }

        /// <summary>
        /// 小于等于。
        /// </summary>
        /// <typeparam name="TModel">实体类型</typeparam>
        /// <typeparam name="TProperty">属性类型</typeparam>
        /// <param name="expression">属性获取Lambda表达式</param>
        /// <param name="value"></param>
        /// <returns>数据库查询条件</returns>
        public static Restriction Le<TModel, TProperty>(Expression<Func<TModel, TProperty>> expression, TProperty value)
        {
            return Le(expression.GetPropertyName(), value);
        }

        /// <summary>
        /// 包含。
        /// </summary>
        /// <param name="propertyName">属性名</param>
        /// <param name="value">值</param>
        /// <returns>数据库查询条件</returns>
        public static Restriction Like(string propertyName, object value)
        {
            return new Restriction(propertyName, Op.Like, value);
        }

        /// <summary>
        /// 包含。
        /// </summary>
        /// <typeparam name="TModel">实体类型</typeparam>
        /// <typeparam name="TProperty">属性类型</typeparam>
        /// <param name="expression">属性获取Lambda表达式</param>
        /// <param name="value"></param>
        /// <returns>数据库查询条件</returns>
        public static Restriction Like<TModel, TProperty>(Expression<Func<TModel, TProperty>> expression, TProperty value)
        {
            return Like(expression.GetPropertyName(), value);
        }

        /// <summary>
        /// 为Null。
        /// </summary>
        /// <param name="propertyName">属性名</param>
        /// <returns>数据库查询条件</returns>
        public static Restriction IsNull(string propertyName)
        {
            return new Restriction(propertyName, Op.IsNull, null);
        }

        /// <summary>
        /// 为Null。
        /// </summary>
        /// <typeparam name="TModel">实体类型</typeparam>
        /// <typeparam name="TProperty">属性类型</typeparam>
        /// <param name="expression">属性获取Lambda表达式</param>
        /// <returns>数据库查询条件</returns>
        public static Restriction IsNull<TModel, TProperty>(Expression<Func<TModel, TProperty>> expression)
        {
            return IsNull(expression.GetPropertyName());
        }

        /// <summary>
        /// 非Null。
        /// </summary>
        /// <param name="propertyName">属性名</param>
        /// <returns>数据库查询条件</returns>
        public static Restriction IsNotNull(string propertyName)
        {
            return new Restriction(propertyName, Op.IsNotNull, null);
        }

        /// <summary>
        /// 非null。
        /// </summary>
        /// <typeparam name="TModel">实体类型</typeparam>
        /// <typeparam name="TProperty">属性类型</typeparam>
        /// <param name="expression">属性获取Lambda表达式</param>
        /// <returns>数据库查询条件</returns>
        public static Restriction IsNotNull<TModel, TProperty>(Expression<Func<TModel, TProperty>> expression)
        {
            return IsNotNull(expression.GetPropertyName());
        }

        #endregion

        #region 私有方法

        public static string GetPropertyName(this LambdaExpression expression)
        {
            var body = expression.Body.ToString()
                .Replace("(", string.Empty).Replace(")", string.Empty);

            return body.Substring(body.LastIndexOf(".", StringComparison.Ordinal) + 1);
        }

        private static TProperty GetValue<TModel, TProperty>(this TModel model, string propertyName)
        {
            var value = model.GetType().GetProperty(propertyName).GetValue(model);

            return Conversion.CTypeDynamic<TProperty>(value);
        }

        #endregion
    }
}
