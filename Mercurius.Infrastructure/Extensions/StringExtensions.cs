using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace Mercurius.Infrastructure
{
    /// <summary>
    /// 字符串处理扩展方法。
    /// </summary>
    public static class StringExtensions
    {
        #region 字段

        private const int IndentSize = 4;
        private const int WrapThreshold = 120;
        private const string BlockElements = "div|p|img|ul|ol|li|h[1-6]|blockquote";

        private static readonly string NewLine = Environment.NewLine;
        private static readonly int NewLineLength = Environment.NewLine.Length;
        private static readonly Regex EmptyTagRegex = new Regex("^<.*/>$", RegexOptions.Compiled);
        private static readonly Regex BrTagRegex = new Regex("^<br\\s*/>$", RegexOptions.Compiled);
        private static readonly Regex ClosingBlockRegex = new Regex("</(" + BlockElements + ")>", RegexOptions.IgnoreCase | RegexOptions.Compiled);
        private static readonly Regex OpeningBlockRegex = new Regex("<(" + BlockElements + ")[^>]*>", RegexOptions.IgnoreCase | RegexOptions.Compiled);

        private static int indentLevel;

        #endregion

        #region 公开方法

        /// <summary>
        /// 获取字符串的实际长度（如是英文字符，则长度为1，中文字符长度为2）。
        /// </summary>
        /// <param name="str">字符串</param>
        /// <returns>字符串的实际长度</returns>
        public static int RealLength(this string str)
        {
            if (string.IsNullOrEmpty(str))
            {
                return 0;
            }

            var result = 0;
            var encoding = new ASCIIEncoding();
            var bytes = encoding.GetBytes(str);

            foreach (var t in bytes)
            {
                if (t == 63)
                {
                    result++;
                }

                result++;
            }

            return result;
        }

        /// <summary>
        /// 将文本转换为整型。
        /// </summary>
        /// <param name="text">文本</param>
        /// <param name="defaultValue">文本为空或转换不成功的默认值</param>
        /// <returns>整型</returns>
        public static int AsInt32(this string text, int defaultValue = 0)
        {
            return text.IsDigit() ? int.Parse(text) : defaultValue;
        }

        /// <summary>
        /// 将文本转换为Guid类型数据。
        /// </summary>
        /// <param name="text">文本</param>
        /// <returns>Guid数据</returns>
        public static Guid? AsGuid(this string text)
        {
            Guid result;

            var isSuccess = Guid.TryParse(text, out result);

            return isSuccess ? result : (Guid?)null;
        }

        /// <summary>
        /// 判断字符串是否为数字。
        /// </summary>
        /// <param name="text">字符串</param>
        /// <returns>字符串是否为数字</returns>
        public static bool IsDigit(this string text)
        {
            if (string.IsNullOrWhiteSpace(text))
            {
                return false;
            }

            decimal digit;
            var result = decimal.TryParse(text, out digit);

            return result;
        }

        /// <summary>
        /// 将数据集合以指定的字符串串连起来。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="sources">数据集合</param>
        /// <param name="separator">分隔符</param>
        /// <param name="handler">回调处理</param>
        /// <returns>串连后的结果</returns>
        public static string Contract<T>(this IEnumerable<T> sources, string separator = ",", Func<T, string> handler = null)
        {
            var result = new StringBuilder();

            if (sources != null)
            {
                var count = sources.Count();

                for (var i = 0; i < count; i++)
                {
                    var item = sources.ElementAt(i);

                    var str = Convert.ToString(item);

                    if (handler != null)
                    {
                        str = handler(item);
                    }

                    if (i + 1 < count)
                    {
                        result.AppendFormat("{0}{1}", str, separator);
                    }
                    else
                    {
                        result.Append(str);
                    }
                }
            }

            return result.ToString();
        }

        #region html文本处理

        /// <summary>
        /// 对html文本进行标签缩排。
        /// </summary>
        /// <param name="html">html文本</param>
        /// <returns>处理后的结果</returns>
        public static string IndentTags(this string html)
        {
            var indenting = true;

            html = new Regex("(<[\\w][\\w\\d]*[^>]*>)|(</[\\w][\\w\\d]*>)", RegexOptions.IgnoreCase).Replace(
                html,
                m =>
                {
                    var token = m.Groups[0].Value;
                    var result = new StringBuilder();
                    var currentIndent = NewLine.PadRight(NewLineLength + IndentSize * indentLevel);

                    if (OpeningBlockRegex.IsMatch(token))
                    {
                        if (!indenting)
                        {
                            result.Append(currentIndent);
                        }

                        if (!EmptyTagRegex.IsMatch(token))
                        {
                            ++indentLevel;
                        }

                        while (token.Length > WrapThreshold)
                        {
                            var splitPoint = token.Substring(0, WrapThreshold).LastIndexOf(' ');

                            result.Append(token.Substring(0, splitPoint)).Append(NewLine.PadRight(NewLineLength + IndentSize * (indentLevel + 1)));

                            token = token.Substring(splitPoint);
                        }

                        result.Append(token).Append(NewLine.PadRight(NewLineLength + IndentSize * indentLevel));

                        indenting = true;
                    }
                    else if (ClosingBlockRegex.IsMatch(token))
                    {
                        result.Append(NewLine.PadRight(NewLineLength + IndentSize * (--indentLevel))).Append(token);
                        indenting = false;
                    }
                    else if (BrTagRegex.IsMatch(token))
                    {
                        result.Append(token).Append(NewLine.PadRight(NewLineLength + IndentSize * indentLevel));
                        indenting = false;
                    }
                    else
                    {
                        result.Append(token);
                        indenting = false;
                    }

                    return result.ToString();
                });

            return html;
        }

        /// <summary>
        /// 对html文本进行换行处理。
        /// </summary>
        /// <param name="html">html文本</param>
        /// <returns>处理后的结果</returns>
        public static string WordWrap(this string html)
        {
            var lines = html.Split(new[] { NewLine }, StringSplitOptions.RemoveEmptyEntries);

            for (var i = 0; i < lines.Length; i++)
            {
                if (lines[i].Length <= WrapThreshold)
                {
                    continue;
                }

                var result = new StringBuilder();

                var currentLine = lines[i];

                var currentLineIndentSize = new Regex("^\\s+").Match(currentLine).Length;

                while (currentLine.Length > WrapThreshold)
                {
                    var splitPoint = currentLine.Substring(0, WrapThreshold - IndentSize).LastIndexOf(' ');

                    if (splitPoint < 0)
                    {
                        splitPoint = WrapThreshold; // cuts though code, though
                    }

                    result.Append(currentLine.Substring(0, splitPoint))
                          .Append(NewLine.PadRight(NewLineLength + currentLineIndentSize + IndentSize));

                    currentLine = currentLine.Substring(splitPoint + 1);
                }

                result.Append(currentLine);

                lines[i] = result.ToString();
            }

            return string.Join(NewLine, lines);
        }

        /// <summary>
        /// 对html文本进行缩排处理。
        /// </summary>
        /// <param name="html">html文本</param>
        /// <returns>处理后的结果</returns>
        public static string IndentHtml(this string html)
        {
            return html.TrimHtmlWhiteSpace()
                       .IndentTags()
                       .WordWrap();
        }

        #endregion

        #region 命名规范

        /// <summary>
        /// 将字符串转换为符合命名规范的类名。
        /// </summary>
        /// <param name="tableName">源字符串</param>
        /// <returns>符合命名规范的类名</returns>
        public static string AsClassName(this string tableName)
        {
            var result = string.Empty;

            if (!string.IsNullOrWhiteSpace(tableName))
            {
                result = tableName.Replace(" ", string.Empty);

                if (tableName.StartsWith("tb", true, CultureInfo.CurrentCulture))
                {
                    result = tableName.Replace("tb", string.Empty);
                }
            }

            if (result.EndsWith("ies", StringComparison.OrdinalIgnoreCase))
            {
                result = $"{result.Substring(0, result.Length - 3)}y";
            }
            else if (result.EndsWith("s", StringComparison.OrdinalIgnoreCase))
            {
                result = result.Substring(0, result.Length - 1);
            }

            return result.PascalNaming();
        }

        /// <summary>
        /// 将字符串转换为符合命名规范的类名复数形式。
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <returns>类名的复数形式</returns>
        public static string PluralClassName(this string tableName)
        {
            var result = tableName.AsClassName();

            // 以fe、f结尾的，将fe或f变为ves。
            if (result.EndsWith("fe") || result.EndsWith("f"))
            {
                return result.Substring(0, result.LastIndexOf('f')) + "ves";
            }

            // 以s、sh、ch、x结尾的，加es。
            if (result.EndsWith("s") || result.EndsWith("sh") || result.EndsWith("ch") || result.EndsWith("x"))
            {
                return result + "es";
            }

            // 以辅音加y结尾的，将y变成ies。
            if (!(result.EndsWith("a") || result.EndsWith("e") || result.EndsWith("i") || result.EndsWith("o") || result.EndsWith("u")))
            {
                return result.Substring(0, result.Length - 1) + "ies";
            }

            return result + "s";
        }

        /// <summary>
        /// 取得按帕斯卡命名规范的字符串(首字符大写其他单词开始字符大写)。
        /// </summary>
        /// <param name="str">源字符串</param>
        /// <returns>符合帕斯卡命名规范的字符串</returns>
        public static string PascalNaming(this string str)
        {
            var result = string.Empty;

            if (!string.IsNullOrWhiteSpace(str))
            {
                var temps = str.Split('_', ' ');

                foreach (var temp in temps.Where(temp => !string.IsNullOrWhiteSpace(temp)))
                {
                    result += char.ToUpper(temp[0]) + (temp.Length > 1 ? temp.Substring(1).AsNamingLower() : string.Empty);
                }
            }

            return result;
        }

        /// <summary>
        /// 取得按Camel命名规范的字符串(首字符小写其他单词开始字符大写)。
        /// </summary>
        /// <param name="str">源字符串</param>
        /// <returns>符合Camel命名规范的字符串</returns>
        public static string CamelNaming(this string str)
        {
            var result = string.Empty;

            if (!string.IsNullOrWhiteSpace(str))
            {
                var temps = str.Split('_');

                if (temps[0].Length > 0)
                {
                    result = char.ToLower(temps[0][0]) + temps[0].Substring(1).AsNamingLower();
                }

                if (temps.Length > 1)
                {
                    for (var i = 1; i < temps.Length; i++)
                    {
                        var temp = temps[i];

                        if (!string.IsNullOrWhiteSpace(temp))
                        {
                            result += char.ToUpper(temp[0]) + (temp.Length > 1 ? temp.Substring(1).AsNamingLower() : string.Empty);
                        }
                    }
                }
            }

            return result;
        }

        /// <summary>
        /// 将字符串转换为符合命名规范的小写形式。
        /// </summary>
        /// <param name="str">源字符串</param>
        /// <returns>转换后的字符串</returns>
        public static string AsNamingLower(this string str)
        {
            var result = string.Empty;

            if (!string.IsNullOrWhiteSpace(str))
            {
                result = str.IsAllUpperChars() ? str.ToLower() : str;
            }

            return result;
        }

        #endregion

        #endregion

        #region 私有方法

        private static bool IsAllUpperChars(this string chars)
        {
            return !chars.Any(char.IsLower);
        }

        private static string TrimHtmlWhiteSpace(this string html)
        {
            return new Regex("(\\s|\t|\n|\r)+").Replace(html, " ");
        }

        #endregion
    }
}
