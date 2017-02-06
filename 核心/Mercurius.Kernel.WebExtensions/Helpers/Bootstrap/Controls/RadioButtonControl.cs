using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;

namespace Mercurius.Kernel.WebCores.Helpers.Bootstrap.Controls
{
    /// <summary>
    /// 单选框控件。
    /// </summary>
    public class RadioButtonControl : FormBase
    {
        #region 字段

        /// <summary>
        /// 数据项。
        /// </summary>
        private IList<Option> _items;

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="screen">屏幕枚举</param>
        /// <param name="metadata">视图模型的属性元数据信息</param>
        public RadioButtonControl(Screen screen, PropertyMetadata metadata) : base(screen, metadata)
        {
            this.Class = "btn-group";
            this._items = new List<Option>();
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 设置按钮数据。
        /// </summary>
        /// <param name="items">数据集合</param>
        /// <returns>按钮对象</returns>
        public RadioButtonControl Datas(params string[] items)
        {
            foreach (var item in items)
            {
                this._items.Add(new Option(item, item));
            }

            return this;
        }

        /// <summary>
        /// 添加数据项。
        /// </summary>
        /// <param name="text">文本</param>
        /// <param name="value">值</param>
        /// <returns>单选框控件</returns>
        public RadioButtonControl AddItem(string text, object value = null)
        {
            this._items.Add(new Option(text, value == null ? text : Convert.ToString(value)));

            return this;
        }

        #endregion

        #region 重写基类方法

        /// <summary>
        /// 创建表单标签。
        /// </summary>
        /// <returns>表单标签</returns>
        protected override TagBuilder CreateForm()
        {
            var btnGroupTag = new TagBuilder("div");

            btnGroupTag.Attributes.Add("data-toggle", "buttons");

            var index = 0;
            var value = Convert.ToString(this._metadata.Value);

            foreach (var item in this._items)
            {
                var labelTag = new TagBuilder("label");
                var radioTag = new TagBuilder("input");

                labelTag.AddCssClass("btn btn-default");

                radioTag.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(new
                {
                    type = "radio",
                    name = this._metadata.FullName,
                    id = $"{this._metadata.ElementId}{++index}",
                    value = item.Value,
                    autocomplete = "off"
                }));

                if ((index == 1 && string.IsNullOrWhiteSpace(value)) || item.Value == value)
                {
                    labelTag.AddCssClass("active");
                    radioTag.Attributes.Add("checked", "checked");
                }

                labelTag.InnerHtml = radioTag + $" {item.Text}";
                btnGroupTag.InnerHtml += labelTag;
            }

            return btnGroupTag;
        }

        #endregion
    }
}