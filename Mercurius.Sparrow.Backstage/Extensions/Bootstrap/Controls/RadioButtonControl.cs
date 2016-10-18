using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;

namespace Mercurius.Sparrow.Mvc.Extensions.Controls
{
    /// <summary>
    /// 
    /// </summary>
    public class RadioButtonControl : FormBase
    {
        #region 字段

        private IList<TextValue> _items;

        #endregion

        #region 构造方法

        public RadioButtonControl(Screen screen, PropertyMetadata metadata) : base(screen, metadata)
        {
            this._class = "btn-group";
            this._items = new List<TextValue>();
        }

        #endregion

        /// <summary>
        /// 
        /// </summary>
        /// <param name="items"></param>
        /// <returns></returns>
        public RadioButtonControl Datas(params string[] items)
        {
            foreach (var item in items)
            {
                this._items.Add(new TextValue(item, item));
            }

            return this;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="text"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        public RadioButtonControl Item(string text, object value = null)
        {
            this._items.Add(new TextValue(text, value == null ? text : Convert.ToString(value)));

            return this;
        }

        /// <summary>
        /// 单选按钮组。
        /// </summary>
        /// <returns></returns>
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
    }
}