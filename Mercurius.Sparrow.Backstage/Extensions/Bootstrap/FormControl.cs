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
    public class FormControl<T, P>
    {
        #region 常量

        private const string HideCssClass = " sr-only";

        #endregion

        #region 字段

        /// <summary>
        /// 标签宽度。
        /// </summary>
        private uint _labelWidth;

        /// <summary>
        /// 表单宽度。
        /// </summary>
        private uint _formWidth;

        private readonly HtmlHelper<T> _html;

        private bool _labelVisible = true;

        private object _labelAttributes;

        private object _formAttributes;

        private ModelPropertyMetadata _propertyMetadata;

        private TagBuilder _addOn;

        private ValidRule _rule = default(ValidRule);

        #endregion

        #region 构造方法

        internal FormControl(HtmlHelper<T> html, Expression<Func<T, P>> expression)
        {
            this._html = html;
            this._propertyMetadata = this._html.Resolve(expression);

            this._addOn = new TagBuilder("span");
            this._addOn.AddCssClass("input-group-addon");
        }

        #endregion

        #region 基本设置

        public FormControl<T,P> Label(uint cols, object htmlAttributes = null)
        {
            this._labelWidth = cols;
            this._labelAttributes = htmlAttributes;

            return this;
        }

        public FormControl<T, P> Form(uint cols, object htmlAttributes = null)
        {
            this._formWidth = cols;
            this._formAttributes = htmlAttributes;

            return this;
        }

        /// <summary>
        /// 表单标签是否显示。
        /// </summary>
        /// <param name="visible">是否显示</param>
        /// <returns>表单控件</returns>
        public FormControl<T, P> LabelVisible(bool visible = true)
        {
            this._labelVisible = visible;

            return this;
        }

        /// <summary>
        /// 验证信息。
        /// </summary>
        /// <param name="rule">验证规则</param>
        /// <returns>表单控件</returns>
        public FormControl<T, P> Valid(ValidRule rule)
        {
            this._rule = rule;

            return this;
        }

        /// <summary>
        /// 表单的附属标签。
        /// </summary>
        /// <param name="text">标签文字</param>
        /// <returns>表单控件</returns>
        public FormControl<T, P> AddOn(string text)
        {
            this._addOn.SetInnerText(text);

            return this;
        }

        /// <summary>
        /// 表单附属标签。
        /// </summary>
        /// <param name="addOnPart">标签设置区域</param>
        /// <returns>表单控件</returns>
        public FormControl<T, P> AddOn(Func<object> addOnPart)
        {
            var helperResult = new HelperResult(writer => writer.Write(addOnPart()));

            this._addOn.InnerHtml = this._html.Raw(helperResult)?.ToString();

            return this;
        }

        #endregion

        /// <summary>
        /// 呈现表单控件。
        /// </summary>
        /// <typeparam name="P">属性类型</typeparam>
        /// <param name="formControlPart">表单区</param>
        /// <returns>呈现的表单HTML片段</returns>
        public IHtmlString Render(Func<ModelPropertyMetadata, object> formControlPart)
        {
            var divTag = new TagBuilder("div");
            var labelTag = this.CreateLabelTag(this._propertyMetadata);

            var formContainerTag = new TagBuilder("div");
            formContainerTag.AddCssClass($"col-sm-{this._formWidth}");

            var helperResult = new HelperResult(writer => writer.Write(formControlPart(this._propertyMetadata)));

            formContainerTag.InnerHtml += this._html.Raw(helperResult);

            divTag.InnerHtml += labelTag;
            divTag.InnerHtml += formContainerTag;

            return new MvcHtmlString(divTag.ToString());
        }

        /// <summary>
        /// 呈现文本框表单控件。
        /// </summary>
        /// <returns>文本框的HTML片段</returns>
        public IHtmlString RenderTextBox()
        {
            var divTag = new TagBuilder("div");
            var labelTag = this.CreateLabelTag(this._propertyMetadata);
            var formContainerTag = new TagBuilder("div");

            formContainerTag.AddCssClass($"col-sm-{this._formWidth}");

            var formTag = new TagBuilder("input");

            formTag.Attributes.Add("type", "text");
            formTag.Attributes.Add("value", Convert.ToString(this._propertyMetadata.Value));
            formTag.AddCssClass("form-control");
            formTag.Attributes.Add("name", this._propertyMetadata.FullName);
            formTag.Attributes.Add("id", this._propertyMetadata.ElementId);
            formTag.Attributes.Add("placeholder", this._propertyMetadata.DisplayName);
            formTag.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(this._formAttributes), true);

            if (_rule != ValidRule.Default)
            {
                var validAttributes = this._html.GetValidAttributes<T, object>(this._propertyMetadata.DisplayName, this._rule);

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
        /// 呈现文本域表单控件。
        /// </summary>
        /// <returns>文本域的HTML片段</returns>
        public IHtmlString RenderTextArea()
        {
            var divTag = new TagBuilder("div");
            var labelTag = this.CreateLabelTag(this._propertyMetadata);
            var formContainerTag = new TagBuilder("div");

            formContainerTag.AddCssClass($"col-sm-{this._formWidth}");

            var formTag = new TagBuilder("textarea");
            formTag.SetInnerText(Convert.ToString(this._propertyMetadata.Value));

            formTag.AddCssClass("form-control");
            formTag.Attributes.Add("id", this._propertyMetadata.ElementId);
            formTag.Attributes.Add("name", this._propertyMetadata.FullName);
            formTag.Attributes.Add("placeholder", this._propertyMetadata.DisplayName);
            formTag.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(this._formAttributes), true);

            if (this._rule != ValidRule.Default)
            {
                var validAttributes = this._html.GetValidAttributes<T, object>(this._propertyMetadata.DisplayName, this._rule);

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