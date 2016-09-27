using System;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;
using System.Web.WebPages;

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

        private readonly HtmlHelper<T> _html;

        /// <summary>
        /// 表单宽度。
        /// </summary>
        private uint _formWidth;

        /// <summary>
        /// 标签宽度。
        /// </summary>
        private uint _labelWidth;

        private string _caption;

        private string _labelState = "S";

        private object _formAttributes;

        private object _labelAttributes;

        private TagBuilder _addOn;

        private ValidRule _rule = default(ValidRule);

        private ModelPropertyMetadata _metadata;

        #endregion

        #region 构造方法

        private FormControl(HtmlHelper<T> html)
        {
            this._html = html;
            this._rule = ValidRule.Default;
        }

        #endregion

        #region 静态方法

        /// <summary>
        /// 
        /// </summary>
        /// <param name="html"></param>
        /// <param name="expression"></param>
        internal static FormControl<T> Create<P>(HtmlHelper<T> html, Expression<Func<T, P>> expression)
        {
            var result = new FormControl<T>(html);

            result._addOn = new TagBuilder("span");
            result._metadata = html.Resolve(expression);

            return result;
        }

        #endregion

        #region 基本设置

        public FormControl<T> Caption(string text)
        {
            this._caption = text;

            return this;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="cols"></param>
        /// <returns></returns>
        public FormControl<T> Label(uint cols)
        {
            this._labelWidth = cols;

            return this;
        }

        /// <summary>
        /// 隐藏标签。
        /// </summary>
        /// <returns>表单控件</returns>
        public FormControl<T> HideLabel()
        {
            this._labelState = "H";

            return this;
        }

        /// <summary>
        /// 删除标签。
        /// </summary>
        /// <returns>表单控件</returns>
        public FormControl<T> RemoveLabel()
        {
            this._labelState = "R";

            return this;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="htmlAttributes"></param>
        /// <returns></returns>
        public FormControl<T> Label(object htmlAttributes)
        {
            this._labelAttributes = htmlAttributes;

            return this;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="cols"></param>
        /// <returns></returns>
        public FormControl<T> Form(uint cols)
        {
            this._formWidth = cols;

            return this;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="htmlAttributes"></param>
        /// <returns></returns>
        public FormControl<T> Form(object htmlAttributes)
        {
            this._formAttributes = htmlAttributes;

            return this;
        }

        /// <summary>
        /// 验证信息。
        /// </summary>
        /// <param name="rule">验证规则</param>
        /// <returns>表单控件</returns>
        public FormControl<T> Valid(ValidRule rule)
        {
            this._rule = rule;

            return this;
        }

        /// <summary>
        /// 表单的附属标签。
        /// </summary>
        /// <param name="text">标签文字</param>
        /// <returns>表单控件</returns>
        public FormControl<T> AddOn(string text)
        {
            this._addOn.SetInnerText(text);
            this._addOn.AddCssClass("input-group-addon");

            return this;
        }

        /// <summary>
        /// 表单附属标签。
        /// </summary>
        /// <param name="buttonPart">按钮设置区域</param>
        /// <returns>表单控件</returns>
        public FormControl<T> AddOn(Func<ModelPropertyMetadata, object> buttonPart)
        {
            var helperResult = new HelperResult(writer => writer.Write(buttonPart(this._metadata)));

            this._addOn.AddCssClass("input-group-btn");
            this._addOn.InnerHtml = this._html.Raw(helperResult)?.ToString();

            return this;
        }

        #endregion

        /// <summary>
        /// 呈现表单控件。
        /// </summary>
        /// <param name="formControlPart">表单区</param>
        /// <returns>呈现的表单HTML片段</returns>
        public IHtmlString Render(Func<ModelPropertyMetadata, object> formControlPart)
        {
            var divTag = new TagBuilder("div");
            var labelTag = this.CreateLabelTag(this._metadata);

            var formContainerTag = new TagBuilder("div");
            formContainerTag.AddCssClass($"col-sm-{this._formWidth}");

            var helperResult = new HelperResult(writer => writer.Write(formControlPart(this._metadata)));

            formContainerTag.InnerHtml += this._html.Raw(helperResult);

            divTag.InnerHtml += labelTag;
            divTag.InnerHtml += formContainerTag;

            return new MvcHtmlString(divTag.InnerHtml);
        }

        /// <summary>
        /// 呈现文本框表单控件。
        /// </summary>
        /// <returns>文本框的HTML片段</returns>
        public IHtmlString RenderTextBox()
        {
            var divTag = new TagBuilder("div");
            var labelTag = this.CreateLabelTag(this._metadata);
            var formContainerTag = new TagBuilder("div");

            formContainerTag.AddCssClass($"col-sm-{this._formWidth}");

            var formTag = new TagBuilder("input");

            formTag.Attributes.Add("type", "text");
            formTag.Attributes.Add("value", Convert.ToString(this._metadata.Value));
            formTag.AddCssClass("form-control");
            formTag.Attributes.Add("name", this._metadata.FullName);
            formTag.Attributes.Add("id", this._metadata.ElementId);
            formTag.Attributes.Add("placeholder", this._metadata.DisplayName);
            formTag.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(this._formAttributes), true);

            if (_rule != ValidRule.Default)
            {
                var validAttributes = this._html.GetValidAttributes<T, object>(this._metadata.DisplayName, this._rule);

                formTag.MergeAttributes(validAttributes, true);
            }

            divTag.InnerHtml += labelTag;

            if (string.IsNullOrWhiteSpace(this._addOn.InnerHtml))
            {
                formContainerTag.InnerHtml += formTag;
                divTag.InnerHtml += formContainerTag;
            }
            else
            {
                var inputGroupTag = new TagBuilder("div");

                inputGroupTag.AddCssClass("input-group");

                inputGroupTag.InnerHtml += formTag;
                inputGroupTag.InnerHtml += this._addOn;
                formContainerTag.InnerHtml += inputGroupTag;

                divTag.InnerHtml += formContainerTag;
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
            var labelTag = this.CreateLabelTag(this._metadata);
            var formContainerTag = new TagBuilder("div");

            formContainerTag.AddCssClass($"col-sm-{this._formWidth}");

            var formTag = new TagBuilder("textarea");
            formTag.SetInnerText(Convert.ToString(this._metadata.Value));

            formTag.AddCssClass("form-control");
            formTag.Attributes.Add("id", this._metadata.ElementId);
            formTag.Attributes.Add("name", this._metadata.FullName);
            formTag.Attributes.Add("placeholder", this._metadata.DisplayName);
            formTag.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(this._formAttributes), true);

            if (this._rule != ValidRule.Default)
            {
                var validAttributes = this._html.GetValidAttributes<T, object>(this._metadata.DisplayName, this._rule);

                formTag.MergeAttributes(validAttributes, true);
            }

            formContainerTag.InnerHtml += formTag;

            divTag.InnerHtml += labelTag;
            divTag.InnerHtml += formContainerTag;

            return new MvcHtmlString(divTag.InnerHtml);
        }

        public IHtmlString DropdownListFor(string category, bool includeAll = false)
        {
            return this.Render(p => this._html.CreateDropdownList(p.FullName, category, p.Value?.ToString(), includeAll, this._formAttributes));
        }

        #region 私有方法

        private TagBuilder CreateLabelTag(ModelPropertyMetadata metadata)
        {
            if (this._labelState == "R")
            {
                return null;
            }

            var labelTag = new TagBuilder("label");
            var labelCssClass = $"col-sm-{this._labelWidth} control-label";

            labelTag.AddCssClass(labelCssClass);
            labelTag.Attributes.Add("for", metadata.ElementId);
            labelTag.SetInnerText(this._labelState == "S" ? (string.IsNullOrWhiteSpace(this._caption) ? metadata.DisplayName : this._caption) : "");
            labelTag.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(this._labelAttributes), true);

            if (metadata.IsRequired)
            {
                this._rule = ValidRule.NotNull;
            }

            if (this._labelState == "S" && this._rule != ValidRule.Default && !this._rule.ToString().Contains("OrNull"))
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