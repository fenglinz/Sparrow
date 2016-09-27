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

        #region 添加项

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

            this._formControls.Add(callback?.Invoke(formControl));

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
        public FormGroup<T> AppendTextBoxFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, ValidRule rule = ValidRule.Default, Action<FormControl<T>> callback = null)
        {
            var formControl = FormControl<T>.Create(this._html, expression);

            formControl.Label(labelCols).Form(formCols).Valid(rule);

            callback?.Invoke(formControl);

            this._formControls.Add(formControl.RenderTextBox());

            return this;
        }

        public FormGroup<T> AppendDropdownListFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, string category, bool includeAll = false, object attributes = null)
        {
            var html = this._html.CreateDropdownListFor(expression, category, false, attributes);

            this.Add(expression, labelCols, formCols, form => form.Render(p => html));

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
        public FormGroup<T> AppendRadiosFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Action<FormControl<T>, RadioButton<T>> callback = null)
        {
            var radioButton = RadioButton<T>.Create(this._html, expression);
            var formControl = FormControl<T>.Create(this._html, expression);

            formControl.Label(labelCols).Form(formCols);
            callback?.Invoke(formControl, radioButton);

            this._formControls.Add(formControl.Render(p => radioButton.Render()));

            return this;
        }

        #endregion

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
            uint labelCols, uint formCols, ValidRule rule = ValidRule.Default, Action<FormControl<T>> callback = null)
        {
            return this.AppendTextBoxFor(expression, labelCols, formCols, rule, callback).Render();
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

        public IHtmlString DropdownListFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, string category, bool includeAll = false, object attributes = null)
        {
            return this.AppendDropdownListFor(expression, labelCols, formCols, category, includeAll, attributes).Render();
        }

        public IHtmlString RadiosFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Action<FormControl<T>, RadioButton<T>> callback = null)
        {
            return this.AppendRadiosFor(expression, labelCols, formCols, callback).Render();
        }

        #endregion
    }
}