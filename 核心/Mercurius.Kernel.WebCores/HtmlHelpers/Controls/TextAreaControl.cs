using System.Web.Mvc;

namespace Mercurius.Kernel.WebCores.HtmlHelpers.Controls
{
    /// <summary>
    /// 文本域表单控件。
    /// </summary>
    public class TextAreaControl : FormBase
    {
        #region 字段

        /// <summary>
        /// 文本域行数。
        /// </summary>
        private uint _rows = 3;

        /// <summary>
        /// 文本域列数。
        /// </summary>
        private uint _cols;

        /// <summary>
        /// 表单允许输入字符的最小长度。
        /// </summary>
        private int? _minLength;

        /// <summary>
        /// 表单允许输入字符的最大长度。
        /// </summary>
        private int? _maxLength;

        /// <summary>
        /// 表单占位符。
        /// </summary>
        private string _placeholder;

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="screen"></param>
        /// <param name="metadata">视图模型属性元数据信息</param>
        public TextAreaControl(Screen screen, PropertyMetadata metadata) : base(screen, metadata)
        {
            this._placeholder = metadata.DisplayName;
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 设置行数。
        /// </summary>
        /// <param name="rows">行数</param>
        /// <returns>文本域表单控件</returns>
        public TextAreaControl Rows(uint rows)
        {
            this._rows = rows;

            return this;
        }

        /// <summary>
        /// 设置列数。
        /// </summary>
        /// <param name="cols">列数</param>
        /// <returns>文本域表单控件</returns>
        public TextAreaControl Cols(uint cols)
        {
            this._cols = cols;

            return this;
        }

        /// <summary>
        /// 设置最小长度。
        /// </summary>
        /// <param name="minLength">最小长度</param>
        /// <returns>文本框控件</returns>
        public TextAreaControl MinLength(int minLength)
        {
            this._minLength = minLength;

            return this;
        }

        /// <summary>
        /// 设置最大长度。
        /// </summary>
        /// <param name="maxLength">最大长度</param>
        /// <returns>文本框控件</returns>
        public TextAreaControl MaxLength(int maxLength)
        {
            this._maxLength = maxLength;

            return this;
        }

        /// <summary>
        /// 设置占位符。
        /// </summary>
        /// <param name="placeholder">占位符</param>
        /// <returns>文本框控件</returns>
        public TextAreaControl Placeholder(string placeholder)
        {
            this._placeholder = placeholder;

            return this;
        }

        #endregion

        #region 重写基类方法

        /// <summary>
        /// 创建表单。
        /// </summary>
        /// <returns>表单信息</returns>
        protected override TagBuilder CreateForm()
        {
            var textTag = new TagBuilder("textarea");

            textTag.Attributes.Add("type", "text");
            textTag.InnerHtml = this.GetValue();
            textTag.Attributes.Add("placeholder", !string.IsNullOrWhiteSpace(this._placeholder) ? this._placeholder : this.Label);

            if (this._minLength > 0)
            {
                textTag.Attributes.Add("minlength", this._minLength.Value.ToString());
            }

            if (this._maxLength > 0)
            {
                textTag.Attributes.Add("maxlength", this._maxLength.Value.ToString());
            }

            if (this._rows > 0)
            {
                textTag.Attributes.Add("rows", this._rows.ToString());
            }

            if (this._cols > 0)
            {
                textTag.Attributes.Add("cols", this._cols.ToString());
            }

            return textTag;
        }

        #endregion
    }
}