using System;
using System.ComponentModel.DataAnnotations;
using System.Linq.Expressions;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Mercurius.Kernel.WebCores.HtmlHelpers
{
    #region 验证规则枚举

    /// <summary>
    /// 验证规则枚举。
    /// </summary>
    public enum ValidRule
    {
        /// <summary>
        /// 默认(不验证)
        /// </summary>
        Default = 0,

        /// <summary>
        /// 必填。
        /// </summary>
        Required,

        /// <summary>
        /// 必填整型。
        /// </summary>
        Int,

        /// <summary>
        /// 可空整型。
        /// </summary>
        IntOrNull,

        /// <summary>
        /// 必填数字。
        /// </summary>
        Number,

        /// <summary>
        /// 可空数字。
        /// </summary>
        NumberOrNull,

        /// <summary>
        /// 必填逗号分隔的数字。
        /// </summary>
        CommaNumber,

        /// <summary>
        /// 必填日期。
        /// </summary>
        Date,

        /// <summary>
        /// 可空日期。
        /// </summary>
        DateOrNull,

        /// <summary>
        /// 必填日期+时间。
        /// </summary>
        DateTime,

        /// <summary>
        /// 可空日期+时间。
        /// </summary>
        DateTimeOrNull,

        /// <summary>
        /// 必填时间。
        /// </summary>
        Time,

        /// <summary>
        /// 可空时间。
        /// </summary>
        TimeOrNull,

        /// <summary>
        /// 必填字符串。
        /// </summary>
        Limit,

        /// <summary>
        /// 可空字符串。
        /// </summary>
        LimitOrNull,

        /// <summary>
        /// 必填英文字符串。
        /// </summary>
        English,

        /// <summary>
        /// 可空英文字符串。
        /// </summary>
        EnglishOrNull,

        /// <summary>
        /// 必填中文字符串。
        /// </summary>
        Chinese,

        /// <summary>
        /// 可空中文字符串。
        /// </summary>
        ChineseOrNull,

        /// <summary>
        /// 相等。
        /// </summary>
        Equal,

        /// <summary>
        /// 必填电子邮箱。
        /// </summary>
        Email,

        /// <summary>
        /// 可空电子邮箱。
        /// </summary>
        EmailOrNull,

        /// <summary>
        /// 必填电话号码。
        /// </summary>
        Phone,

        /// <summary>
        /// 可空电话号码。
        /// </summary>
        PhoneOrNull,

        /// <summary>
        /// 必填传真号。
        /// </summary>
        Fax,

        /// <summary>
        /// 可空传真号。
        /// </summary>
        FaxOrNull,

        /// <summary>
        /// 必填手机号。
        /// </summary>
        Mobile,

        /// <summary>
        /// 可空手机号。
        /// </summary>
        MobileOrNull,

        /// <summary>
        /// 必填电话号码或手机号码。
        /// </summary>
        MobileOrPhone,

        /// <summary>
        /// 可空电话号码或手机号码。
        /// </summary>
        MobileOrPhoneOrNull,

        /// <summary>
        /// 必填uri地址。
        /// </summary>
        Uri,

        /// <summary>
        /// 可空uri地址。
        /// </summary>
        UriOrNull,

        /// <summary>
        /// 必填邮编。
        /// </summary>
        Zip,

        /// <summary>
        /// 可空邮编。
        /// </summary>
        ZipOrNull,

        /// <summary>
        /// 必填身份证号。
        /// </summary>
        IDCard,

        /// <summary>
        /// 可空身份证号。
        /// </summary>
        IDCardOrNull,

        /// <summary>
        /// 必填IP地址。
        /// </summary>
        IpAddress,

        /// <summary>
        /// 可空IP地址。
        /// </summary>
        IpAddressOrNull
    }

    #endregion

    /// <summary>
    /// 验证扩展。
    /// </summary>
    public static class ValidationExtensions
    {
        #region 常量

        private static readonly string[] Rules =
        {
            "",
            "required",
            "int",
            "intOrNull",
            "number",
            "numberOrNull",
            "commaNumber",
            "date",
            "dateOrNull",
            "dateTime",
            "dateTimeOrNull",
            "time",
            "timeOrNull",
            "limit",
            "limitOrNull",
            "english",
            "englishOrNull",
            "chinese",
            "chineseOrNull",
            "equal",
            "email",
            "emailOrNull",
            "phone",
            "phoneOrNull",
            "fax",
            "faxOrNull",
            "mobile",
            "mobileOrNull",
            "mobileOrPhone",
            "mobileOrPhoneOrNull",
            "uri",
            "uriOrNull",
            "zip",
            "zipOrNull",
            "IDCard",
            "IDCardOrNull",
            "ipAddress",
            "ipAddressOrNull"
        };

        #endregion

        #region 附加验证属性

        /// <summary>
        /// 附加验证属性。
        /// </summary>
        /// <param name="html">HTML呈现器</param>
        /// <param name="fieldName">字段名</param>
        /// <param name="rule">验证规则</param>
        /// <returns>附加验证属性</returns>
        public static IHtmlString Valid(
            this HtmlHelper html,
            string fieldName,
            ValidRule rule = ValidRule.Required,
            object extraAttributes = null)
        {
            var iTag = new TagBuilder("span");

            iTag.Attributes.Add("valid-rule", Rules[(int)rule]);
            iTag.Attributes.Add("valid-field", fieldName);

            if (extraAttributes != null)
            {
                iTag.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(extraAttributes));
            }

            return html.Raw(iTag.ToString().Replace("<span", "").Replace("/>", "").Replace("</span>", "").Replace(">", ""));
        }

        /// <summary>
        /// 附加验证属性。
        /// </summary>
        /// <typeparam name="T">强类型视图的类型</typeparam>
        /// <typeparam name="P">验证属性类型</typeparam>
        /// <param name="html">HTML呈现器</param>
        /// <param name="expression">Lambda表达式</param>
        /// <param name="rule">验证规则</param>
        /// <param name="fieldName">字段名</param>
        /// <returns>附加验证属性</returns>
        public static IHtmlString Valid<T, P>(
            this HtmlHelper<T> html,
            Expression<Func<T, P>> expression,
            ValidRule rule = ValidRule.Default,
            object extraAttributes = null,
            string fieldName = null)
        {
            if (string.IsNullOrWhiteSpace(fieldName))
            {
                var propertyName = ExpressionHelper.GetExpressionText(expression);

                var typeInfo = typeof(T);
                var displayAttr = typeInfo.GetProperty(propertyName).GetCustomAttribute<DisplayAttribute>();

                fieldName = displayAttr == null ? propertyName : displayAttr.Name;
            }

            return Valid(html, fieldName, rule, extraAttributes);
        }

        #endregion

        #region 获取带有验证信息的HTML属性字典

        /// <summary>
        /// 获取带有验证信息的HTML属性字典。
        /// </summary>
        /// <param name="html">HTML呈现器</param>
        /// <param name="fieldName">字段名称</param>
        /// <param name="rule">验证规则</param>
        /// <param name="htmlAttributes">其他属性</param>
        /// <returns>HTML属性字典</returns>
        public static RouteValueDictionary CreateValidAttributes(
            this HtmlHelper html,
            string fieldName,
            ValidRule rule = ValidRule.Default,
            object htmlAttributes = null)
        {
            var attributes = HtmlHelper.AnonymousObjectToHtmlAttributes(htmlAttributes);

            if (!attributes.ContainsKey("class"))
            {
                attributes.Add("class", "form-control");
            }

            if (!attributes.ContainsKey("placeholder"))
            {
                attributes.Add("placeholder", fieldName);
            }

            attributes.Add("valid-field", fieldName);
            attributes.Add("valid-rule", Rules[(int)rule]);

            return attributes;
        }

        /// <summary>
        /// 获取带有验证信息的HTML属性字典。
        /// </summary>
        /// <typeparam name="T">强类型视图的类型</typeparam>
        /// <typeparam name="P">验证属性类型</typeparam>
        /// <param name="html">HTML呈现器</param>
        /// <param name="expression">Lambda表达式</param>
        /// <param name="rule">验证规则</param>
        /// <param name="htmlAttributes">其他属性</param>
        /// <returns>HTML属性字典</returns>
        public static RouteValueDictionary CreateValidAttributes<T, P>(
            this HtmlHelper<T> html,
            Expression<Func<T, P>> expression,
            ValidRule rule = ValidRule.Default,
            object htmlAttributes = null)
        {
            var typeInfo = typeof(T);
            var propertyName = ExpressionHelper.GetExpressionText(expression);
            var displayAttribute = typeInfo.GetProperty(propertyName).GetCustomAttribute<DisplayAttribute>();
            var propertyDisplayName = displayAttribute == null ? propertyName : displayAttribute.Name;

            var attributes = HtmlHelper.AnonymousObjectToHtmlAttributes(htmlAttributes);

            if (!attributes.ContainsKey("class"))
            {
                attributes.Add("class", "form-control");
            }

            if (!attributes.ContainsKey("placeholder"))
            {
                attributes.Add("placeholder", propertyDisplayName);
            }

            attributes.Add("valid-field", propertyDisplayName);
            attributes.Add("valid-rule", Rules[(int)rule]);

            return attributes;
        }

        #endregion

        #region 程序集内方法

        /// <summary>
        /// 
        /// </summary>
        /// <param name="fieldName"></param>
        /// <param name="rule"></param>
        /// <returns></returns>
        internal static RouteValueDictionary GetValidAttributes(
            string fieldName,
            ValidRule rule = ValidRule.Default)
        {
            var attributes = new RouteValueDictionary
            {
                {"valid-field", fieldName},
                {"valid-rule", Rules[(int) rule]}
            };

            return attributes;
        }

        #endregion
    }
}