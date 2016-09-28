using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;

namespace Mercurius.Sparrow.Mvc.Extensions
{
    /// <summary>
    /// 
    /// </summary>
    public class TextValue
    {
        #region 属性

        public string Text { get; set; }

        public string Value { get; set; }

        #endregion

        public TextValue()
        {

        }

        public TextValue(string text, string value)
        {
            this.Text = text;
            this.Value = value;
        }
    }

    /// <summary>
    /// 基于Bootstrap的Html呈现器。
    /// </summary>
    public static class BootstrapHtmlHelper
    {
        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="html"></param>
        /// <param name="screen"></param>
        /// <returns></returns>
        public static FormGroup<T> FormGroup<T>(this HtmlHelper<T> html, Screen screen = Screen.Default)
        {
            return new FormGroup<T>(html, screen);
        }

        public static FormControl<T> FormControl<T, P>(this HtmlHelper<T> html,
            Expression<Func<T, P>> expression, uint labelCols = 1, uint formCols = 3, ValidRule rule = ValidRule.Default)
        {
            return FormControl<T>.Create(html, expression).Label(labelCols).Form(formCols).Valid(rule);
        }

        /// <summary>
        /// 解析视图模型属性元数据信息。
        /// </summary>
        /// <typeparam name="T">视图模型类型</typeparam>
        /// <typeparam name="P">视图模型属性类型</typeparam>
        /// <param name="html">HTML呈现器</param>
        /// <param name="expression">属性获取Lambda表达式</param>
        /// <returns>视图模型元数据信息</returns>
        internal static ModelPropertyMetadata Resolve<T, P>(this HtmlHelper<T> html, Expression<Func<T, P>> expression)
        {
            var fullName = ExpressionHelper.GetExpressionText(expression);
            var metadata = ModelMetadata.FromLambdaExpression(expression, html.ViewData);

            var result = new ModelPropertyMetadata
            {
                FullName = fullName,
                IsRequired = metadata.IsRequired,
                DisplayName = metadata.DisplayName
            };

            try
            {
                result.Value = metadata.Model;
            }
            catch { }

            return result;
        }
    }
}