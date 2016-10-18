using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mercurius.Sparrow.Mvc.Extensions.Controls
{
    /// <summary>
    /// 文本框控制器。
    /// </summary>
    public class TextBoxControl : FormBase
    {
        #region 字段

        private TagBuilder _addOn;

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

        #region 公开方法

        public TextBoxControl MinLength(int minLength)
        {
            this._minLength = minLength;

            return this;
        }

        public TextBoxControl MaxLength(int maxLength)
        {
            this._maxLength = maxLength;

            return this;
        }

        public TextBoxControl Placeholder(string placeholder)
        {
            this._placeholder = placeholder;

            return this;
        }

        #endregion

        /// <summary>
        /// 文本框呈现。
        /// </summary>
        /// <returns>Html片段</returns>
        protected override TagBuilder CreateForm()
        {
            var textTag = new TagBuilder("input");

            textTag.Attributes.Add("type", "text");
            textTag.Attributes.Add("value", this.GetValue());
            textTag.Attributes.Add("placeholder", this._placeholder);

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
    }
}