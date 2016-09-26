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
    /// 表单组。
    /// </summary>
    public class FormGroup
    {
        #region 属性

        /// <summary>
        /// 表单组类型。
        /// </summary>
        internal string Type { get; private set; }

        /// <summary>
        /// 控件标签宽度(1-12)。
        /// </summary>
        internal uint ControlLabelCols { get; private set; }

        /// <summary>
        /// 表单控件宽度(1-12)。
        /// </summary>
        internal uint FormControlCols { get; private set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="type">表单组类型</param>
        /// <param name="label">标签宽度</param>
        /// <param name="form">表单宽度</param>
        private FormGroup(string type, uint label, uint form)
        {
            if (label < 1 || form < 1)
            {
                throw new ArgumentException("标签宽度或表单宽度不能小于0！");
            }

            if (label + form > 12)
            {
                throw new ArgumentException("标签宽度和表单宽度之和必须小于12！");
            }

            this.Type = type;
            this.ControlLabelCols = label;
            this.FormControlCols = form;
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 默认类型。
        /// </summary>
        /// <param name="label">标签宽度(1-12)</param>
        /// <param name="form">表单宽度(1-12)</param>
        /// <returns></returns>
        public static FormGroup Default(uint label, uint form)
        {
            return new FormGroup("", label, form);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="label"></param>
        /// <param name="form"></param>
        /// <returns></returns>
        public static FormGroup XS(uint label, uint form)
        {
            return new FormGroup("xs", label, form);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="label"></param>
        /// <param name="form"></param>
        /// <returns></returns>
        public static FormGroup SM(uint label, uint form)
        {
            return new FormGroup("sm", label, form);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="label"></param>
        /// <param name="form"></param>
        /// <returns></returns>
        public static FormGroup MD(uint label, uint form)
        {
            return new FormGroup("md", label, form);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="label"></param>
        /// <param name="form"></param>
        /// <returns></returns>
        public static FormGroup LG(uint label, uint form)
        {
            return new FormGroup("lg", label, form);
        }

        #endregion
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
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <typeparam name="P"></typeparam>
        /// <param name="html"></param>
        /// <param name="formGroup"></param>
        /// <param name="func"></param>
        /// <returns></returns>
        public static IHtmlString FormGroupFor<T, P>(this HtmlHelper<T> html, FormGroup formGroup, Func<FormControl<T>, object> func)
        {
            var formControl = new FormControl<T>(html, formGroup.ControlLabelCols, formGroup.FormControlCols);

            var helpResult = new HelperResult(writer => writer.Write(func(formControl)));

            var divTag = new TagBuilder("div");
            divTag.AddCssClass($"form-group{(string.IsNullOrWhiteSpace(formGroup.Type) ? "" : $" form-group-{formGroup.Type}")}");

            divTag.InnerHtml = html.Raw(helpResult)?.ToString();

            return new MvcHtmlString(divTag.ToString());
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