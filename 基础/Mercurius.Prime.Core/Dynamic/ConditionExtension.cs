using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Microsoft.VisualBasic;

namespace Mercurius.Prime.Core.Dynamic
{
    public static class ConditionExtension
    {
        #region 公开方法

        /// <summary>
        /// 等于。
        /// </summary>
        /// <param name="propertyName">属性名</param>
        /// <param name="value">值</param>
        /// <returns>数据库查询条件</returns>
        public static Condition Eq(string propertyName, object value)
        {
            return new Condition(propertyName, Op.Eq, value);
        }

        /// <summary>
        /// 等于。
        /// </summary>
        /// <typeparam name="TModel">实体类型</typeparam>
        /// <typeparam name="TProperty">属性类型</typeparam>
        /// <param name="expression">属性获取Lambda表达式</param>
        /// <param name="value">值</param>
        /// <returns>数据库查询条件</returns>
        public static Condition Eq<TModel, TProperty>(Expression<Func<TModel, TProperty>> expression, TProperty value)
        {
            return Eq(expression.GetPropertyName(), value);
        }

        /// <summary>
        /// 大于。
        /// </summary>
        /// <param name="propertyName">属性名</param>
        /// <param name="value">值</param>
        /// <returns>数据库查询条件</returns>
        public static Condition Gt(string propertyName, object value)
        {
            return new Condition(propertyName, Op.Gt, value);
        }

        /// <summary>
        /// 大于。
        /// </summary>
        /// <typeparam name="TModel">实体类型</typeparam>
        /// <typeparam name="TProperty">属性类型</typeparam>
        /// <param name="expression">属性获取Lambda表达式</param>
        /// <param name="value">值</param>
        /// <returns>数据库查询条件</returns>
        public static Condition Gt<TModel, TProperty>(Expression<Func<TModel, TProperty>> expression, TProperty value)
        {
            return Gt(expression.GetPropertyName(), value);
        }

        /// <summary>
        /// 大于等于。
        /// </summary>
        /// <param name="propertyName">属性名</param>
        /// <param name="value">值</param>
        /// <returns>数据库查询条件</returns>
        public static Condition Ge(string propertyName, object value)
        {
            return new Condition(propertyName, Op.Ge, value);
        }

        /// <summary>
        /// 大于等于。
        /// </summary>
        /// <typeparam name="TModel">实体类型</typeparam>
        /// <typeparam name="TProperty">属性类型</typeparam>
        /// <param name="expression">属性获取Lambda表达式</param>
        /// <param name="value"></param>
        /// <returns>数据库查询条件</returns>
        public static Condition Ge<TModel, TProperty>(Expression<Func<TModel, TProperty>> expression, TProperty value)
        {
            return Ge(expression.GetPropertyName(), value);
        }

        /// <summary>
        /// 小于。
        /// </summary>
        /// <param name="propertyName">属性名</param>
        /// <param name="value">值</param>
        /// <returns>数据查询条件</returns>
        public static Condition Lt(string propertyName, object value)
        {
            return new Condition(propertyName, Op.Lt, value);
        }

        /// <summary>
        /// 小于。
        /// </summary>
        /// <typeparam name="TModel">实体类型</typeparam>
        /// <typeparam name="TProperty">属性类型</typeparam>
        /// <param name="expression">属性获取Lambda表达式</param>
        /// <param name="value">值</param>
        /// <returns>数据库查询条件</returns>
        public static Condition Lt<TModel, TProperty>(Expression<Func<TModel, TProperty>> expression, TProperty value)
        {
            return Lt(expression.GetPropertyName(), value);
        }

        /// <summary>
        /// 小于等于。
        /// </summary>
        /// <param name="propertyName">属性名</param>
        /// <param name="value">值</param>
        /// <returns>数据库查询条件</returns>
        public static Condition Le(string propertyName, object value)
        {
            return new Condition(propertyName, Op.Le, value);
        }

        /// <summary>
        /// 小于等于。
        /// </summary>
        /// <typeparam name="TModel">实体类型</typeparam>
        /// <typeparam name="TProperty">属性类型</typeparam>
        /// <param name="expression">属性获取Lambda表达式</param>
        /// <param name="value"></param>
        /// <returns>数据库查询条件</returns>
        public static Condition Le<TModel, TProperty>(Expression<Func<TModel, TProperty>> expression, TProperty value)
        {
            return Le(expression.GetPropertyName(), value);
        }

        /// <summary>
        /// 包含。
        /// </summary>
        /// <param name="propertyName">属性名</param>
        /// <param name="value">值</param>
        /// <returns>数据库查询条件</returns>
        public static Condition Like(string propertyName, object value)
        {
            return new Condition(propertyName, Op.Like, value);
        }

        /// <summary>
        /// 包含。
        /// </summary>
        /// <typeparam name="TModel">实体类型</typeparam>
        /// <typeparam name="TProperty">属性类型</typeparam>
        /// <param name="expression">属性获取Lambda表达式</param>
        /// <param name="value"></param>
        /// <returns>数据库查询条件</returns>
        public static Condition Like<TModel, TProperty>(Expression<Func<TModel, TProperty>> expression, TProperty value)
        {
            return Like(expression.GetPropertyName(), value);
        }

        /// <summary>
        /// 为Null。
        /// </summary>
        /// <param name="propertyName">属性名</param>
        /// <returns>数据库查询条件</returns>
        public static Condition IsNull(string propertyName)
        {
            return new Condition(propertyName, Op.IsNull, null);
        }

        /// <summary>
        /// 为Null。
        /// </summary>
        /// <typeparam name="TModel">实体类型</typeparam>
        /// <typeparam name="TProperty">属性类型</typeparam>
        /// <param name="expression">属性获取Lambda表达式</param>
        /// <returns>数据库查询条件</returns>
        public static Condition IsNull<TModel, TProperty>(Expression<Func<TModel, TProperty>> expression)
        {
            return IsNull(expression.GetPropertyName());
        }

        /// <summary>
        /// 非Null。
        /// </summary>
        /// <param name="propertyName">属性名</param>
        /// <returns>数据库查询条件</returns>
        public static Condition IsNotNull(string propertyName)
        {
            return new Condition(propertyName, Op.IsNotNull, null);
        }

        /// <summary>
        /// 非null。
        /// </summary>
        /// <typeparam name="TModel">实体类型</typeparam>
        /// <typeparam name="TProperty">属性类型</typeparam>
        /// <param name="expression">属性获取Lambda表达式</param>
        /// <returns>数据库查询条件</returns>
        public static Condition IsNotNull<TModel, TProperty>(Expression<Func<TModel, TProperty>> expression)
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
