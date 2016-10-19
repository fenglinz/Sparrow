using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mercurius.Sparrow.Mvc.Extensions.Controls
{
    /// <summary>
    /// 文本域表单控件。
    /// </summary>
    public class TextAreaControl : TextBoxControl
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

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="screen"></param>
        /// <param name="metadata">视图模型属性元数据信息</param>
        public TextAreaControl(Screen screen, PropertyMetadata metadata) : base(screen, metadata)
        {
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
            this._rows = 3;

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