using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static Mercurius.Sparrow.Mvc.Extensions.ValidationExtensions;

namespace Mercurius.Sparrow.Mvc.Extensions.Controls
{
    /// <summary>
    /// 表单基类。
    /// </summary>
    public abstract class FormBase
    {
        /// <summary>
        /// 视图模型属性元数据信息。
        /// </summary>
        protected PropertyMetadata _metadata;

        #region 属性

        /// <summary>
        /// 屏幕枚举。
        /// </summary>
        public Screen Screen { get; set; }

        /// <summary>
        /// 标签宽度。
        /// </summary>
        public uint LabelCols { get; set; }

        /// <summary>
        /// 表单宽度。
        /// </summary>
        public uint FormCols { get; set; }

        /// <summary>
        /// 标签。
        /// </summary>
        public string Label { get; set; }

        /// <summary>
        /// 标签的内联样式。
        /// </summary>
        public string LabelStyle { get; set; }

        /// <summary>
        /// 标签状态。
        /// </summary>
        public string LabelState { get; set; } = "S";

        /// <summary>
        /// css样式类名称。
        /// </summary>
        public string Class { get; set; }

        /// <summary>
        /// 表单内联样式。
        /// </summary>
        public string Style { get; set; }

        /// <summary>
        /// 是否为只读。
        /// </summary>
        public bool Readonly { get; set; }

        /// <summary>
        /// 是否禁用。
        /// </summary>
        public bool Disabled { get; set; }

        /// <summary>
        /// 属性。
        /// </summary>
        public object HtmlAttributes { get; set; }

        /// <summary>
        /// 验证字段名称。
        /// </summary>
        public string RuleField { get; set; }

        /// <summary>
        /// 格式化字符串。
        /// </summary>
        public string FormatString { get; set; }

        /// <summary>
        /// 验证规则。
        /// </summary>
        public ValidRule Rule { get; set; } = ValidRule.Default;

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="screen">屏幕类型</param>
        /// <param name="metadata">视图模型属性元数据</param>
        protected FormBase(Screen screen, PropertyMetadata metadata)
        {
            this._metadata = metadata;

            this.Screen = screen;
            this.Class = "form-control";
            this.Label = metadata.DisplayName;
            this.RuleField = metadata.DisplayName;
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 控件呈现。
        /// </summary>
        /// <returns>Html片段</returns>
        public virtual IHtmlString Render()
        {
            var container = new TagBuilder("div");
            var label = this.CreateLabel();
            var form = this.CreateForm();

            form.MergeAttributes(this.GetFormAttributes(), true);

            container.InnerHtml += label;

            if (this.FormCols > 0)
            {
                var formContainer = new TagBuilder("div");

                formContainer.AddCssClass($"col-sm-{this.FormCols}");

                formContainer.InnerHtml += form;
                container.InnerHtml += formContainer;
            }
            else
            {
                container.InnerHtml += form;
            }

            return new MvcHtmlString(container.InnerHtml);
        }

        #endregion

        /// <summary>
        /// 创建表单。
        /// </summary>
        /// <returns>表单信息</returns>
        protected abstract TagBuilder CreateForm();

        #region 受保护方法

        /// <summary>
        /// 获取表单值。
        /// </summary>
        /// <returns>表单的值</returns>
        protected string GetValue()
        {
            return string.IsNullOrWhiteSpace(this.FormatString) ? Convert.ToString(this._metadata.Value) : string.Format(this.FormatString, this._metadata.Value);
        }

        /// <summary>
        /// 创建标签。
        /// </summary>
        /// <returns>标签对象</returns>
        protected TagBuilder CreateLabel()
        {
            if (this.LabelState == "R")
            {
                return null;
            }

            var labelTag = new TagBuilder("label");

            if (this.LabelCols > 0)
            {
                var labelCssClass = $"col-sm-{this.LabelCols}";

                labelTag.AddCssClass(labelCssClass);
            }

            labelTag.AddCssClass("control-label");
            labelTag.Attributes.Add("for", this._metadata.ElementId);
            labelTag.Attributes.Add("style", this.LabelStyle);
            labelTag.SetInnerText(this.LabelState == "S" ? (string.IsNullOrWhiteSpace(this.Label) ? this._metadata.DisplayName : this.Label) : "");

            this.InitializeRule();

            if (this.LabelState == "S" && this.Rule != ValidRule.Default && !this.Rule.ToString().Contains("OrNull"))
            {
                var errorTag = new TagBuilder("span");

                errorTag.AddCssClass("error");
                errorTag.SetInnerText("*");

                labelTag.InnerHtml = errorTag + labelTag.InnerHtml;
            }

            return labelTag;
        }

        /// <summary>
        /// 获取表单属性。
        /// </summary>
        /// <returns>表单属性</returns>
        protected IDictionary<string, string> GetFormAttributes()
        {
            var tagBuilder = new TagBuilder("i");

            tagBuilder.AddCssClass(this.Class);
            tagBuilder.Attributes.Add("id", this._metadata.ElementId);
            tagBuilder.Attributes.Add("name", this._metadata.FullName);

            if (!string.IsNullOrWhiteSpace(this.Style))
            {
                tagBuilder.Attributes.Add("style", this.Style);
            }

            if (this.Readonly)
            {
                tagBuilder.Attributes.Add("readonly", "readonly");
            }

            if (this.Disabled)
            {
                tagBuilder.Attributes.Add("disabled", "disabled");
            }

            this.InitializeRule();

            if (this.Rule != ValidRule.Default)
            {
                var validAttributes = GetValidAttributes(this.RuleField, this.Rule);

                tagBuilder.MergeAttributes(validAttributes, true);
            }

            if (this.HtmlAttributes != null)
            {
                tagBuilder.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(this.HtmlAttributes), true);
            }

            return tagBuilder.Attributes;
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 初始化验证规则。
        /// </summary>
        private void InitializeRule()
        {
            if (this.Rule == ValidRule.Default)
            {
                var type = this._metadata.Type;
                var isRequired = this._metadata.IsRequired;

                if (type == typeof(string))
                {
                    this.Rule = isRequired ? ValidRule.NotNull : ValidRule.Default;
                }
                else if (type == typeof(int))
                {
                    this.Rule = ValidRule.Int;
                }
                else if (type == typeof(int?))
                {
                    this.Rule = ValidRule.IntOrNull;
                }
                else if (type == typeof(float) || type == typeof(double) || type == typeof(decimal))
                {
                    this.Rule = ValidRule.Double;
                }
                else if (type == typeof(float?) || type == typeof(double?) || type == typeof(decimal?))
                {
                    this.Rule = ValidRule.DoubleOrNull;
                }
                else if (type == typeof(DateTime))
                {
                    this.Rule = ValidRule.Date;
                }
                else if (type == typeof(DateTime?))
                {
                    this.Rule = ValidRule.DateOrNull;
                }
                else if (isRequired)
                {
                    this.Rule = ValidRule.NotNull;
                }
            }
        }

        #endregion
    }
}