using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Mvc;
using System.Web.WebPages;
using Mercurius.Sparrow.Mvc.Extensions;

namespace Mercurius.Sparrow.Mvc.Extensions
{
    /// <summary>
    /// 表单控件。
    /// </summary>
    public class FormControl<T>
    {
        #region 常量

        private const string HideCssClass = " sr-only";

        #endregion

        #region 字段

        /// <summary>
        /// 标签宽度。
        /// </summary>
        private readonly uint _labelWidth;

        /// <summary>
        /// 表单宽度。
        /// </summary>
        private readonly uint _formWidth;

        private readonly HtmlHelper<T> _html;

        private bool _labelVisible = true;

        private object _labelAttributes;

        private TagBuilder _addOn;

        private ValidRule _rule = default(ValidRule);

        #endregion

        #region 构造方法

        /// <summary>
        /// 
        /// </summary>
        /// <param name="html"></param>
        /// <param name="labelCols"></param>
        /// <param name="formCols"></param>
        internal FormControl(HtmlHelper<T> html, uint labelCols, uint formCols)
        {
            this._html = html;
            this._formWidth = formCols;
            this._labelWidth = labelCols;

            this._addOn = new TagBuilder("span");
            this._addOn.AddCssClass("input-group-addon");
        }

        #endregion

        #region 基本设置

        /// <summary>
        /// 
        /// </summary>
        /// <param name="visible"></param>
        /// <returns></returns>
        public FormControl<T> LabelVisible(bool visible = true)
        {
            this._labelVisible = visible;

            return this;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="htmlAttributes"></param>
        /// <returns></returns>
        public FormControl<T> LabelAttributes(object htmlAttributes)
        {
            this._labelAttributes = htmlAttributes;

            return this;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="rule"></param>
        /// <returns></returns>
        public FormControl<T> Valid(ValidRule rule)
        {
            this._rule = rule;

            return this;
        }

        public FormControl<T> AddOn(string text)
        {
            this._addOn.SetInnerText(text);

            return this;
        }

        public FormControl<T> AddOn(Func<object> addOnPart)
        {
            var helperResult = new HelperResult(writer => writer.Write(addOnPart()));

            this._addOn.InnerHtml = this._html.Raw(helperResult)?.ToString();

            return this;
        }

        #endregion

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="P"></typeparam>
        /// <param name="expression"></param>
        /// <param name="formControlPart"></param>
        /// <returns></returns>
        public IHtmlString Render<P>(Expression<Func<T, P>> expression, Func<ModelPropertyMetadata, object> formControlPart)
        {
            var metadata = this._html.Resolve(expression);

            var divTag = new TagBuilder("div");
            var labelTag = this.CreateLabelTag(metadata);

            var formContainerTag = new TagBuilder("div");
            formContainerTag.AddCssClass($"col-sm-{this._formWidth}");

            var helperResult = new HelperResult(writer => writer.Write(formControlPart(metadata)));

            formContainerTag.InnerHtml += this._html.Raw(helperResult);

            divTag.InnerHtml += labelTag;
            divTag.InnerHtml += formContainerTag;

            return new MvcHtmlString(divTag.ToString());
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="P"></typeparam>
        /// <param name="expression"></param>
        /// <param name="htmlAttributes"></param>
        /// <returns></returns>
        public IHtmlString RenderTextBox<P>(Expression<Func<T, P>> expression, object htmlAttributes = null)
        {
            var metadata = this._html.Resolve(expression);

            var divTag = new TagBuilder("div");
            var labelTag = this.CreateLabelTag(metadata);
            var formContainerTag = new TagBuilder("div");

            formContainerTag.AddCssClass($"col-sm-{this._formWidth}");

            var formTag = new TagBuilder("input");

            formTag.Attributes.Add("type", "text");
            formTag.Attributes.Add("value", Convert.ToString(metadata.Value));
            formTag.AddCssClass("form-control");
            formTag.Attributes.Add("name", metadata.FullName);
            formTag.Attributes.Add("id", metadata.ElementId);
            formTag.Attributes.Add("placeholder", metadata.DisplayName);
            formTag.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(htmlAttributes), true);

            if (_rule != ValidRule.Default)
            {
                var validAttributes = this._html.GetValidAttributes<T, P>(metadata.DisplayName, this._rule);

                formTag.MergeAttributes(validAttributes, true);
            }

            formContainerTag.InnerHtml += formTag;

            divTag.InnerHtml += labelTag;

            if (string.IsNullOrWhiteSpace(this._addOn.InnerHtml))
            {
                divTag.InnerHtml += formContainerTag;
            }
            else
            {
                var inputGroupTag = new TagBuilder("div");

                inputGroupTag.AddCssClass("input-group");

                inputGroupTag.InnerHtml += formTag;
                inputGroupTag.InnerHtml += this._addOn;

                divTag.InnerHtml += inputGroupTag;
            }

            return new MvcHtmlString(divTag.InnerHtml);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="P"></typeparam>
        /// <param name="expression"></param>
        /// <param name="htmlAttributes"></param>
        /// <returns></returns>
        public IHtmlString RenderTextArea<P>(Expression<Func<T, P>> expression, object htmlAttributes = null)
        {
            var metadata = this._html.Resolve(expression);

            var divTag = new TagBuilder("div");
            var labelTag = this.CreateLabelTag(metadata);
            var formContainerTag = new TagBuilder("div");

            formContainerTag.AddCssClass($"col-sm-{this._formWidth}");

            var formTag = new TagBuilder("textarea");
            formTag.SetInnerText(Convert.ToString(metadata.Value));

            formTag.AddCssClass("form-control");
            formTag.Attributes.Add("id", metadata.ElementId);
            formTag.Attributes.Add("name", metadata.FullName);
            formTag.Attributes.Add("placeholder", metadata.DisplayName);
            formTag.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(htmlAttributes), true);

            if (this._rule != ValidRule.Default)
            {
                var validAttributes = this._html.GetValidAttributes<T, P>(metadata.DisplayName, this._rule);

                formTag.MergeAttributes(validAttributes, true);
            }

            formContainerTag.InnerHtml += formTag;

            divTag.InnerHtml += labelTag;
            divTag.InnerHtml += formContainerTag;

            return new MvcHtmlString(divTag.InnerHtml);
        }

        #region 私有方法

        private TagBuilder CreateLabelTag(ModelPropertyMetadata metadata)
        {
            var labelTag = new TagBuilder("label");
            var labelCssClass = $"col-sm-{this._labelWidth} control-label{(this._labelVisible ? "" : HideCssClass)}";

            labelTag.AddCssClass(labelCssClass);
            labelTag.SetInnerText(metadata.DisplayName);
            labelTag.Attributes.Add("for", metadata.ElementId);
            labelTag.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(this._labelAttributes), true);

            if (this._rule == default(ValidRule) && metadata.IsRequired)
            {
                this._rule = ValidRule.NotNull;
            }

            if (!this._rule.ToString().Contains("OrNull"))
            {
                var errorTag = new TagBuilder("span");

                errorTag.AddCssClass("error");
                errorTag.SetInnerText("*");

                labelTag.InnerHtml = errorTag + labelTag.InnerHtml;
            }

            return labelTag;
        }

        #endregion
    }
}