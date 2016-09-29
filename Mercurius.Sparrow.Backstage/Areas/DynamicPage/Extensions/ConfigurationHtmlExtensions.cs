using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;

namespace Mercurius.Sparrow.Backstage.Areas.DynamicPage.Extensions
{
    /// <summary>
    /// 配置信息的Html帮助类。
    /// </summary>
    public static class ConfigurationHtmlExtensions
    {
        #region 常量

        private static readonly Dictionary<string, string> DefaultValues = new Dictionary<string, string>
        {
            { "", "无" },
            { "GUID", "GUID" },
            { "CurrentDate", "当前日期" },
            { "CurrentDateTime", "当前日期时间" },
            { "CreateTime", "当前时间" },
            { "CurrentUserId", "当前用户编号" },
            { "CurrentUserName", "当前用户名" },
        };

        private static readonly Dictionary<string, string> ValidRules = new Dictionary<string, string>
        {
            { "", "无" },
            { "notNull", "必填"},
            { "int", "整数" },
            { "intOrNull", "空或整数" },
            { "double", "数字" },
            { "doubleOrNull", "空或数字" },
            { "date", "日期" },
            { "dateOrNull", "空或日期" },
            { "dateTime", "日期时间" },
            { "dateTimeOrNull", "空或日期时间" },
            { "time", "时间" },
            { "timeOrNull", "空或时间" },
            { "email", "E-Mail" },
            { "emailOrNull", "空或E-Mail" },
            { "english", "英文字符" },
            { "englishOrNull", "空或英文字符" },
            { "phone", "电话号码" },
            { "phoneOrNull", "空或电话号码" },
            { "mobile", "手机号码" },
            { "mobileOrNull", "空或手机号码" },
            { "mobileOrPhone", "手机或电话号码" },
            { "mobileOrPhoneOrNull", "空、手机或电话号码" },
            { "fax", "传真" },
            { "uri", "URI" },
            { "uriOrNull", "空或URI" },
            { "chinese", "中文字符" },
            { "chineseOrNull", "空或中文字符" },
            { "zip", "邮编" },
            { "zipOrNull", "空或邮编" },
            { "IDCard", "身份证" },
            { "IDCardOrNull", "空或身份证" },
            { "ipAddress", "IP地址" }
        };

        #endregion

        #region 公开方法

        /// <summary>
        /// 创建默认值下拉框。
        /// </summary>
        /// <param name="html">HTML呈现器</param>
        /// <param name="name">元素名称</param>
        /// <param name="selectedValue">选定的值</param>
        /// <param name="htmlAttributes">HTML属性</param>
        /// <returns>下拉框HTML</returns>
        public static MvcHtmlString CreateDefaultValueList(
            this HtmlHelper html,
            string name,
            string selectedValue = null,
            object htmlAttributes = null)
        {
            var tagBuilder = new TagBuilder("select");

            tagBuilder.Attributes.Add("name", name);
            tagBuilder.AddCssClass("form-control");
            tagBuilder.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(htmlAttributes), true);

            foreach (var item in DefaultValues)
            {
                tagBuilder.InnerHtml += $"<option value=\"{item.Key}\" {(item.Key == selectedValue ? "selected" : string.Empty) }>{item.Value}</option>";
            }

            return new MvcHtmlString(tagBuilder.ToString());
        }

        /// <summary>
        /// 创建验证规则下拉框。
        /// </summary>
        /// <param name="html">HTML呈现器</param>
        /// <param name="name">元素名称</param>
        /// <param name="selectedValue">选定的值</param>
        /// <param name="htmlAttributes">HTML属性</param>
        /// <returns>下拉框HTML</returns>
        public static MvcHtmlString CreateValidRuleList(
            this HtmlHelper html,
            string name,
            string selectedValue = null,
            object htmlAttributes = null)
        {
            var tagBuilder = new TagBuilder("select");

            tagBuilder.Attributes.Add("name", name);
            tagBuilder.AddCssClass("form-control");
            tagBuilder.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(htmlAttributes), true);

            foreach (var item in ValidRules)
            {
                tagBuilder.InnerHtml += $"<option value=\"{item.Key}\" {(item.Key == selectedValue ? "selected" : string.Empty)}>{item.Value}</option>";
            }

            return new MvcHtmlString(tagBuilder.ToString());
        }

        /// <summary>
        /// 创建验证规则下拉框。
        /// </summary>
        /// <typeparam name="T">模型类型</typeparam>
        /// <typeparam name="R">属性类型</typeparam>
        /// <param name="html">HTML呈现器</param>
        /// <param name="expression">Lambda表达式</param>
        /// <param name="htmlAttributes">HTML属性</param>
        /// <returns>下拉框HTML</returns>
        public static MvcHtmlString CreateValidRuleListFor<T, R>(this HtmlHelper<T> html,
            Expression<Func<T, R>> expression, object htmlAttributes = null)
        {
            var propertyName = ExpressionHelper.GetExpressionText(expression);
            var selectedValue = html.ViewData.Model == null ? null : Convert.ToString(html.ViewData.ModelMetadata.ModelType.GetProperty(propertyName).GetValue(html.ViewData.Model));

            return CreateValidRuleList(html, propertyName, selectedValue, htmlAttributes);
        }

        #endregion
    }
}