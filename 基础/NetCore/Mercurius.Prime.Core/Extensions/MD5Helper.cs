using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;

namespace Mercurius.Prime.Core
{
    /// <summary>
    /// md5加密工具类
    /// </summary>
    public static class MD5Helper
    {
        /// <summary>
        /// 将字符串加密为MD5字符串
        /// </summary>
        /// <param name="value">原文</param>
        /// <returns>密文</returns>
        public static string EncryptMD5(this string value)
        {
            var result = string.Empty;

            if (string.IsNullOrEmpty(value)) return result;

            using (var md5 = MD5.Create())
            {
                result = GetMd5Hash(md5, value);
            }

            return result;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="md5Hash"></param>
        /// <param name="input"></param>
        /// <returns></returns>
        static string GetMd5Hash(MD5 md5Hash, string input)
        {
            var datas = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
            var sBuilder = new StringBuilder();

            foreach (var t in datas)
            {
                sBuilder.Append(t.ToString("x2"));
            }

            return sBuilder.ToString();
        }

        static bool VerifyMd5Hash(MD5 md5Hash, string input, string hash)
        {
            var hashOfInput = GetMd5Hash(md5Hash, input);
            var comparer = StringComparer.OrdinalIgnoreCase;

            return 0 == comparer.Compare(hashOfInput, hash);
        }
    }
}
