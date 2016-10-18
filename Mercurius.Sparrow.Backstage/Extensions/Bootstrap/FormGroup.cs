using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;
using Mercurius.Sparrow.Mvc.Extensions.Controls;

namespace Mercurius.Sparrow.Mvc.Extensions
{
    /// <summary>
    /// 表单组。
    /// </summary>
    public class FormGroup
    {
        #region 字段

        protected Screen _screen;

        protected HtmlHelper _html;

        protected IList<IHtmlString> _formControls;

        #endregion

        #region 构造方法

        /// <summary>
        /// 
        /// </summary>
        /// <param name="html"></param>
        /// <param name="screen"></param>
        internal FormGroup(HtmlHelper html, Screen screen = Screen.Default)
        {
            this._html = html;
            this._screen = screen;
            this._formControls = new List<IHtmlString>();
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IHtmlString Render()
        {
            var divTag = new TagBuilder("div");

            divTag.AddCssClass($"form-group{(this._screen > 0 ? $" form-group-{this._screen.ToString().ToLower()}" : "")}");

            foreach (var item in this._formControls)
            {
                divTag.InnerHtml += item;
            }

            return new MvcHtmlString(divTag.ToString());
        }

        #endregion
    }

    public class FormGroup<T> : FormGroup
    {
        public FormGroup(HtmlHelper html, Screen screen = Screen.Default) : base(html, screen)
        {
        }

        #region 添加项

        /// <summary>
        /// 
        /// </summary>
        /// <param name="expression"></param>
        /// <param name="labelCols"></param>
        /// <param name="formCols"></param>
        /// <param name="callback"></param>
        /// <returns></returns>
        public FormGroup<T> AppendTextBoxFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Action<TextBoxControl> callback = null)
        {
            var metadata = (this._html as HtmlHelper<T>).Resolve(expression);
            var control = new TextBoxControl(this._screen, metadata);

            control.Layout(labelCols, formCols);

            callback?.Invoke(control);

            this._formControls.Add(control.Render());

            return this;
        }

        public FormGroup<T> AppendRadiosFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Action<RadioButtonControl> callback = null)
        {
            var metadata = (this._html as HtmlHelper<T>).Resolve(expression);
            var control = new RadioButtonControl(this._screen, metadata);

            control.Layout(labelCols, formCols);

            callback?.Invoke(control);

            this._formControls.Add(control.Render());

            return this;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="P"></typeparam>
        /// <param name="expression"></param>
        /// <param name="labelCols"></param>
        /// <param name="formCols"></param>
        /// <param name="callback"></param>
        /// <returns></returns>
        public FormGroup<T> AppendDropdownListFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Action<MultipleListControl> callback = null)
        {
            var metadata = (this._html as HtmlHelper<T>).Resolve(expression);
            var control = new MultipleListControl(this._screen, metadata);

            control.Layout(labelCols, formCols);

            callback?.Invoke(control);

            this._formControls.Add(control.Render());

            return this;
        }

        public FormGroup<T> AppendFormPartFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Func<PropertyMetadata, object> part, Action<FormBase> callback = null)
        {
            var metadata = (this._html as HtmlHelper<T>).Resolve(expression);
            var control = new CustomControl(this._screen, metadata);

            control.FormPart(part).Layout(labelCols, formCols);

            callback?.Invoke(control);

            this._formControls.Add(control.Render());

            return this;
        }

        #endregion

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="P"></typeparam>
        /// <param name="expression"></param>
        /// <param name="labelCols"></param>
        /// <param name="formCols"></param>
        /// <param name="callback"></param>
        /// <returns></returns>
        public IHtmlString TextBoxFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Action<TextBoxControl> callback = null)
        {
            return this.AppendTextBoxFor(expression, labelCols, formCols, callback).Render();
        }

        public IHtmlString RadiosFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Action<RadioButtonControl> callback = null)
        {
            return this.AppendRadiosFor(expression, labelCols, formCols, callback).Render();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="P"></typeparam>
        /// <param name="expression"></param>
        /// <param name="labelCols"></param>
        /// <param name="formCols"></param>
        /// <param name="callback"></param>
        /// <returns></returns>
        public IHtmlString DropdownListFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Action<MultipleListControl> callback = null)
        {
            return this.AppendDropdownListFor(expression, labelCols, formCols, callback).Render();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="P"></typeparam>
        /// <param name="expression"></param>
        /// <param name="labelCols"></param>
        /// <param name="formCols"></param>
        /// <param name="callback"></param>
        /// <returns></returns>
        public IHtmlString TextAreaFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Action<TextAreaControl> callback = null)
        {
            var metadata = (this._html as HtmlHelper<T>).Resolve(expression);
            var control = new TextAreaControl(this._screen, metadata);

            control.Layout(labelCols, formCols);

            callback?.Invoke(control);

            this._formControls.Add(control.Render());

            return this.Render();
        }

        public IHtmlString FormPartFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Func<PropertyMetadata, object> part, Action<FormBase> callback = null)
        {
            return this.AppendFormPartFor(expression, labelCols, formCols, part, callback).Render();
        }
    }
}