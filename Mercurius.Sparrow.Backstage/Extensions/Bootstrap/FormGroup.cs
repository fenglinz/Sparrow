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

        private Screen _screen;

        private HtmlHelper<T> _html;

        private IList<IHtmlString> _formControls;

        #endregion

        #region 构造方法

        /// <summary>
        /// 
        /// </summary>
        /// <param name="html"></param>
        /// <param name="screen"></param>
        internal FormGroup(HtmlHelper<T> html, Screen screen = Screen.Default)
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
        /// <param name="expression"></param>
        /// <param name="labelCols"></param>
        /// <param name="formCols"></param>
        /// <param name="callback"></param>
        /// <returns></returns>
        public FormGroup<T> Add<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Func<FormControl<T>, IHtmlString> callback)
        {
            var formControl = FormControl<T>.Create(this._html, expression);

            formControl.Label(labelCols).Form(formCols);

            this._formControls.Add(callback(formControl));

            return this;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="expression"></param>
        /// <param name="labelCols"></param>
        /// <param name="formCols"></param>
        /// <param name="callback"></param>
        /// <returns></returns>
        public FormGroup<T> Add<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Func<RadioButton<T>, IHtmlString> callback)
        {
            var radioButton = RadioButton<T>.Create(this._html, expression);
            var formControl = FormControl<T>.Create(this._html, expression);

            formControl.Label(labelCols).Form(formCols);
            callback(radioButton);

            this._formControls.Add(formControl.Render(p => radioButton.Render()));

            return this;
        }

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

        public IHtmlString RenderFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Func<ModelPropertyMetadata, object> formControlPart)
        {
            return this.Add(expression, labelCols, formCols, form => form.Render(formControlPart)).Render();
        }

        public IHtmlString TextBoxFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Action<FormControl<T>> callback = null)
        {
            return this.Add(expression, labelCols, formCols, form =>
            {
                callback?.Invoke(form);

                return form.RenderTextBox();
            }).Render();
        }

        public IHtmlString TextAreaFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Action<FormControl<T>> callback = null)
        {
            return this.Add(expression, labelCols, formCols, form =>
            {
                callback?.Invoke(form);

                return form.RenderTextArea();
            }).Render();
        }

        public IHtmlString RadiosFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Action<RadioButton<T>> callback=null)
        {
            return this.Add(expression, labelCols, formCols, form =>
            {
                callback?.Invoke(form);

                return form.Render();
            }).Render();
        }

        #endregion
    }

}