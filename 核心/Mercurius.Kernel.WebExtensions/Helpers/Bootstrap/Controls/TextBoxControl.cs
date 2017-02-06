using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.WebPages;

namespace Mercurius.Kernel.WebCores.Helpers.Bootstrap.Controls
{
    /// <summary>
    /// 文本框控件。
    /// </summary>
    public class TextBoxControl : FormBase
    {
        #region 字段

        /// <summary>
        /// 表单附加信息。
        /// </summary>
        protected TagBuilder _addOn;

        /// <summary>
        /// 表单允许输入字符的最小长度。
        /// </summary>
        protected int? _minLength;

        /// <summary>
        /// 表单允许输入字符的最大长度。
        /// </summary>
        protected int? _maxLength;

        /// <summary>
        /// 表单占位符。
        /// </summary>
        protected string _placeholder;

        #endregion

        #region 构造方法

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        /// <param name="screen"></param>
        /// <param name="metadata"></param>
        public TextBoxControl(Screen screen, PropertyMetadata metadata) : base(screen, metadata)
        {
            this._placeholder = metadata.DisplayName;
        }

        #endregion

        #region 基本设置

        /// <summary>
        /// 设置最小长度。
        /// </summary>
        /// <param name="minLength">最小长度</param>
        /// <returns>文本框控件</returns>
        public TextBoxControl MinLength(int minLength)
        {
            this._minLength = minLength;

            return this;
        }

        /// <summary>
        /// 设置最大长度。
        /// </summary>
        /// <param name="maxLength">最大长度</param>
        /// <returns>文本框控件</returns>
        public TextBoxControl MaxLength(int maxLength)
        {
            this._maxLength = maxLength;

            return this;
        }

        /// <summary>
        /// 设置占位符。
        /// </summary>
        /// <param name="placeholder">占位符</param>
        /// <returns>文本框控件</returns>
        public TextBoxControl Placeholder(string placeholder)
        {
            this._placeholder = placeholder;

            return this;
        }

        /// <summary>
        /// 表单的附属标签。
        /// </summary>
        /// <param name="text">标签文字</param>
        /// <returns>表单控件</returns>
        public TextBoxControl AddOn(string text)
        {
            this._addOn = new TagBuilder("div");
            this._addOn.SetInnerText(text);
            this._addOn.AddCssClass("input-group-addon");

            return this;
        }

        /// <summary>
        /// 表单附属标签。
        /// </summary>
        /// <param name="buttonPart">按钮设置区域</param>
        /// <returns>表单控件</returns>
        public TextBoxControl AddOn(Func<PropertyMetadata, object> buttonPart)
        {
            var helperResult = new HelperResult(writer => writer.Write(buttonPart(this._metadata)));

            this._addOn = new TagBuilder("div");
            this._addOn.AddCssClass("input-group-btn");
            this._addOn.InnerHtml = helperResult.ToHtmlString();

            return this;
        }

        #endregion

        #region 重写基类方法

        /// <summary>
        /// 控件呈现。
        /// </summary>
        /// <returns>Html片段</returns>
        public override IHtmlString Render()
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

                if (!string.IsNullOrWhiteSpace(this._addOn?.InnerHtml))
                {
                    var addOnTag = new TagBuilder("div");

                    addOnTag.AddCssClass("input-group");

                    addOnTag.InnerHtml += form;
                    addOnTag.InnerHtml += this._addOn;

                    formContainer.InnerHtml += addOnTag;

                    container.InnerHtml += formContainer;
                }
                else
                {
                    formContainer.InnerHtml += form;
                    container.InnerHtml += formContainer;
                }
            }
            else
            {
                if (!string.IsNullOrWhiteSpace(this._addOn?.InnerHtml))
                {
                    var addOnTag = new TagBuilder("div");

                    addOnTag.AddCssClass("input-group");

                    addOnTag.InnerHtml += form;
                    addOnTag.InnerHtml += this._addOn;

                    container.InnerHtml += addOnTag;
                }
                else
                {
                    container.InnerHtml += form;
                }
            }

            return new MvcHtmlString(container.InnerHtml);
        }

        /// <summary>
        /// 创建表单。
        /// </summary>
        /// <returns>表单信息</returns>
        protected override TagBuilder CreateForm()
        {
            var textTag = new TagBuilder("input");

            textTag.Attributes.Add("type", "text");
            textTag.Attributes.Add("value", this.GetValue());
            textTag.Attributes.Add("placeholder", !string.IsNullOrWhiteSpace(this._placeholder) ? this._placeholder : this.Label);

            if (this._minLength > 0)
            {
                textTag.Attributes.Add("minlength", this._minLength.Value.ToString());
            }

            if (this._maxLength > 0)
            {
                textTag.Attributes.Add("maxlength", this._maxLength.Value.ToString());
            }

            return textTag;
        }

        #endregion
    }
}