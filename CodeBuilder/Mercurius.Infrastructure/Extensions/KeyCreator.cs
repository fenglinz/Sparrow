using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Infrastructure
{
   /// <summary>
    /// 密钥生成器。
    /// </summary>
    public static class KeyCreator
    {
        /// <summary>
        /// 产生随机密钥。
        /// </summary>
        /// <param name="count">密钥长度</param>
        /// <returns>密钥</returns>
        public static string CreateKey(int count)
        {
            var bytes = new byte[count];

            using (var cryptoServiceProvider = new RNGCryptoServiceProvider())
            {
                cryptoServiceProvider.GetBytes(bytes);

                return BytesToHexString(bytes);
            }
        }

        /// <summary>
        /// 将16进制字符串转换为字节数组。
        /// </summary>
        /// <param name="hexString">16进制字符串</param>
        /// <returns>字节数组</returns>
        public static byte[] HexToByte(string hexString)
        {
            var buffer = new byte[(hexString.Length / 2) + 1];

            for (var i = 0; i <= ((hexString.Length / 2) - 1); i++)
            {
                buffer[i] = Convert.ToByte(hexString.Substring(i * 2, 2), 0x10);
            }

            return buffer;
        }

        /// <summary>
        /// 将字节数组转换为16进制字符串。
        /// </summary>
        /// <param name="bytes">字节数组</param>
        /// <returns>16进制字符串</returns>
        public static string BytesToHexString(byte[] bytes)
        {
            var builder = new StringBuilder(0x40);

            foreach (byte t in bytes)
            {
                builder.Append($"{t:X2}");
            }

            return builder.ToString();
        }
    }
}
