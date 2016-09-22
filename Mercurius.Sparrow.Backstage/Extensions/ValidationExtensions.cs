using System;
using System.ComponentModel.DataAnnotations;
using System.Linq.Expressions;
using System.Reflection;
using System.Web.Mvc;
using System.Web.Routing;
using HtmlHelper = System.Web.WebPages.Html.HtmlHelper;

namespace Mercurius.Sparrow.Mvc.Extensions
{
    #region 验证规则枚举

    /// <summary>
    /// 验证规则枚举。
    /// </summary>
    public enum ValidRule
    {
        /// <summary>
        /// 默认(不能为空)。
        /// </summary>
        Default = 0,

        /// <summary>
        /// 不能为空。
        /// </summary>
        NotNull,

        /// <summary>
        /// 非空整数。
        /// </summary>
        Int,

        /// <summary>
        /// 整数。
        /// </summary>
        IntOrNull,

        /// <summary>
        /// 非空邮箱。
        /// </summary>
        Email,

        /// <summary>
        /// 邮箱。
        /// </summary>
        EmailOrNull,

        /// <summary>
        /// 非空英文字符。
        /// </summary>
        English,

        /// <summary>
        /// 英文字符。
        /// </summary>
        EnglishOrNull,

        /// <summary>
        /// 非空限制位数字。
        /// </summary>
        LimitInt,

        /// <summary>
        /// 限制位数字。
        /// </summary>
        LimitIntOrNull,

        /// <summary>
        /// 非空限制长度字符。
        /// </summary>
        Limit,

        /// <summary>
        /// 限值长度字符。
        /// </summary>
        LimitOrNull,

        /// <summary>
        /// 非空电话号码。
        /// </summary>
        Phone,

        /// <summary>
        /// 非空传真号码。
        /// </summary>
        Fax,

        /// <summary>
        /// 电话号码。
        /// </summary>
        PhoneOrNull,

        /// <summary>
        /// 非空手机号码。
        /// </summary>
        Mobile,

        /// <summary>
        /// 手机号码。
        /// </summary>
        MobileOrNull,

        /// <summary>
        /// 非空手机或电话号码。
        /// </summary>
        MobileOrPhone,

        /// <summary>
        /// 手机或电话号码。
        /// </summary>
        MobileOrPhoneOrNull,

        /// <summary>
        /// 非空链接。
        /// </summary>
        Uri,

        /// <summary>
        /// 链接。
        /// </summary>
        UriOrNull,

        /// <summary>
        /// 相等。
        /// </summary>
        Equal,

        /// <summary>
        /// 非空日期。
        /// </summary>
        Date,

        /// <summary>
        /// 日期。
        /// </summary>
        DateOrNull,

        /// <summary>
        /// 非空日期(包含时间)。
        /// </summary>
        DateTime,

        /// <summary>
        /// 日期(包含时间)。
        /// </summary>
        DateTimeOrNull,

        /// <summary>
        /// 非空时间。
        /// </summary>
        Time,

        /// <summary>
        /// 时间。
        /// </summary>
        TimeOrNull,

        /// <summary>
        /// 非空中文字符。
        /// </summary>
        Chinese,

        /// <summary>
        /// 中文字符。
        /// </summary>
        ChineseOrNull,

        /// <summary>
        /// 非空邮编。
        /// </summary>
        Zip,

        /// <summary>
        /// 邮编。
        /// </summary>
        ZipOrNull,

        /// <summary>
        /// 非空数字。
        /// </summary>
        Double,

        /// <summary>
        /// 数字。
        /// </summary>
        DoubleOrNull,

        /// <summary>
        /// 非空省份证号。
        /// </summary>
        IDCard,

        /// <summary>
        /// 身份证号。
        /// </summary>
        IDCardOrNull,

        /// <summary>
        /// IP v4地址。
        /// </summary>
        IpAddress
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
            "notNull",
            "notNull",
            "int",
            "intOrNull",
            "email",
            "emailOrNull",
            "english",
            "englishOrNull",
            "limitInt",
            "limitIntOrNull",
            "limit",
            "limitOrNull",
            "phone",
            "fax",
            "phoneOrNull",
            "mobile",
            "mobileOrNull",
            "mobileOrPhone",
            "mobileOrPhoneOrNull",
            "uri",
            "uriOrNull",
            "equal",
            "date",
            "dateOrNull",
            "dateTime",
            "dateTimeOrNull",
            "time",
            "timeOrNull",
            "chinese",
            "chineseOrNull",
            "zip",
            "zipOrNull",
            "double",
            "doubleOrNull",
            "IDCard",
            "IDCardOrNull",
            "ipAddress"
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
        public static string AttachValidateAttributes(this HtmlHelper html, string fieldName, ValidRule rule = ValidRule.Default)
        {
            return $"validate-rule={Rules[(int)rule]} validate-field={fieldName}";
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
        public static string AttachValidateAttributes<T, P>(this HtmlHelper<T> html, Expression<Func<T, P>> expression, ValidRule rule = ValidRule.Default, string fieldName = null)
        {
            if (string.IsNullOrWhiteSpace(fieldName))
            {
                var propertyName = ExpressionHelper.GetExpressionText(expression);

                var typeInfo = typeof(T);
                var displayAttr = typeInfo.GetProperty(propertyName).GetCustomAttribute<DisplayAttribute>();

                fieldName = displayAttr == null ? propertyName : displayAttr.Name;
            }

            return $"validate-rule={Rules[(int)rule]} validate-field={fieldName}";
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

            attributes.Add("validate-field", fieldName);
            attributes.Add("validate-rule", Rules[(int)rule]);

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

            attributes.Add("validate-field", propertyDisplayName);
            attributes.Add("validate-rule", Rules[(int)rule]);

            return attributes;
        }

        #endregion

        #region 程序集内方法

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <typeparam name="P"></typeparam>
        /// <param name="html"></param>
        /// <param name="fieldName"></param>
        /// <param name="rule"></param>
        /// <returns></returns>
        internal static RouteValueDictionary GetValidAttributes<T, P>(
            this HtmlHelper<T> html,
            string fieldName,
            ValidRule rule = ValidRule.Default)
        {
            var attributes = new RouteValueDictionary
            {
                {"validate-field", fieldName},
                {"validate-rule", Rules[(int) rule]}
            };

            return attributes;
        }

        #endregion
    }
}