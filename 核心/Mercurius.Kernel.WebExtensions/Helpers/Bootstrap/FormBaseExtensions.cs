using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Mercurius.Kernel.WebCores.Helpers.Bootstrap.Controls;

namespace Mercurius.Kernel.WebCores.Helpers.Bootstrap
{
    /// <summary>
    /// 控件扩展方法。
    /// </summary>
    public static class FormBaseExtensions
    {
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