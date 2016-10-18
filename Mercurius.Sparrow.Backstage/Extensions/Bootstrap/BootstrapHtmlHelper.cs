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

        public TextValue(string data)
        {
            this.Text = data;
            this.Value = data;
        }

        public TextValue(string text, string value)
        {
            this.Text = text;
            this.Value = value;
        }
    }

    /// <summary>
    /// 基于Bootstrap的HTML呈现助手。
    /// </summary>
    public static class BootstrapHtmlHelper
    {
        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="html">HTML呈现助手</param>
        /// <param name="screen"></param>
        /// <returns></returns>
        public static FormGroup<T> FormGroup<T>(this HtmlHelper<T> html, Screen screen = Screen.Default)
        {
            return new FormGroup<T>(html, screen);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="html"></param>
        /// <param name="fullName"></param>
        /// <returns></returns>
        public static PropertyMetadata Resolve(this HtmlHelper html, string fullName)
        {
            var metadata = ModelMetadata.FromStringExpression(fullName, html.ViewData);

            var result = new PropertyMetadata
            {
                FullName = fullName,
                Type = metadata.ModelType,
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

        /// <summary>
        /// 解析视图模型属性元数据信息。
        /// </summary>
        /// <typeparam name="T">视图模型类型</typeparam>
        /// <typeparam name="P">视图模型属性类型</typeparam>
        /// <param name="html">HTML呈现器</param>
        /// <param name="expression">属性获取Lambda表达式</param>
        /// <returns>视图模型元数据信息</returns>
        public static PropertyMetadata Resolve<T, P>(this HtmlHelper<T> html, Expression<Func<T, P>> expression)
        {
            var fullName = ExpressionHelper.GetExpressionText(expression);
            var metadata = ModelMetadata.FromLambdaExpression(expression, html.ViewData);

            var result = new PropertyMetadata
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