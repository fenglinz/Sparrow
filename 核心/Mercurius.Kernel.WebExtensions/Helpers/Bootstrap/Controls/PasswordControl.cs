using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mercurius.Kernel.WebExtensions.Helpers.Bootstrap.Controls
{
    /// <summary>
    /// 密码控件。
    /// </summary>
    public class PasswordControl : TextBoxControl
    {
        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="screen">屏幕枚举</param>
        /// <param name="metadata">视图模型的属性元数据</param>
        public PasswordControl(Screen screen, PropertyMetadata metadata) : base(screen, metadata)
        {
        }

        #endregion

        #region 重写基类方法

        /// <summary>
        /// 创建表单。
        /// </summary>
        /// <returns>表单信息</returns>
        protected override TagBuilder CreateForm()
        {
            var textTag = new TagBuilder("input");

            textTag.Attributes.Add("type", "password");
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