using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;
using Mercurius.Kernel.WebExtensions.Helpers.Bootstrap.Controls;

namespace Mercurius.Kernel.WebExtensions.Helpers.Bootstrap
{
    /// <summary>
    /// 表单组。
    /// </summary>
    public class FormGroup
    {
        #region 字段

        /// <summary>
        /// 屏幕枚举。
        /// </summary>
        protected Screen _screen;

        /// <summary>
        /// Html助手对象。
        /// </summary>
        protected HtmlHelper _html;

        /// <summary>
        /// 表单组的控件集合。
        /// </summary>
        protected IList<IHtmlString> _formControls;

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="html">Html助手对象</param>
        /// <param name="screen">屏幕枚举</param>
        internal FormGroup(HtmlHelper html, Screen screen = Screen.Default)
        {
            this._html = html;
            this._screen = screen;
            this._formControls = new List<IHtmlString>();
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 呈现表单组。
        /// </summary>
        /// <returns>Html片段</returns>
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

        #region 添加表单项

        /// <summary>
        /// 追加文本框。
        /// </summary>
        /// <param name="fullName">属性名称</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="callback">表单设置回调</param>
        /// <returns>表单组</returns>
        public FormGroup AppendTextBox(string fullName,
            uint labelCols, uint formCols, Action<TextBoxControl> callback = null)
        {
            return this.AppendTextBox(fullName, labelCols, formCols, ValidRule.Default, callback);
        }

        /// <summary>
        /// 追加文本框。
        /// </summary>
        /// <param name="fullName">属性名称</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="rule">验证规则</param>
        /// <param name="callback">表单设置回调</param>
        /// <returns>表单组</returns>
        public FormGroup AppendTextBox(string fullName,
            uint labelCols, uint formCols, ValidRule rule, Action<TextBoxControl> callback = null)
        {
            var metadata = this._html.Resolve(fullName);
            var control = new TextBoxControl(this._screen, metadata).Valid(rule);

            control.Layout(labelCols, formCols);

            callback?.Invoke(control);

            this._formControls.Add(control.Render());

            return this;
        }

        /// <summary>
        /// 追加按钮。
        /// </summary>
        /// <param name="fullName">元素名称</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="callback">表单设置回调</param>
        /// <returns>表单组</returns>
        public FormGroup AppendPassword(string fullName,
            uint labelCols, uint formCols, Action<PasswordControl> callback = null)
        {
            return this.AppendPassword(fullName, labelCols, formCols, ValidRule.Default, callback);
        }

        /// <summary>
        /// 追加按钮。
        /// </summary>
        /// <param name="fullName">元素名称</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="rule">验证规则</param>
        /// <param name="callback">表单设置回调</param>
        /// <returns>表单组</returns>
        public FormGroup AppendPassword(string fullName,
            uint labelCols, uint formCols, ValidRule rule, Action<PasswordControl> callback = null)
        {
            var metadata = this._html.Resolve(fullName);
            var control = new PasswordControl(this._screen, metadata);
            
            control.Layout(labelCols, formCols).Valid(rule);

            callback?.Invoke(control);

            this._formControls.Add(control.Render());

            return this;
        }

        /// <summary>
        /// 追加单选框组。
        /// </summary>
        /// <param name="fullName">属性名称</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="callback">表单设置回调</param>
        /// <returns>表单组</returns>
        public FormGroup AppendRadios(string fullName,
            uint labelCols, uint formCols, Action<RadioButtonControl> callback = null)
        {
            var metadata = this._html.Resolve(fullName);
            var control = new RadioButtonControl(this._screen, metadata);

            control.Layout(labelCols, formCols);

            callback?.Invoke(control);

            this._formControls.Add(control.Render());

            return this;
        }

        /// <summary>
        /// 追加下拉列表框。
        /// </summary>
        /// <param name="fullName">属性名称</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="callback">表单设置回调</param>
        /// <returns>表单组</returns>
        public FormGroup AppendMultipleList(string fullName,
            uint labelCols, uint formCols, Action<MultipleListControl> callback = null)
        {
            return this.AppendMultipleList(fullName, labelCols, formCols, null, ValidRule.Default, callback);
        }

        /// <summary>
        /// 追加下拉列表框。
        /// </summary>
        /// <param name="fullName">属性名称</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="key">字典键</param>
        /// <param name="callback">表单设置回调</param>
        /// <returns>表单组</returns>
        public FormGroup AppendMultipleList(string fullName,
            uint labelCols, uint formCols, string key, Action<MultipleListControl> callback = null)
        {
            return this.AppendMultipleList(fullName, labelCols, formCols, key, ValidRule.Default, callback);
        }

        /// <summary>
        /// 追加下拉列表框。
        /// </summary>
        /// <param name="fullName">属性名称</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="key">字典键</param>
        /// <param name="rule">验证规则</param>
        /// <param name="callback">表单设置回调</param>
        /// <returns>表单组</returns>
        public FormGroup AppendMultipleList(string fullName,
            uint labelCols, uint formCols, string key, ValidRule rule, Action<MultipleListControl> callback = null)
        {
            var metadata = this._html.Resolve(fullName);
            var control = new MultipleListControl(this._screen, metadata);

            control.Layout(labelCols, formCols).Key(key).Valid(rule);

            callback?.Invoke(control);

            this._formControls.Add(control.Render());

            return this;
        }

        /// <summary>
        /// 追加自定义表单。
        /// </summary>
        /// <param name="fullName">属性名称</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="part">自定义表单区域</param>
        /// <param name="callback">表单设置回调</param>
        /// <returns>表单组</returns>
        public FormGroup AppendFormPart(string fullName,
            uint labelCols, uint formCols, Func<PropertyMetadata, object> part, Action<FormBase> callback = null)
        {
            var metadata = this._html.Resolve(fullName);
            var control = new CustomControl(this._screen, metadata);

            control.FormPart(part).Layout(labelCols, formCols);

            callback?.Invoke(control);

            this._formControls.Add(control.Render());

            return this;
        }

        #endregion

        #region 生成表单组

        /// <summary>
        /// 生成只包含文本框的表单组。
        /// </summary>
        /// <param name="fullName">属性名称</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="callback">表单设置回调</param>
        /// <returns>Html片段</returns>
        public IHtmlString TextBox(string fullName,
            uint labelCols, uint formCols, Action<TextBoxControl> callback = null)
        {
            return this.AppendTextBox(fullName, labelCols, formCols, callback).Render();
        }

        /// <summary>
        /// 生成只包含文本框的表单组。
        /// </summary>
        /// <param name="fullName">属性名称</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="rule">验证规则</param>
        /// <param name="callback">表单设置回调</param>
        /// <returns>Html片段</returns>
        public IHtmlString TextBox(string fullName,
            uint labelCols, uint formCols, ValidRule rule, Action<TextBoxControl> callback = null)
        {
            return this.AppendTextBox(fullName, labelCols, formCols, rule, callback).Render();
        }

        /// <summary>
        /// 生成只包含密码框的表单组。
        /// </summary>
        /// <param name="fullName">元素名称</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="callback">表单设置回调</param>
        /// <returns>Html片段</returns>
        public IHtmlString Password(string fullName,
            uint labelCols, uint formCols, Action<PasswordControl> callback = null)
        {
            return this.AppendPassword(fullName, labelCols, formCols, callback).Render();
        }

        /// <summary>
        /// 生成只包含密码框的表单组。
        /// </summary>
        /// <param name="fullName">元素名称</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="rule">验证规则</param>
        /// <param name="callback">表单设置回调</param>
        /// <returns>Html片段</returns>
        public IHtmlString Password(string fullName,
            uint labelCols, uint formCols, ValidRule rule, Action<PasswordControl> callback = null)
        {
            return this.AppendPassword(fullName, labelCols, formCols, rule, callback).Render();
        }
        /// <summary>
        /// 生成只包含文本域的表单组。
        /// </summary>
        /// <param name="fullName">属性名称</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="callback">表单设置回调</param>
        /// <returns>Html片段</returns>
        public IHtmlString TextArea(string fullName,
            uint labelCols, uint formCols, Action<TextAreaControl> callback = null)
        {
            var metadata = this._html.Resolve(fullName);
            var control = new TextAreaControl(this._screen, metadata);

            control.Layout(labelCols, formCols);

            callback?.Invoke(control);

            this._formControls.Add(control.Render());

            return this.Render();
        }

        /// <summary>
        /// 生成只包含单选组的表单组。
        /// </summary>
        /// <param name="fullName">属性名称</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="callback">表单设置回调</param>
        /// <returns>Html片段</returns>
        public IHtmlString Radios(string fullName,
            uint labelCols, uint formCols, Action<RadioButtonControl> callback = null)
        {
            return this.AppendRadios(fullName, labelCols, formCols, callback).Render();
        }

        /// <summary>
        /// 生成只包含下拉列表的表单组。
        /// </summary>
        /// <param name="fullName">属性名称</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="key">字典键</param>
        /// <param name="callback">表单设置回调</param>
        /// <returns>Html片段</returns>
        public IHtmlString MultipleList(string fullName,
            uint labelCols, uint formCols, string key, Action<MultipleListControl> callback = null)
        {
            return this.AppendMultipleList(fullName, labelCols, formCols, key, callback).Render();
        }

        /// <summary>
        /// 生成只包含自定义表单的表单组。
        /// </summary>
        /// <param name="fullName">属性名称</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="part">自定义表单区域设置回调</param>
        /// <param name="callback">表单设置回调</param>
        /// <returns>Html片段</returns>
        public IHtmlString FormPart(string fullName,
            uint labelCols, uint formCols, Func<PropertyMetadata, object> part, Action<FormBase> callback = null)
        {
            return this.AppendFormPart(fullName, labelCols, formCols, part, callback).Render();
        }

        #endregion
    }

    /// <summary>
    /// 强类型表单组。
    /// </summary>
    /// <typeparam name="T">视图模型类型</typeparam>
    public class FormGroup<T> : FormGroup
    {
        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="html">Html助手</param>
        /// <param name="screen">屏幕枚举</param>
        public FormGroup(HtmlHelper html, Screen screen = Screen.Default) : base(html, screen)
        {
        }

        #endregion

        #region 添加表单项

        /// <summary>
        /// 添加文本框。
        /// </summary>
        /// <param name="expression">表单名称Lambda表达式</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="callback">表单设置回调函数</param>
        /// <returns>强类型表单组</returns>
        public FormGroup<T> AppendTextBoxFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Action<TextBoxControl> callback = null)
        {
            return this.AppendTextBoxFor(expression, labelCols, formCols, ValidRule.Default, callback);
        }

        /// <summary>
        /// 添加文本框。
        /// </summary>
        /// <param name="expression">表单名称Lambda表达式</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="rule">验证规则</param>
        /// <param name="callback">表单设置回调函数</param>
        /// <returns>强类型表单组</returns>
        public FormGroup<T> AppendTextBoxFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, ValidRule rule, Action<TextBoxControl> callback = null)
        {
            var metadata = (this._html as HtmlHelper<T>).Resolve(expression);
            var control = new TextBoxControl(this._screen, metadata);

            control.Layout(labelCols, formCols).Valid(rule);

            callback?.Invoke(control);

            this._formControls.Add(control.Render());

            return this;
        }

        /// <summary>
        /// 添加密码框。
        /// </summary>
        /// <typeparam name="P">视图模型属性的类型</typeparam>
        /// <param name="expression">获取表单名称的Lambda表达式</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="callback">表单设置回调函数</param>
        /// <returns>强类型表单组</returns>
        public FormGroup<T> AppendPasswordFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Action<PasswordControl> callback = null)
        {
            return this.AppendPasswordFor(expression, labelCols, formCols, ValidRule.Default, callback);
        }

        /// <summary>
        /// 添加密码框。
        /// </summary>
        /// <typeparam name="P">视图模型属性的类型</typeparam>
        /// <param name="expression">获取表单名称的Lambda表达式</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="rule">验证规则</param>
        /// <param name="callback">表单设置回调函数</param>
        /// <returns>强类型表单组</returns>
        public FormGroup<T> AppendPasswordFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, ValidRule rule, Action<PasswordControl> callback = null)
        {
            var metadata = (this._html as HtmlHelper<T>).Resolve(expression);
            var control = new PasswordControl(this._screen, metadata).Valid(rule);

            callback?.Invoke(control);

            this._formControls.Add(control.Render());

            return this;
        }

        /// <summary>
        /// 添加下拉列表框。
        /// </summary>
        /// <param name="expression">表单名称Lambda表达式</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="callback">表单设置回调函数</param>
        /// <returns>强类型表单组</returns>
        public FormGroup<T> AppendMultipleListFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Action<MultipleListControl> callback = null)
        {
            return this.AppendMultipleListFor(expression, labelCols, formCols, null, ValidRule.Default, callback);
        }

        /// <summary>
        /// 添加下拉列表框。
        /// </summary>
        /// <param name="expression">表单名称Lambda表达式</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="key">验证规则</param>
        /// <param name="callback">表单设置回调函数</param>
        /// <returns>强类型表单组</returns>
        public FormGroup<T> AppendMultipleListFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, string key, Action<MultipleListControl> callback = null)
        {
            return this.AppendMultipleListFor(expression, labelCols, formCols, key, ValidRule.Default, callback);
        }

        /// <summary>
        /// 添加下拉列表框。
        /// </summary>
        /// <param name="expression">表单名称Lambda表达式</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="key">字典键</param>
        /// <param name="rule">验证规则</param>
        /// <param name="callback">表单设置回调函数</param>
        /// <returns>强类型表单组</returns>
        public FormGroup<T> AppendMultipleListFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, string key, ValidRule rule, Action<MultipleListControl> callback = null)
        {
            var metadata = (this._html as HtmlHelper<T>).Resolve(expression);
            var control = new MultipleListControl(this._screen, metadata);

            control.Layout(labelCols, formCols).Key(key).Valid(rule);

            callback?.Invoke(control);

            this._formControls.Add(control.Render());

            return this;
        }

        /// <summary>
        /// 添加单选框组。
        /// </summary>
        /// <param name="expression">表单名称Lambda表达式</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="callback">表单设置回调函数</param>
        /// <returns>强类型表单组</returns>
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
        /// 添加自定义表单。
        /// </summary>
        /// <param name="expression">表单名称Lambda表达式</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="part">自定义表单区域</param>
        /// <param name="callback">表单设置回调函数</param>
        /// <returns>强类型表单组</returns>
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

        #region 生成表单组

        /// <summary>
        /// 生成只包含文本框的表单组。
        /// </summary>
        /// <param name="expression">表单名称Lambda表达式</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="callback">表单设置回调函数</param>
        /// <returns>Html片段</returns>
        public IHtmlString TextBoxFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Action<TextBoxControl> callback = null)
        {
            return this.AppendTextBoxFor(expression, labelCols, formCols, callback).Render();
        }

        /// <summary>
        /// 生成只包含文本框的表单组。
        /// </summary>
        /// <param name="expression">表单名称Lambda表达式</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="rule">验证规则</param>
        /// <param name="callback">表单设置回调函数</param>
        /// <returns>Html片段</returns>
        public IHtmlString TextBoxFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, ValidRule rule, Action<TextBoxControl> callback = null)
        {
            return this.AppendTextBoxFor(expression, labelCols, formCols, rule, callback).Render();
        }

        /// <summary>
        /// 生成只包含密码框的表单组。
        /// </summary>
        /// <typeparam name="P">视图模型属性的类型</typeparam>
        /// <param name="expression">获取表单名称的Lambda表达式</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="callback">表单设置回调函数</param>
        /// <returns>Html片段</returns>
        public IHtmlString PasswordFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Action<PasswordControl> callback = null)
        {
            return this.AppendPasswordFor(expression, labelCols, formCols, callback).Render();
        }

        /// <summary>
        /// 生成只包含密码框的表单组。
        /// </summary>
        /// <typeparam name="P">视图模型属性的类型</typeparam>
        /// <param name="expression">获取表单名称的Lambda表达式</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="rule">验证规则</param>
        /// <param name="callback">表单设置回调函数</param>
        /// <returns>Html片段</returns>
        public IHtmlString PasswordFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, ValidRule rule, Action<PasswordControl> callback = null)
        {
            return this.AppendPasswordFor(expression, labelCols, formCols, rule, callback).Render();
        }

        /// <summary>
        /// 生成只包含文本域的表单组。
        /// </summary>
        /// <param name="expression">表单名称Lambda表达式</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="rows">行数</param>
        /// <param name="callback">表单设置回调函数</param>
        /// <returns>Html片段</returns>
        public IHtmlString TextAreaFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, uint rows, Action<TextAreaControl> callback = null)
        {
            return this.TextAreaFor(expression, labelCols, formCols, rows, ValidRule.Default, callback);
        }

        /// <summary>
        /// 生成只包含文本域的表单组。
        /// </summary>
        /// <param name="expression">表单名称Lambda表达式</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="rows">行数</param>
        /// <param name="rule">验证规则</param>
        /// <param name="callback">表单设置回调函数</param>
        /// <returns>Html片段</returns>
        public IHtmlString TextAreaFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, uint rows, ValidRule rule, Action<TextAreaControl> callback = null)
        {
            var metadata = (this._html as HtmlHelper<T>).Resolve(expression);
            var control = new TextAreaControl(this._screen, metadata);

            control.Layout(labelCols, formCols).Rows(rows).Valid(rule);

            callback?.Invoke(control);

            this._formControls.Add(control.Render());

            return this.Render();
        }

        /// <summary>
        /// 生成只包含下拉文本框的表单组。
        /// </summary>
        /// <param name="expression">表单名称Lambda表达式</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="callback">表单设置回调函数</param>
        /// <returns>Html片段</returns>
        public IHtmlString MultipleListFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Action<MultipleListControl> callback = null)
        {
            return this.AppendMultipleListFor(expression, labelCols, formCols, null, ValidRule.Default, callback).Render();
        }


        /// <summary>
        /// 生成只包含下拉文本框的表单组。
        /// </summary>
        /// <param name="expression">表单名称Lambda表达式</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="rule">验证规则</param>
        /// <param name="callback">表单设置回调函数</param>
        /// <returns>Html片段</returns>
        public IHtmlString MultipleListFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, ValidRule rule = ValidRule.Default, Action<MultipleListControl> callback = null)
        {
            return this.AppendMultipleListFor(expression, labelCols, formCols, null, rule, callback).Render();
        }

        /// <summary>
        /// 生成只包含下拉文本框的表单组。
        /// </summary>
        /// <param name="expression">表单名称Lambda表达式</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="key">字典键</param>
        /// <param name="callback">表单设置回调函数</param>
        /// <returns>Html片段</returns>
        public IHtmlString MultipleListFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, string key, Action<MultipleListControl> callback = null)
        {
            return this.AppendMultipleListFor(expression, labelCols, formCols, key, ValidRule.Default, callback).Render();
        }

        /// <summary>
        /// 生成只包含单选框的表单组。
        /// </summary>
        /// <param name="expression">表单名称Lambda表达式</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="callback">表单设置回调函数</param>
        /// <returns>Html片段</returns>
        public IHtmlString RadiosFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Action<RadioButtonControl> callback = null)
        {
            return this.AppendRadiosFor(expression, labelCols, formCols, callback).Render();
        }

        /// <summary>
        /// 生成只包含自定义表单的表单组。
        /// </summary>
        /// <param name="expression">表单名称Lambda表达式</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <param name="part">自定义表单设置回调</param>
        /// <param name="callback">表单设置回调函数</param>
        /// <returns>Html片段</returns>
        public IHtmlString FormPartFor<P>(Expression<Func<T, P>> expression,
            uint labelCols, uint formCols, Func<PropertyMetadata, object> part, Action<FormBase> callback = null)
        {
            return this.AppendFormPartFor(expression, labelCols, formCols, part, callback).Render();
        }

        #endregion
    }
}