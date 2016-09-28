using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;

namespace Mercurius.Sparrow.Mvc.Extensions
{
    /// <summary>
    /// 
    /// </summary>
    public class RadioButton
    {
        #region 字段

        private HtmlHelper _html;

        private object _attributes;

        private IList<TextValue> _items;

        private ModelPropertyMetadata _metadata;

        #endregion

        #region 构造方法

        private RadioButton(HtmlHelper html)
        {
            this._html = html;
            this._items = new List<TextValue>();
        }

        #endregion

        internal static RadioButton Create<T,P>(HtmlHelper<T> html, Expression<Func<T, P>> expression)
        {
            return new RadioButton(html) {_metadata = html.Resolve(expression)};
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="items"></param>
        /// <returns></returns>
        public RadioButton Datas(params string[] items)
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
        public RadioButton Item(string text, object value = null)
        {
            this._items.Add(new TextValue(text, value == null ? text : Convert.ToString(value)));

            return this;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="attributes"></param>
        /// <returns></returns>
        public RadioButton Attributes(object attributes)
        {
            this._attributes = attributes;

            return this;
        }

        /// <summary>
        /// 单选按钮组。
        /// </summary>
        /// <returns></returns>
        public IHtmlString Render()
        {
            var btnGroupTag = new TagBuilder("div");

            btnGroupTag.AddCssClass("btn-group");
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

                radioTag.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(this._attributes), true);

                if ((index == 1 && string.IsNullOrWhiteSpace(value)) || item.Value == value)
                {
                    labelTag.AddCssClass("active");
                    radioTag.Attributes.Add("checked", "checked");
                }

                labelTag.InnerHtml = radioTag + $" {item.Text}";
                btnGroupTag.InnerHtml += labelTag;
            }

            return new MvcHtmlString(btnGroupTag.ToString());
        }
    }
}