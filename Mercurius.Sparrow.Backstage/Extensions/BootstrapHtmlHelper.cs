using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using System.Web.WebPages;
using Mercurius.Sparrow.Mvc.Extensions;
using Microsoft.Ajax.Utilities;

namespace Mercurius.Sparrow.Backstage
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
        /// <param name="expression"></param>
        /// <param name="formGroup"></param>
        /// <param name="rule"></param>
        /// <param name="formControlType"></param>
        /// <param name="attributes"></param>
        /// <returns></returns>
        public static IHtmlString FormControlFor<T, P>(
            this HtmlHelper<T> html,
            Expression<Func<T, P>> expression,
            FormGroup formGroup = null,
            ValidateRule rule = ValidateRule.NotNull,
            int formControlType = 1,
            object attributes = null
        )
        {
            formGroup = formGroup ?? FormGroup.Default(1, 3);

            var divTag = html.CreateFormGroupTag(expression,
                formGroup.ControlLabelCols, formGroup.FormControlCols, rule, formControlType, attributes);

            return new MvcHtmlString(divTag.InnerHtml);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <typeparam name="P"></typeparam>
        /// <param name="html"></param>
        /// <param name="expression"></param>
        /// <param name="formGroup"></param>
        /// <param name="formControlPart"></param>
        /// <returns></returns>
        public static IHtmlString FormGroupFor<T, P>(
            this HtmlHelper<T> html,
            Expression<Func<T, P>> expression,
            FormGroup formGroup,
            Func<TextValue, object> formControlPart
        )
        {
            var typeInfo = typeof(T);
            var propertyName = ExpressionHelper.GetExpressionText(expression);
            var value = html.ViewData.Model == null ? null : html.ViewData.ModelMetadata.ModelType.GetProperty(propertyName).GetValue(html.ViewData.Model);

            var displayAttribute = typeInfo.GetProperty(propertyName).GetCustomAttribute<DisplayAttribute>();
            var propertyDisplayName = displayAttribute == null ? propertyName : displayAttribute.Name;

            formGroup = formGroup ?? FormGroup.Default(1, 3);

            var divTag = new TagBuilder("div");

            divTag.AddCssClass(string.IsNullOrWhiteSpace(formGroup.Type) ? "form-group" : $"form-group form-group-{formGroup.Type.ToString().ToLower()}");

            var labelTag = new TagBuilder("label");

            labelTag.AddCssClass($"col-sm-{formGroup.ControlLabelCols} control-label");
            labelTag.Attributes.Add("for", propertyName);
            labelTag.SetInnerText(propertyDisplayName);

            var formContainerTag = new TagBuilder("div");
            formContainerTag.AddCssClass($"col-sm-{formGroup.FormControlCols}");

            var helperResult = new HelperResult(writer => writer.Write(formControlPart(new TextValue(propertyName, Convert.ToString(value)))));

            formContainerTag.InnerHtml += html.Raw(helperResult);

            divTag.InnerHtml += labelTag;
            divTag.InnerHtml += formContainerTag;

            return new MvcHtmlString(divTag.ToString());
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <typeparam name="P"></typeparam>
        /// <param name="html"></param>
        /// <param name="expression"></param>
        /// <param name="formGroup"></param>
        /// <param name="rule"></param>
        /// <param name="formControlType">控件类型(1:文本框、2:文本域)</param>
        /// <param name="attributes"></param>
        /// <returns></returns>
        public static IHtmlString FormGroupFor<T, P>(
            this HtmlHelper<T> html,
            Expression<Func<T, P>> expression,
            FormGroup formGroup = null,
            ValidateRule rule = ValidateRule.NotNull,
            int formControlType = 1,
            object attributes = null)
        {
            formGroup = formGroup ?? FormGroup.Default(1, 3);

            var divTag = html.CreateFormGroupTag(expression,
                formGroup.ControlLabelCols, formGroup.FormControlCols,
                rule, formControlType, attributes);

            divTag.AddCssClass(string.IsNullOrWhiteSpace(formGroup.Type) ? "form-group" : $"form-group form-group-{formGroup.Type.ToString().ToLower()}");

            return new MvcHtmlString(divTag.ToString());
        }

        #region 私有方法    

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <typeparam name="P"></typeparam>
        /// <param name="html"></param>
        /// <param name="expression"></param>
        /// <param name="formControlCols"></param>
        /// <param name="controlLabelCols"></param>
        /// <param name="rule"></param>
        /// <param name="formControlType">控件类型(1:文本框、2:文本域)</param>
        /// <param name="attributes"></param>
        /// <returns></returns>
        private static TagBuilder CreateFormGroupTag<T, P>(
            this HtmlHelper<T> html,
            Expression<Func<T, P>> expression,
            uint controlLabelCols = 1,
            uint formControlCols = 3,
            ValidateRule rule = ValidateRule.NotNull,
            int formControlType = 1,
            object attributes = null)
        {
            var typeInfo = typeof(T);
            var propertyName = ExpressionHelper.GetExpressionText(expression);
            var value = html.ViewData.Model == null ? null : html.ViewData.ModelMetadata.ModelType.GetProperty(propertyName).GetValue(html.ViewData.Model);

            var displayAttribute = typeInfo.GetProperty(propertyName).GetCustomAttribute<DisplayAttribute>();
            var propertyDisplayName = displayAttribute == null ? propertyName : displayAttribute.Name;

            var divTag = new TagBuilder("div");
            var labelTag = new TagBuilder("label");

            labelTag.AddCssClass($"col-sm-{controlLabelCols} control-label");
            labelTag.Attributes.Add("for", propertyName);
            labelTag.SetInnerText(propertyDisplayName);

            var formContainerTag = new TagBuilder("div");
            formContainerTag.AddCssClass($"col-sm-{formControlCols}");

            TagBuilder formControlTag;

            if (formControlType == 1)
            {
                formControlTag = new TagBuilder("input");
                formControlTag.Attributes.Add("type", "text");
                formControlTag.Attributes.Add("value", Convert.ToString(value));
            }
            else
            {
                formControlTag = new TagBuilder("textarea");
                formControlTag.SetInnerText(Convert.ToString(value));
            }

            formControlTag.AddCssClass("form-control");
            formControlTag.Attributes.Add("id", propertyName);
            formControlTag.Attributes.Add("name", propertyName);
            formControlTag.Attributes.Add("placeholder", propertyDisplayName);

            if (rule != ValidateRule.Default)
            {
                var validAttributes = html.GetValidAttributes<T, P>(propertyDisplayName, rule);

                formControlTag.MergeAttributes(validAttributes, true);

                if (!rule.ToString().Contains("OrNull"))
                {
                    var errorTag = new TagBuilder("span");

                    errorTag.AddCssClass("error");
                    errorTag.SetInnerText("*");

                    labelTag.InnerHtml = errorTag + labelTag.InnerHtml;
                }
            }

            var extraAttributes = HtmlHelper.AnonymousObjectToHtmlAttributes(attributes);
            formControlTag.MergeAttributes(extraAttributes, true);

            formContainerTag.InnerHtml += formControlTag;

            divTag.InnerHtml += labelTag;
            divTag.InnerHtml += formContainerTag;

            return divTag;
        }

        #endregion
    }
}