using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Prime.Core
{
    /// <summary>
    /// 跨站脚本安全字符检测。
    /// </summary>
    internal static class CrossSiteScriptingValidation
    {
        #region 字段

        private static readonly char[] StartingChars = { '<', '&' };

        #endregion

        // Only accepts http: and https: protocols, and protocolless urls.
        // Used by web parts to validate import and editor input on Url properties.
        // Review: is there a way to escape colon that will still be recognized by IE?
        // %3a does not work with IE.
        internal static bool IsDangerousUrl(string s)
        {
            if (string.IsNullOrEmpty(s))
            {
                return false;
            }

            // Trim the string inside this method, since a Url starting with whitespace
            // is not necessarily dangerous.  This saves the caller from having to pre-trim
            // the argument as well.
            s = s.Trim();

            var len = s.Length;

            if ((len > 4) &&
                ((s[0] == 'h') || (s[0] == 'H')) &&
                ((s[1] == 't') || (s[1] == 'T')) &&
                ((s[2] == 't') || (s[2] == 'T')) &&
                ((s[3] == 'p') || (s[3] == 'P')))
            {
                if ((s[4] == ':') ||
                    ((len > 5) && ((s[4] == 's') || (s[4] == 'S')) && (s[5] == ':')))
                {
                    return false;
                }
            }

            var colonPosition = s.IndexOf(':');
            return colonPosition != -1;
        }

        internal static bool IsValidJavascriptId(string id)
        {
            return string.IsNullOrEmpty(id) || System.CodeDom.Compiler.CodeGenerator.IsValidLanguageIndependentIdentifier(id);
        }

        internal static bool IsDangerousString(string s, out int matchIndex)
        {
            //bool inComment = false;
            matchIndex = 0;

            for (var i = 0; ; )
            {
                // Look for the start of one of our patterns
                var n = s.IndexOfAny(StartingChars, i);

                // If not found, the string is safe
                if (n < 0)
                {
                    return false;
                }

                // If it's the last char, it's safe
                if (n == s.Length - 1)
                {
                    return false;
                }

                matchIndex = n;

                switch (s[n])
                {
                    case '<':
                        // If the < is followed by a letter or '!', it's unsafe (looks like a tag or HTML comment)
                        if (IsAtoZ(s[n + 1]) || s[n + 1] == '!' || s[n + 1] == '/' || s[n + 1] == '?')
                        {
                            return true;
                        }

                        break;
                    case '&':
                        // If the & is followed by a #, it's unsafe (e.g. &#83;)
                        if (s[n + 1] == '#')
                        {
                            return true;
                        }

                        break;
                }

                // Continue searching
                i = n + 1;
            }
        }

        #region 私有方法

        /// <summary>
        /// 判断字符是否为a~z或者A~Z。
        /// </summary>
        /// <param name="c"></param>
        /// <returns></returns>
        private static bool IsAtoZ(char c)
        {
            return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z');
        }

        #endregion
    }
}
