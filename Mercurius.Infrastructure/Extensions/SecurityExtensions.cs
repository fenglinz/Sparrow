using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Web.Configuration;
using System.Web.Hosting;
using System.Web.Security;

namespace Mercurius.Infrastructure
{
    /// <summary>
    /// 安全扩展。
    /// </summary>
    public static class SecurityExtensions
    {
        #region 字段

        private static readonly char[] punctuations = "!@#$%^&*()_-+=[{]};:>|./?".ToCharArray();

        #endregion

        #region 属性

        /// <summary>
        /// 获取或者设置定义控制密钥生成和算法的配置信息。
        /// </summary>
        public static MachineKeySection MachineKey { get; private set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 静态构造方法。
        /// </summary>
        static SecurityExtensions()
        {
            var config = WebConfigurationManager.OpenWebConfiguration(HostingEnvironment.ApplicationVirtualPath);

            MachineKey = (MachineKeySection)config.GetSection("system.web/machineKey");

            if (MachineKey.Decryption == "Auto")
            {
                MachineKey.DecryptionKey = KeyCreator.CreateKey(0x18);
                MachineKey.ValidationKey = KeyCreator.CreateKey(0x40);
            }
        }

        #endregion

        #region 验证码

        /// <summary>
        /// 生成验证码。
        /// </summary>
        /// <param name="length">验证码长度</param>
        /// <returns>生成的验证码字符串</returns>
        public static string CreateVerifyCode(int length)
        {
            var result = string.Empty;

            if (length > 0)
            {
                var random = new Random();

                for (var i = 0; i < length; i++)
                {
                    var number = random.Next();

                    if (number % 3 == 0)
                    {
                        result += (char)('A' + (char)(number % 26));
                    }
                    else
                    {
                        result += (char)('0' + (char)(number % 10));
                    }
                }
            }

            return result;
        }

        /// <summary>
        /// 根据字符串创建图片。
        /// </summary>
        /// <param name="str">字符串</param>
        /// <returns>验证码图</returns>
        public static byte[] CreateImage(this string str)
        {
            var image = new Bitmap((int)Math.Ceiling(str.Length * 12.4), 22);
            var graphics = Graphics.FromImage(image);

            try
            {
                // 生成随机生成器
                var random = new Random();

                // 清空图片背景色
                graphics.Clear(Color.White);

                // 画图片的干扰线
                for (var i = 0; i < 25; i++)
                {
                    var x1 = random.Next(image.Width);
                    var x2 = random.Next(image.Width);
                    var y1 = random.Next(image.Width);

                    graphics.DrawLine(new Pen(Color.Silver), x1, x2, y1, y1);
                }

                // 画文字
                var font = new Font("Arial", 12, FontStyle.Bold | FontStyle.Italic);
                var brush = new LinearGradientBrush(new Rectangle(0, 0, image.Width, image.Height), Color.Blue, Color.DarkRed, 1.2f, true);

                graphics.DrawString(str, font, brush, 1, 2);

                // 画图片前景干扰点
                for (var i = 0; i < 100; i++)
                {
                    var x = random.Next(image.Width);
                    var y = random.Next(image.Height);

                    image.SetPixel(x, y, Color.FromArgb(random.Next()));
                }

                // 画图片的边框
                graphics.DrawRectangle(new Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1);

                // 保存图片数据
                using (var stream = new MemoryStream())
                {
                    image.Save(stream, ImageFormat.Jpeg);

                    // 输出图片流
                    return stream.ToArray();
                }
            }
            finally
            {
                graphics.Dispose();
                image.Dispose();
            }
        }

        #endregion

        #region 加密字符串

        /// <summary>
        /// MD5加密。
        /// </summary>
        /// <param name="source">原文</param>
        /// <returns>密文</returns>
        public static string MD5(this string source)
        {
            if (string.IsNullOrWhiteSpace(source))
            {
                return null;
            }

            using (var md5 = new MD5CryptoServiceProvider())
            {
                return BitConverter.ToString(md5.ComputeHash(Encoding.UTF8.GetBytes(source))).Replace("-", "").ToLower();
            }
        }

        /// <summary>
        /// 加密字符串。
        /// </summary>
        /// <param name="source">原文</param>
        /// <param name="passwordFormat">加密格式</param>
        /// <returns>加密结果</returns>
        public static string Encrypt(this string source, MembershipPasswordFormat passwordFormat = MembershipPasswordFormat.Encrypted)
        {
            if (string.IsNullOrWhiteSpace(source))
            {
                return null;
            }

            string result = null;

            switch (passwordFormat)
            {
                // 不加密。
                case MembershipPasswordFormat.Clear:
                    result = source;

                    break;

                // 采用哈希加密算法。
                case MembershipPasswordFormat.Hashed:
                    using (var hashEncryptor = new HMACSHA1(KeyCreator.HexToByte(MachineKey.ValidationKey)))
                    {
                        result = Convert.ToBase64String(hashEncryptor.ComputeHash(Encoding.Unicode.GetBytes(source)));
                    }

                    break;

                // 采用对称加密。
                case MembershipPasswordFormat.Encrypted:
                    result = source.SymmetricEncryption(MachineKey.ValidationKey, MachineKey.DecryptionKey);

                    break;
            }

            return result;
        }

        /// <summary>
        /// 对称加密。
        /// </summary>
        /// <param name="source">原文</param>
        /// <param name="validationKey">验证密钥</param>
        /// <param name="decryptionKey">解密密钥</param>
        /// <returns>密文</returns>
        public static string SymmetricEncryption(this string source, string validationKey, string decryptionKey)
        {
            using (var rijn = new RijndaelManaged())
            {
                var memoryStream = new MemoryStream();

                rijn.Key = Encoding.UTF8.GetBytes(validationKey.Substring(0, 32));
                rijn.IV = Encoding.UTF8.GetBytes(decryptionKey.Substring(0, 16));

                var encryptor = rijn.CreateEncryptor(rijn.Key, rijn.IV);

                using (var cs = new CryptoStream(memoryStream, encryptor, CryptoStreamMode.Write))
                {
                    using (var sw = new StreamWriter(cs))
                    {
                        sw.Write(source);
                    }

                    var contents = memoryStream.ToArray();

                    return Convert.ToBase64String(contents);
                }
            }
        }

        #endregion

        #region 解密字符串

        /// <summary>
        /// 解密字符串。
        /// </summary>
        /// <param name="source">密文</param>
        /// <param name="passwordFormat">加密格式</param>
        /// <returns>解密结果</returns>
        public static string Decrypt(this string source, MembershipPasswordFormat passwordFormat = MembershipPasswordFormat.Encrypted)
        {
            string result = null;

            if (!string.IsNullOrWhiteSpace(source))
            {
                switch (passwordFormat)
                {
                    // 没有加密。
                    case MembershipPasswordFormat.Clear:
                        result = source;

                        break;

                    // 采用哈希加密的，不支持解密。
                    case MembershipPasswordFormat.Hashed:
                        throw new NotSupportedException("不支持对哈希加密的数据进行解密！");

                    // 解密采用对称加密算法的密文。
                    case MembershipPasswordFormat.Encrypted:
                        result = source.SymmetricDecryption(MachineKey.ValidationKey, MachineKey.DecryptionKey);

                        break;
                }
            }

            return result;
        }

        /// <summary>
        /// 对称解密。
        /// </summary>
        /// <param name="source">密文</param>
        /// <param name="validationKey">验证密钥</param>
        /// <param name="decryptionKey">解密密钥</param>
        /// <returns>原文</returns>
        public static string SymmetricDecryption(this string source, string validationKey, string decryptionKey)
        {
            var result = string.Empty;

            using (var rijn = new RijndaelManaged())
            {
                rijn.Key = Encoding.UTF8.GetBytes(validationKey.Substring(0, 32));
                rijn.IV = Encoding.UTF8.GetBytes(decryptionKey.Substring(0, 16));

                var inBytes = Convert.FromBase64String(source);
                var decryptor = rijn.CreateDecryptor(rijn.Key, rijn.IV);

                using (var ms = new MemoryStream(inBytes))
                {
                    using (var cs = new CryptoStream(ms, decryptor, CryptoStreamMode.Read))
                    {
                        using (var sr = new StreamReader(cs))
                        {
                            result = sr.ReadToEnd();
                        }
                    }
                }
            }

            return result;
        }

        #endregion

        #region 密码

        /// <summary>
        /// 生成新的随机密码。
        /// </summary>
        /// <param name="length">密码长度</param>
        /// <param name="numberOfNonAlphanumericCharacters">特殊字符个数</param>
        /// <param name="passwordFormat">密码加密方式</param>
        /// <returns>密码</returns>
        public static string NewRandomPassword(
            int length = 6,
            int numberOfNonAlphanumericCharacters = 1,
            MembershipPasswordFormat passwordFormat = MembershipPasswordFormat.Encrypted)
        {
            string password;
            int index;

            do
            {
                var buf = new byte[length];
                var cBuf = new char[length];
                var count = 0;

                (new RNGCryptoServiceProvider()).GetBytes(buf);

                for (var iter = 0; iter < length; iter++)
                {
                    var i = buf[iter] % 87;
                    if (i < 10)
                    {
                        cBuf[iter] = (char)('0' + i);
                    }
                    else if (i < 36)
                    {
                        cBuf[iter] = (char)('A' + i - 10);
                    }
                    else if (i < 62)
                    {
                        cBuf[iter] = (char)('a' + i - 36);
                    }
                    else
                    {
                        cBuf[iter] = punctuations[i - 62];
                        count++;
                    }
                }

                if (count < numberOfNonAlphanumericCharacters)
                {
                    int j;
                    var rand = new Random();

                    for (j = 0; j < numberOfNonAlphanumericCharacters - count; j++)
                    {
                        int k;
                        do
                        {
                            k = rand.Next(0, length);
                        }
                        while (!char.IsLetterOrDigit(cBuf[k]));

                        cBuf[k] = punctuations[rand.Next(0, punctuations.Length)];
                    }
                }

                password = new string(cBuf);
            }
            while (CrossSiteScriptingValidation.IsDangerousString(password, out index));

            return password.Encrypt();
        }

        #endregion
    }
}
