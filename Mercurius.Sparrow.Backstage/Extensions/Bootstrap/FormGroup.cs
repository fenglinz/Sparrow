using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;

namespace Mercurius.Sparrow.Mvc.Extensions
{

    /// <summary>
    /// 表单组。
    /// </summary>
    public class FormGroup<T>
    {
        #region 字段

        private HtmlHelper<T> _html;

        private IList<FormControl<T, P>> _formControls;

        #endregion

        #region 属性

        /// <summary>
        /// 表单组类型。
        /// </summary>
        internal string Type { get; private set; }

        #endregion

        /// <summary>
        /// 
        /// </summary>
        /// <param name="html"></param>
        public FormGroup(HtmlHelper<T> html)
        {
            this._html = html;
            this._formControls = new List<FormControl<T, P>>();
        }

        #region 公开方法

        public FormGroup<T> Add<P>(Expression<Func<T, P>> expression, Action<FormControl<T, P>> callback)
        {
            var formControl = new FormControl<T, P>(this._html, expression);

            callback(formControl);

            this._formControls.Add(formControl);

            return this;
        }

        public IHtmlString Render()
        {
            var divTag = new TagBuilder("div");

            divTag.AddCssClass("form-group");

            foreach (var item in this._formControls)
            {
                divTag.InnerHtml += item.RenderTextBox();
            }

            return new MvcHtmlString(divTag.ToString());
        }

        #endregion
    }

}