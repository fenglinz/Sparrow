using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using static Mercurius.Sparrow.Mvc.Extensions.ValidationExtensions;

namespace Mercurius.Sparrow.Mvc.Extensions.Controls
{
    /// <summary>
    /// 表单基类。
    /// </summary>
    public abstract class FormBase
    {
        #region 字段

        /// <summary>
        /// 屏幕枚举。
        /// </summary>
        private Screen _screen;

        /// <summary>
        /// 标签。
        /// </summary>
        private string _label;

        /// <summary>
        /// 标签宽度。
        /// </summary>
        private uint _labelCols;

        /// <summary>
        /// 标签的内联样式。
        /// </summary>
        private string _labelStyle;

        /// <summary>
        /// 标签状态。
        /// </summary>
        private string _labelState = "S";

        /// <summary>
        /// 表单宽度。
        /// </summary>
        private uint _cols;

        /// <summary>
        /// 表单内联样式。
        /// </summary>
        private string _style;

        /// <summary>
        /// 是否为只读。
        /// </summary>
        private bool _readonly;

        /// <summary>
        /// 是否禁用。
        /// </summary>
        private bool _disabled;

        /// <summary>
        /// 属性。
        /// </summary>
        private object _htmlAttributes;

        /// <summary>
        /// 验证字段名称。
        /// </summary>
        private string _ruleField;

        /// <summary>
        /// 格式化字符串。
        /// </summary>
        private string _formatString;

        /// <summary>
        /// 验证规则。
        /// </summary>
        private ValidRule _rule = ValidRule.Default;

        #endregion

        /// <summary>
        /// css样式类名称。
        /// </summary>
        protected string _class;

        /// <summary>
        /// 视图模型属性元数据信息。
        /// </summary>
        protected PropertyMetadata _metadata;

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="screen">屏幕类型</param>
        /// <param name="metadata">视图模型属性元数据</param>
        protected FormBase(Screen screen, PropertyMetadata metadata)
        {
            this._screen = screen;
            this._metadata = metadata;
            this._class = "form-control";
            this._label = metadata.DisplayName;
            this._ruleField = metadata.DisplayName;
        }

        #endregion

        #region 基本设置

        /// <summary>
        /// 设置表单的布局。
        /// </summary>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <returns></returns>
        public FormBase Layout(uint labelCols, uint formCols)
        {
            this._cols = formCols;
            this._labelCols = labelCols;

            return this;
        }

        /// <summary>
        /// 设置标签显示内容。
        /// </summary>
        /// <param name="label">标签显示内容</param>
        /// <returns>表单控件</returns>
        public FormBase Label(string label)
        {
            this._label = label;

            return this;
        }

        /// <summary>
        /// 设置标签的内联样式。
        /// </summary>
        /// <param name="style">内联样式</param>
        /// <returns>表单控件</returns>
        public FormBase LabelStyle(string style)
        {
            this._labelStyle = style;

            return this;
        }

        /// <summary>
        /// 隐藏标签。
        /// </summary>
        /// <returns>表单控件</returns>
        public FormBase HideLabel()
        {
            this._labelState = "H";

            return this;
        }

        /// <summary>
        /// 删除标签。
        /// </summary>
        /// <returns>表单控件</returns>
        public FormBase RemoveLabel()
        {
            this._labelState = "R";

            return this;
        }

        /// <summary>
        /// 设置表单的css样式类名称。
        /// </summary>
        /// <param name="class">css类名称</param>
        /// <returns>表单控件</returns>
        public FormBase Class(string @class)
        {
            this._class = @class;

            return this;
        }

        /// <summary>
        /// 设置表单的内联样式。
        /// </summary>
        /// <param name="style">内联样式</param>
        /// <returns>表单控件</returns>
        public FormBase Style(string style)
        {
            this._style = style;

            return this;
        }

        /// <summary>
        /// 设置表单值的显示格式。
        /// </summary>
        /// <param name="format">格式话字符串</param>
        /// <returns>表单控件</returns>
        public FormBase Format(string format)
        {
            this._formatString = format;

            return this;
        }

        /// <summary>
        /// 设置表单是否为只读。
        /// </summary>
        /// <param name="readonly">是否为只读</param>
        /// <returns>表单控件</returns>
        public FormBase Readonly(bool @readonly = true)
        {
            this._readonly = @readonly;

            return this;
        }

        /// <summary>
        /// 设置表单是否为禁用。
        /// </summary>
        /// <param name="disabled">是否禁用</param>
        /// <returns>表单控件</returns>
        public FormBase Disabled(bool disabled = true)
        {
            this._disabled = disabled;

            return this;
        }

        /// <summary>
        /// 设置表单的验证规则。
        /// </summary>
        /// <param name="rule">验证规则</param>
        /// <param name="field">验证字段名称</param>
        /// <returns>表单控件</returns>
        public FormBase Valid(ValidRule rule, string field = null)
        {
            this._rule = rule;
            this._ruleField = field;

            return this;
        }

        /// <summary>
        /// 设置表单宽度。
        /// </summary>
        /// <param name="attributes">表单属性</param>
        /// <returns>表单控件</returns>
        public FormBase Form(object attributes)
        {
            this._htmlAttributes = attributes;

            return this;
        }

        #endregion

        /// <summary>
        /// 控件呈现。
        /// </summary>
        /// <returns>Html片段</returns>
        public IHtmlString Render()
        {
            var container = new TagBuilder("div");
            var label = this.CreateLabel();
            var form = this.CreateForm();

            form.MergeAttributes(this.GetFormAttributes(), true);

            container.InnerHtml += label;

            if (this._cols > 0)
            {
                var formContainer = new TagBuilder("div");

                formContainer.AddCssClass($"col-{this._screen.ToString().ToLower()}-{this._cols}");

                formContainer.InnerHtml += form;
                container.InnerHtml += formContainer;
            }
            else
            {
                container.InnerHtml += form;
            }

            return new MvcHtmlString(container.InnerHtml);
        }

        /// <summary>
        /// 控件呈现。
        /// </summary>
        /// <returns>Html片段</returns>
        protected abstract TagBuilder CreateForm();

        #region 受保护方法

        /// <summary>
        /// 获取表单值。
        /// </summary>
        /// <returns></returns>
        protected string GetValue()
        {
            if (string.IsNullOrWhiteSpace(this._formatString))
            {
                return Convert.ToString(this._metadata.Value);
            }
            else
            {
                return string.Format(this._formatString, this._metadata.Value);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        protected TagBuilder CreateLabel()
        {
            if (this._labelState == "R")
            {
                return null;
            }

            var labelTag = new TagBuilder("label");

            if (this._labelCols > 0)
            {
                var labelCssClass = $"col-{this._screen.ToString().ToLower()}-{this._labelCols}";

                labelTag.AddCssClass(labelCssClass);
            }

            labelTag.AddCssClass("control-label");
            labelTag.Attributes.Add("for", this._metadata.ElementId);
            labelTag.Attributes.Add("style", this._labelStyle);
            labelTag.SetInnerText(this._labelState == "S" ? (string.IsNullOrWhiteSpace(this._label) ? this._metadata.DisplayName : this._label) : "");

            this.InitializeRule();

            if (this._labelState == "S" && this._rule != ValidRule.Default && !this._rule.ToString().Contains("OrNull"))
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

            tagBuilder.AddCssClass(this._class);
            tagBuilder.Attributes.Add("id", this._metadata.ElementId);
            tagBuilder.Attributes.Add("name", this._metadata.FullName);

            if (!string.IsNullOrWhiteSpace(this._style))
            {
                tagBuilder.Attributes.Add("style", this._style);
            }

            if (this._readonly)
            {
                tagBuilder.Attributes.Add("readonly", "readonly");
            }

            if (this._disabled)
            {
                tagBuilder.Attributes.Add("disabled", "disabled");
            }

            this.InitializeRule();

            if (this._rule != ValidRule.Default)
            {
                var validAttributes = GetValidAttributes(this._ruleField, this._rule);

                tagBuilder.MergeAttributes(validAttributes, true);
            }

            if (this._htmlAttributes != null)
            {
                tagBuilder.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(this._htmlAttributes), true);
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
            if (this._rule == ValidRule.Default)
            {
                var type = this._metadata.Type;
                var isRequired = this._metadata.IsRequired;

                if (type == typeof(string))
                {
                    this._rule = isRequired ? ValidRule.NotNull : ValidRule.Default;
                }
                else if (type == typeof(int))
                {
                    this._rule = ValidRule.Int;
                }
                else if (type == typeof(int?))
                {
                    this._rule = ValidRule.IntOrNull;
                }
                else if (type == typeof(float) || type == typeof(double) || type == typeof(decimal))
                {
                    this._rule = ValidRule.Double;
                }
                else if (type == typeof(float?) || type == typeof(double?) || type == typeof(decimal?))
                {
                    this._rule = ValidRule.DoubleOrNull;
                }
                else if (type == typeof(DateTime))
                {
                    this._rule = ValidRule.Date;
                }
                else if (type == typeof(DateTime?))
                {
                    this._rule = ValidRule.DateOrNull;
                }
                else if (isRequired)
                {
                    this._rule = ValidRule.NotNull;
                }
            }
        }

        #endregion
    }
}