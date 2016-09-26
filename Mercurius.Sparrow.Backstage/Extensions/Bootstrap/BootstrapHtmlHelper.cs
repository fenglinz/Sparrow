using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using System.Web.WebPages;
using Microsoft.Ajax.Utilities;

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
        /// 单选按钮组。
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <typeparam name="P"></typeparam>
        /// <param name="html"></param>
        /// <param name="expression"></param>
        /// <param name="textValues"></param>
        /// <param name="attributes"></param>
        /// <returns></returns>
        public static IHtmlString RadiosFor<T, P>(
            this HtmlHelper<T> html,
            Expression<Func<T, P>> expression,
            IList<TextValue> textValues,
            object attributes = null
            )
        {
            var propertyName = ExpressionHelper.GetExpressionText(expression);
            var value = html.ViewData.Model == null ? null : html.ViewData.ModelMetadata.ModelType.GetProperty(propertyName).GetValue(html.ViewData.Model);

            var btnGroupTag = new TagBuilder("div");

            btnGroupTag.AddCssClass("btn-group");
            btnGroupTag.Attributes.Add("data-toggle", "buttons");

            var index = 0;
            foreach (var item in textValues)
            {
                var labelTag = new TagBuilder("label");
                var radioTag = new TagBuilder("input");

                labelTag.AddCssClass("btn btn-default");

                radioTag.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(new
                {
                    type = "radio",
                    name = propertyName,
                    id = $"{propertyName}{++index}",
                    value = item.Value,
                    autocomplete = "off"
                }));

                radioTag.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(attributes), true);

                var textValue = Convert.ToString(value);

                if ((index == 1 && string.IsNullOrWhiteSpace(textValue)) || item.Value == textValue)
                {
                    labelTag.AddCssClass("active");
                    radioTag.Attributes.Add("checked", "checked");
                }

                labelTag.InnerHtml = radioTag + $" {item.Text}";
                btnGroupTag.InnerHtml += labelTag;
            }

            return new MvcHtmlString(btnGroupTag.ToString());
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

            return new ModelPropertyMetadata
            {
                FullName = fullName,
                Value = metadata.Model,
                IsRequired = metadata.IsRequired,
                DisplayName = metadata.GetDisplayName()
            };
        }
    }
}