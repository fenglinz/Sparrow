using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web.Mvc;
using Mercurius.Prime.Core;

namespace Mercurius.Kernel.WebCores.Helpers
{
    /// <summary>
    /// 数据处理扩展。
    /// </summary>
    public static class ModelExtensions
    {
        /// <summary>
        /// 显示模型数据。
        /// </summary>
        /// <typeparam name="T">数据模型类型</typeparam>
        /// <typeparam name="P">显示值的属性类型</typeparam>
        /// <param name="model">模型数据</param>
        /// <param name="expression">取值表达式</param>
        /// <param name="emptyReplace">空值替换值</param>
        /// <param name="format">数据显示格式</param>
        /// <returns>HTML片段</returns>
        public static MvcHtmlString ShowValue<T, P>(this T model,
            Expression<Func<T, P>> expression, string emptyReplace = null, string format = null)
        {
            var propertyName = ExpressionHelper.GetExpressionText(expression);

            if (model == null)
            {
                return string.IsNullOrWhiteSpace(emptyReplace) ? MvcHtmlString.Empty : MvcHtmlString.Create(emptyReplace);
            }

            var value = model.GetType().GetProperty(propertyName).GetValue(model);

            if (!string.IsNullOrWhiteSpace(Convert.ToString(value)))
            {
                return new MvcHtmlString(string.IsNullOrWhiteSpace(format) ? value.ToString() : string.Format(format, value));
            }

            return string.IsNullOrWhiteSpace(emptyReplace) ? MvcHtmlString.Empty : MvcHtmlString.Create(emptyReplace);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sources">数据源</param>
        /// <param name="expression"></param>
        /// <param name="index">索引</param>
        /// <typeparam name="T"></typeparam>
        /// <typeparam name="R"></typeparam>
        /// <returns></returns>
        public static R GetValue<T, R>(this IEnumerable<T> sources, Expression<Func<T, R>> expression, int index = 0)
        {
            if (sources.IsEmpty() || index < 0 || sources.Count() < index + 1)
            {
                return default(R);
            }

            var data = sources.ElementAt(index);
            var propertyName = ExpressionHelper.GetExpressionText(expression);

            var typeInfo = typeof(T);

            return (R)typeInfo.GetProperty(propertyName).GetValue(data);
        }
    }
}