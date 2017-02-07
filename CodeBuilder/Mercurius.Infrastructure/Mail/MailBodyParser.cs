using System;
using System.IO;

namespace Mercurius.Infrastructure.Mail
{
    /// <summary>
    /// 邮件正文解析器。
    /// </summary>
    public static class MailBodyParser
    {
        /// <summary>
        /// 解析邮件正文。
        /// </summary>
        /// <typeparam name="T">邮件所需数据</typeparam>
        /// <param name="data">邮件模板所用的数据</param>
        /// <param name="templateName">邮件模板名称</param>
        /// <param name="module">邮件模板所属模块</param>
        /// <returns>邮件正文</returns>
        public static string Parse<T>(T data, string templateName, string module = null)
        {
            var templateFolder = $@"{AppDomain.CurrentDomain.BaseDirectory}\bin\Mail";

            if (!string.IsNullOrWhiteSpace(module))
            {
                templateFolder = $@"{templateFolder}\{module}";
            }

            var templateFile = $@"{templateFolder}\Template\{templateName}.cshtml";

            using (var stream = new StreamReader(templateFile))
            {
                var template = stream.ReadToEnd();

                return string.Empty;
            }
        }
    }
}
