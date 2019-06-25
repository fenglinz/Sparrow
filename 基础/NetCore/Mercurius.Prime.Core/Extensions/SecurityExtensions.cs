using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;
using Mercurius.Prime.Core.Configuration;

namespace Mercurius.Prime.Core
{
    /// <summary>
    /// md5加密工具类
    /// </summary>
    public static class SecurityExtensions
    {
        /// <summary>
        /// 将字符串加密为MD5字符串
        /// </summary>
        /// <param name="plainText">原文</param>
        /// <returns>密文</returns>
        public static string MD5Hash(this string plainText)
        {
            if (string.IsNullOrEmpty(plainText))
            {
                return string.Empty;
            }

            var result = string.Empty;

            using (var md5 = MD5.Create())
            {
                var builder = new StringBuilder();
                var datas = md5.ComputeHash(Encoding.UTF8.GetBytes(plainText));

                foreach (var t in datas)
                {
                    builder.Append(t.ToString("x2"));
                }

                result = builder.ToString();
            }

            return result;
        }

        /// <summary>
        /// AES加密(key,iv从配置文件中获取)
        /// </summary>
        /// <param name="plainText">原文</param>
        /// <returns>加密后的字符串</returns>
        public static string Encrypt(this string plainText)
        {
            var key = PlatformSection.Instance.Security?.AESKey;
            var iv = PlatformSection.Instance.Security?.AESIV;

            return AESHelper.Encode(plainText, key);
        }

        /// <summary>
        /// AES解密(key,iv从配置文件中获取)
        /// </summary>
        /// <param name="secretText">密文</param>
        /// <returns>解密后的字符串</returns>
        public static string Decrypt(this string secretText)
        {
            var key = PlatformSection.Instance.Security?.AESKey;
            var iv = PlatformSection.Instance.Security?.AESIV;

            return AESHelper.Decode(secretText, key);
        }

    }
}
