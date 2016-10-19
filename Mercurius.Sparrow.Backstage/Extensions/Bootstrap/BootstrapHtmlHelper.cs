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
        #region 表单

        /// <summary>
        /// 
        /// </summary>
        /// <param name="html"></param>
        /// <param name="fullName"></param>
        /// <param name="callback"></param>
        /// <returns></returns>
        public static IHtmlString TextBox(this HtmlHelper html,
            string fullName, Action<TextBoxControl> callback = null)
        {
            var metadata = html.Resolve(fullName);
            var control = new TextBoxControl(Screen.Default, metadata);

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
        /// <param name="callback"></param>
        /// <returns></returns>
        public static IHtmlString TextBoxFor<T, P>(this HtmlHelper<T> html,
            Expression<Func<T, P>> expression, Action<TextBoxControl> callback = null)
        {
            var metadata = html.Resolve(expression);
            var control = new TextBoxControl(Screen.Default, metadata);

            callback?.Invoke(control);

            return control.Render();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="html"></param>
        /// <param name="fullName"></param>
        /// <param name="key"></param>
        /// <param name="callback"></param>
        /// <returns></returns>
        public static IHtmlString MultipleList(this HtmlHelper html,
            string fullName, string key, Action<MultipleListControl> callback = null)
        {
            var metadata = html.Resolve(fullName);
            var control = new MultipleListControl(Screen.Default, metadata);

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
            var metadata = html.Resolve(expression);
            var control = new MultipleListControl(Screen.Default, metadata);

            control.Key(key);

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