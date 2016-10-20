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
    /// 基于Bootstrap的HTML呈现助手。
    /// </summary>
    public static class BootstrapHtmlHelper
    {
        #region 文本框

        /// <summary>
        /// 生成文本框片段。
        /// </summary>
        /// <param name="html">Html助手对象</param>
        /// <param name="fullName">文本框名称</param>
        /// <param name="callback">文本框设置回调函数</param>
        /// <returns>Html片段</returns>
        public static IHtmlString TextBox(this HtmlHelper html,
            string fullName, Action<TextBoxControl> callback = null)
        {
            return html.TextBox(fullName, ValidRule.Default, callback);
        }

        /// <summary>
        /// 生成文本框片段。
        /// </summary>
        /// <param name="html">Html助手对象</param>
        /// <param name="fullName">文本框名称</param>
        /// <param name="rule">验证规则</param>
        /// <param name="callback">文本框设置回调函数</param>
        /// <returns>Html片段</returns>
        public static IHtmlString TextBox(this HtmlHelper html,
            string fullName, ValidRule rule, Action<TextBoxControl> callback = null)
        {
            var metadata = html.Resolve(fullName);
            var control = new TextBoxControl(Screen.Default, metadata).Valid(rule);

            callback?.Invoke(control);

            return control.Render();
        }

        /// <summary>
        /// 生成文本框片段。
        /// </summary>
        /// <typeparam name="T">视图模型的类型</typeparam>
        /// <typeparam name="P">视图模型的属性类型</typeparam>
        /// <param name="html">Html助手对象</param>
        /// <param name="expression">获取视图属性的Lambda表达式</param>
        /// <param name="callback">文本框设置回调函数</param>
        /// <returns>Html片段</returns>
        public static IHtmlString TextBoxFor<T, P>(this HtmlHelper<T> html,
            Expression<Func<T, P>> expression, Action<TextBoxControl> callback = null)
        {
            return html.TextBoxFor(expression, ValidRule.Default, callback);
        }

        /// <summary>
        /// 生成文本框片段。
        /// </summary>
        /// <typeparam name="T">视图模型的类型</typeparam>
        /// <typeparam name="P">视图模型的属性类型</typeparam>
        /// <param name="html">Html助手对象</param>
        /// <param name="expression">获取视图属性的Lambda表达式</param>
        /// <param name="rule">验证规则</param>
        /// <param name="callback">文本框设置回调函数</param>
        /// <returns>Html片段</returns>
        public static IHtmlString TextBoxFor<T, P>(this HtmlHelper<T> html,
            Expression<Func<T, P>> expression, ValidRule rule, Action<TextBoxControl> callback = null)
        {
            var metadata = html.Resolve(expression);
            var control = new TextBoxControl(Screen.Default, metadata).Valid(rule);

            callback?.Invoke(control);

            return control.Render();
        }

        #endregion

        #region 文本域

        /// <summary>
        /// 生成文本域片段。
        /// </summary>
        /// <param name="html">Html助手对象</param>
        /// <param name="fullName">文本框名称</param>
        /// <param name="rows">行数</param>
        /// <param name="callback">文本框设置回调函数</param>
        /// <returns>Html片段</returns>
        public static IHtmlString TextArea(this HtmlHelper html,
            string fullName, uint rows, Action<TextAreaControl> callback = null)
        {
            return html.TextArea(fullName, rows, ValidRule.Default, callback);
        }

        /// <summary>
        /// 生成文本域片段。
        /// </summary>
        /// <param name="html">Html助手对象</param>
        /// <param name="fullName">文本框名称</param>
        /// <param name="rows">行数</param>
        /// <param name="rule">验证规则</param>
        /// <param name="callback">文本框设置回调函数</param>
        /// <returns>Html片段</returns>
        public static IHtmlString TextArea(this HtmlHelper html, string fullName,
            uint rows, ValidRule rule, Action<TextAreaControl> callback = null)
        {
            var metadata = html.Resolve(fullName);
            var control = new TextAreaControl(Screen.Default, metadata).Rows(rows).Valid(rule);

            callback?.Invoke(control);

            return control.Render();
        }

        /// <summary>
        /// 生成文本框片段。
        /// </summary>
        /// <typeparam name="T">视图模型的类型</typeparam>
        /// <typeparam name="P">视图模型的属性类型</typeparam>
        /// <param name="html">Html助手对象</param>
        /// <param name="expression">获取视图属性的Lambda表达式</param>
        /// <param name="rows">行数</param>
        /// <param name="callback">文本框设置回调函数</param>
        /// <returns>Html片段</returns>
        public static IHtmlString TextAreaFor<T, P>(this HtmlHelper<T> html,
            Expression<Func<T, P>> expression, uint rows, Action<TextAreaControl> callback = null)
        {
            return html.TextAreaFor(expression, rows, ValidRule.Default, callback);
        }

        /// <summary>
        /// 生成文本框片段。
        /// </summary>
        /// <typeparam name="T">视图模型的类型</typeparam>
        /// <typeparam name="P">视图模型的属性类型</typeparam>
        /// <param name="html">Html助手对象</param>
        /// <param name="expression">获取视图属性的Lambda表达式</param>
        /// <param name="rows">行数</param>
        /// <param name="rule">验证规则</param>
        /// <param name="callback">文本框设置回调函数</param>
        /// <returns>Html片段</returns>
        public static IHtmlString TextAreaFor<T, P>(this HtmlHelper<T> html,
            Expression<Func<T, P>> expression, uint rows, ValidRule rule, Action<TextAreaControl> callback = null)
        {
            var metadata = html.Resolve(expression);
            var control = new TextAreaControl(Screen.Default, metadata).Rows(3).Valid(rule);

            callback?.Invoke(control);

            return control.Render();
        }

        #endregion

        #region 单选组

        /// <summary>
        /// 生成单选组片段。
        /// </summary>
        /// <param name="html">Html助手对象</param>
        /// <param name="fullName">元素名称</param>
        /// <param name="callback">单选组设置回调函数</param>
        /// <returns>Html片段</returns>
        public static IHtmlString Radios(this HtmlHelper html,
            string fullName, Action<RadioButtonControl> callback = null)
        {
            var metadata = html.Resolve(fullName);
            var control = new RadioButtonControl(Screen.Default, metadata);

            callback?.Invoke(control);

            return control.Render();
        }

        /// <summary>
        /// 生成单选组片段。
        /// </summary>
        /// <typeparam name="T">视图模型的类型</typeparam>
        /// <typeparam name="P">视图模型属性的类型</typeparam>
        /// <param name="html">Html助手对象</param>
        /// <param name="expression">视图模型属性的获取Lambda表达式</param>
        /// <param name="callback">单选组设置回调函数</param>
        /// <returns>Html片段</returns>
        public static IHtmlString RadiosFor<T, P>(this HtmlHelper<T> html,
            Expression<Func<T, P>> expression, Action<RadioButtonControl> callback = null)
        {
            var metadata = html.Resolve(expression);
            var control = new RadioButtonControl(Screen.Default, metadata);

            callback?.Invoke(control);

            return control.Render();
        }

        #endregion

        #region 多选列表

        /// <summary>
        /// 生成多选列表片段。
        /// </summary>
        /// <param name="html">Html助手对象</param>
        /// <param name="fullName">元素名称</param>
        /// <param name="key">字典键</param>
        /// <param name="callback">多选项设置回调</param>
        /// <returns>Html片段</returns>
        public static IHtmlString MultipleList(this HtmlHelper html,
            string fullName, string key, Action<MultipleListControl> callback = null)
        {
            return html.MultipleList(fullName, key, ValidRule.Default, callback);
        }

        /// <summary>
        /// 生成多选列表片段。
        /// </summary>
        /// <param name="html">Html助手对象</param>
        /// <param name="fullName">元素名称</param>
        /// <param name="key">字典键</param>
        /// <param name="rule">验证规则</param>
        /// <param name="callback">多选项设置回调</param>
        /// <returns>Html片段</returns>
        public static IHtmlString MultipleList(this HtmlHelper html,
            string fullName, string key, ValidRule rule, Action<MultipleListControl> callback = null)
        {
            var metadata = html.Resolve(fullName);
            var control = new MultipleListControl(Screen.Default, metadata).Valid(rule);

            control.Key(key);

            callback?.Invoke(control);

            return control.Render();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <typeparam name="P"></typeparam>
        /// <param name="html"></param>
        /// <param name="expression"></param>
        /// <param name="key"></param>
        /// <param name="callback"></param>
        /// <returns></returns>
        public static IHtmlString MultipleListFor<T, P>(this HtmlHelper<T> html,
           Expression<Func<T, P>> expression, string key, Action<MultipleListControl> callback = null)
        {
            return html.MultipleListFor(expression, key, ValidRule.Default, callback);
        }

        /// <summary>
        /// 生成多选列表片段。
        /// </summary>
        /// <typeparam name="T">视图模型的类型</typeparam>
        /// <typeparam name="P">视图模型属性的类型</typeparam>
        /// <param name="html">Html助手对象</param>
        /// <param name="expression">获取视图属性的Lambda表达式</param>
        /// <param name="key">字典键</param>
        /// <param name="rule">验证规则</param>
        /// <param name="callback">多选项控件设置回调函数</param>
        /// <returns>Html片段</returns>
        public static IHtmlString MultipleListFor<T, P>(this HtmlHelper<T> html,
           Expression<Func<T, P>> expression, string key, ValidRule rule, Action<MultipleListControl> callback = null)
        {
            var metadata = html.Resolve(expression);
            var control = new MultipleListControl(Screen.Default, metadata).Valid(rule);

            control.Key(key);

            callback?.Invoke(control);

            return control.Render();
        }

        #endregion

        #region 自定义表单

        /// <summary>
        /// 生成自定义表单片段。
        /// </summary>
        /// <param name="html">Html助手对象</param>
        /// <param name="fullName">元素名称</param>
        /// <param name="part">自定义表单区域设置回调</param>
        /// <param name="callback">自定义表单设置回调</param>
        /// <returns>Html片段</returns>
        public static IHtmlString FormPart(this HtmlHelper html,
            string fullName, Func<PropertyMetadata, object> part, Action<CustomControl> callback = null)
        {
            var metadata = html.Resolve(fullName);
            var control = new CustomControl(Screen.Default, metadata);

            control.FormPart(part);

            callback?.Invoke(control);

            return control.Render();
        }

        /// <summary>
        /// 生成自定义表单片段。
        /// </summary>
        /// <typeparam name="T">视图模型的类型</typeparam>
        /// <typeparam name="P">视图模型属性的类型</typeparam>
        /// <param name="html">Html助手对象</param>
        /// <param name="expression">视图模型属性的获取Lambda表达式</param>
        /// <param name="part">自定义表单区域设置回调</param>
        /// <param name="callback">自定义表单设置回调</param>
        /// <returns>Html片段</returns>
        public static IHtmlString FormPartFor<T, P>(this HtmlHelper<T> html,
            Expression<Func<T, P>> expression, Func<PropertyMetadata, object> part, Action<CustomControl> callback = null)
        {
            var metadata = html.Resolve(expression);
            var control = new CustomControl(Screen.Default, metadata);

            control.FormPart(part);

            callback?.Invoke(control);

            return control.Render();
        }

        #endregion

        #region 表单组

        /// <summary>
        /// 创建表单组。
        /// </summary>
        /// <param name="html">Html助手对象</param>
        /// <param name="screen">屏幕枚举</param>
        /// <returns>表单组</returns>
        public static FormGroup FormGroup(this HtmlHelper html, Screen screen = Screen.Default)
        {
            return new FormGroup(html, screen);
        }

        /// <summary>
        /// 创建表单组。
        /// </summary>
        /// <typeparam name="T">视图模型类型</typeparam>
        /// <param name="html">Html助手</param>
        /// <param name="screen">屏幕枚举</param>
        /// <returns>表单组</returns>
        public static FormGroup<T> FormGroupFor<T>(this HtmlHelper<T> html, Screen screen = Screen.Default)
        {
            return new FormGroup<T>(html, screen);
        }

        #endregion

        #region 视图模型属性元数据获取

        /// <summary>
        /// 
        /// </summary>
        /// <param name="html"></param>
        /// <param name="fullName"></param>
        /// <returns></returns>
        public static PropertyMetadata Resolve(this HtmlHelper html, string fullName)
        {
            var metadata = ModelMetadata.FromStringExpression(fullName, html.ViewData);

            var result = new PropertyMetadata
            {
                FullName = fullName,
                Type = metadata.ModelType,
                IsRequired = metadata.IsRequired,
                DisplayName = metadata.DisplayName
            };

            try
            {
                result.Value = metadata.Model;
            }
            catch
            {
                // ignored
            }

            return result;
        }

        /// <summary>
        /// 解析视图模型属性元数据信息。
        /// </summary>
        /// <typeparam name="T">视图模型类型</typeparam>
        /// <typeparam name="P">视图模型属性类型</typeparam>
        /// <param name="html">HTML呈现器</param>
        /// <param name="expression">属性获取Lambda表达式</param>
        /// <returns>视图模型元数据信息</returns>
        public static PropertyMetadata Resolve<T, P>(this HtmlHelper<T> html, Expression<Func<T, P>> expression)
        {
            var fullName = ExpressionHelper.GetExpressionText(expression);
            var metadata = ModelMetadata.FromLambdaExpression(expression, html.ViewData);

            var result = new PropertyMetadata
            {
                FullName = fullName,
                IsRequired = metadata.IsRequired,
                DisplayName = metadata.DisplayName
            };

            try
            {
                result.Value = metadata.Model;
            }
            catch
            {
                // ignored
            }

            return result;
        }

        #endregion

        #region 控件基本设置扩展

        /// <summary>
        /// 设置表单的布局。
        /// </summary>
        /// <typeparam name="T">控件类型</typeparam>
        /// <param name="form">表单控件</param>
        /// <param name="labelCols">标签宽度</param>
        /// <param name="formCols">表单宽度</param>
        /// <returns></returns>
        public static T Layout<T>(this T form, uint labelCols, uint formCols) where T : FormBase
        {
            form.FormCols = formCols;
            form.LabelCols = labelCols;

            return form;
        }

        /// <summary>
        /// 设置标签显示内容。
        /// </summary>
        /// <typeparam name="T">控件类型</typeparam>
        /// <param name="form">表单控件</param>
        /// <param name="label">标签显示内容</param>
        /// <returns>表单控件</returns>
        public static T Label<T>(this T form, string label) where T : FormBase
        {
            form.Label = label;

            return form;
        }

        /// <summary>
        /// 设置标签的内联样式。
        /// </summary>
        /// <typeparam name="T">控件类型</typeparam>
        /// <param name="form">表单控件</param>
        /// <param name="style">内联样式</param>
        /// <returns>表单控件</returns>
        public static T LabelStyle<T>(this T form, string style) where T : FormBase
        {
            form.LabelStyle = style;

            return form;
        }

        /// <summary>
        /// 隐藏标签。
        /// </summary>
        /// <typeparam name="T">控件类型</typeparam>
        /// <param name="form">表单控件</param>
        /// <returns>表单控件</returns>
        public static T HideLabel<T>(this T form) where T : FormBase
        {
            form.LabelState = "H";

            return form;
        }

        /// <summary>
        /// 删除标签。
        /// </summary>
        /// <typeparam name="T">控件类型</typeparam>
        /// <param name="form">表单控件</param>
        /// <returns>表单控件</returns>
        public static T RemoveLabel<T>(this T form) where T : FormBase
        {
            form.LabelState = "R";

            return form;
        }

        /// <summary>
        /// 设置表单的css样式类名称。
        /// </summary>
        /// <typeparam name="T">控件类型</typeparam>
        /// <param name="form">表单控件</param>
        /// <param name="class">css类名称</param>
        /// <returns>表单控件</returns>
        public static T Class<T>(this T form, string @class) where T : FormBase
        {
            form.Class = @class;

            return form;
        }

        /// <summary>
        /// 设置表单的内联样式。
        /// </summary>
        /// <typeparam name="T">控件类型</typeparam>
        /// <param name="form">表单控件</param>
        /// <param name="style">内联样式</param>
        /// <returns>表单控件</returns>
        public static T Style<T>(this T form, string style) where T : FormBase
        {
            form.Style = style;

            return form;
        }

        /// <summary>
        /// 设置表单值的显示格式。
        /// </summary>
        /// <typeparam name="T">控件类型</typeparam>
        /// <param name="form">表单控件</param>
        /// <param name="format">格式话字符串</param>
        /// <returns>表单控件</returns>
        public static T Format<T>(this T form, string format) where T : FormBase
        {
            form.FormatString = format;

            return form;
        }

        /// <summary>
        /// 设置表单是否为只读。
        /// </summary>
        /// <typeparam name="T">控件类型</typeparam>
        /// <param name="form">表单控件</param>
        /// <param name="readonly">是否为只读</param>
        /// <returns>表单控件</returns>
        public static T Readonly<T>(this T form, bool @readonly = true) where T : FormBase
        {
            form.Readonly = @readonly;

            return form;
        }

        /// <summary>
        /// 设置表单是否为禁用。
        /// </summary>
        /// <typeparam name="T">控件类型</typeparam>
        /// <param name="form">表单控件</param>
        /// <param name="disabled">是否禁用</param>
        /// <returns>表单控件</returns>
        public static T Disabled<T>(this T form, bool disabled = true) where T : FormBase
        {
            form.Disabled = disabled;

            return form;
        }

        /// <summary>
        /// 设置表单的验证规则。
        /// </summary>
        /// <typeparam name="T">控件类型</typeparam>
        /// <param name="form">表单控件</param>
        /// <param name="rule">验证规则</param>
        /// <param name="field">验证字段名称</param>
        /// <returns>表单控件</returns>
        public static T Valid<T>(this T form, ValidRule rule, string field = null) where T : FormBase
        {
            form.Rule = rule;
            form.RuleField = string.IsNullOrWhiteSpace(field) ? form.RuleField : field;

            return form;
        }

        /// <summary>
        /// 设置表单宽度。
        /// </summary>
        /// <typeparam name="T">控件类型</typeparam>
        /// <param name="form">表单控件</param>
        /// <param name="attributes">表单属性</param>
        /// <returns>表单控件</returns>
        public static T Form<T>(this T form, object attributes) where T : FormBase
        {
            form.HtmlAttributes = attributes;

            return form;
        }

        #endregion
    }
}