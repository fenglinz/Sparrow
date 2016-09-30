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
    public class FormGroup
    {
        #region 字段

        private Screen _screen;

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

    /// <summary>
    /// 
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class FormGroup<T> : FormGroup
    {
        #region 构造方法

        /// <summary>
        /// 
        /// </summary>
        /// <param name="html"></param>
        /// <param name="screen"></param>
        public FormGroup(HtmlHelper html, Screen screen = Screen.Default) : base(html, screen)
        {
        }

        #endregion

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
            uint labelCols, uint formCols, Func<FormControl, IHtmlString> callback)
        {
            var formControl = FormControl.Create(this._html as HtmlHelper<T>, expression);

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
            uint labelCols, uint formCols, ValidRule rule = ValidRule.Default, Action<FormControl> callback = null)
        {
            var formControl = FormControl.Create(this._html as HtmlHelper<T>, expression);

            formControl.Label(labelCols).Form(formCols).Valid(rule);

            callback?.Invoke(formControl);

            this._formControls.Add(formControl.RenderTextBox());

            return this;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="expression"></param>
        /// <param name="labelCols"></param>
        /// <param name="formCols"></param>
        /// <param name="category"></param>
        /// <param name="includeAll"></param>
        /// <param name="attributes"></param>
        /// <typeparam name="P"></typeparam>
        /// <returns></returns>
        public FormGroup<T> AppendSelectFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, string category, bool includeAll = false, object attributes = null)
        {
            var html = MultipleList.Create(this._html as HtmlHelper<T>, expression).Key(category).IncludeAll(includeAll).Attributes(attributes).DropdownList();

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
            uint labelCols, uint formCols, Action<FormControl, RadioButton> callback = null)
        {
            var radioButton = RadioButton.Create(this._html as HtmlHelper<T>, expression);
            var formControl = FormControl.Create(this._html as HtmlHelper<T>, expression);

            formControl.Label(labelCols).Form(formCols);
            callback?.Invoke(formControl, radioButton);

            this._formControls.Add(formControl.Render(p => radioButton.Render()));

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
        /// <param name="formControlPart"></param>
        /// <returns></returns>
        public IHtmlString RenderFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Func<PropertyMetadata, object> formControlPart, Action<FormControl> callback = null)
        {
            return this.Add(expression, labelCols, formCols, form =>
            {
                callback?.Invoke(form);

                return form.Render(formControlPart);
            }).Render();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="P"></typeparam>
        /// <param name="expression"></param>
        /// <param name="labelCols"></param>
        /// <param name="formCols"></param>
        /// <param name="rule"></param>
        /// <param name="callback"></param>
        /// <returns></returns>
        public IHtmlString TextBoxFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, ValidRule rule = ValidRule.Default, Action<FormControl> callback = null)
        {
            return this.AppendTextBoxFor(expression, labelCols, formCols, rule, callback).Render();
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
            uint labelCols, uint formCols, Action<FormControl> callback = null)
        {
            return this.Add(expression, labelCols, formCols, form =>
            {
                callback?.Invoke(form);

                return form.RenderTextArea();
            }).Render();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="P"></typeparam>
        /// <param name="expression"></param>
        /// <param name="labelCols"></param>
        /// <param name="formCols"></param>
        /// <param name="category"></param>
        /// <param name="includeAll"></param>
        /// <param name="attributes"></param>
        /// <returns></returns>
        public IHtmlString SelectFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, string category, bool includeAll = false, object attributes = null)
        {
            return this.AppendSelectFor(expression, labelCols, formCols, category, includeAll, attributes).Render();
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
        public IHtmlString RadiosFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Action<FormControl, RadioButton> callback = null)
        {
            return this.AppendRadiosFor(expression, labelCols, formCols, callback).Render();
        }
    }
}