using System;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using Mercurius.Prime.Core;

namespace Goldensoft.OpenApi.WeChat.Requests
{
    /// <summary>
    /// 支付请求基类
    /// </summary>
    public abstract class PayRequestBase : ModelBase
    {
        #region Consts

        /// <summary>
        /// md5加密方式
        /// </summary>
        public const string SIGN_TYPE_MD5 = "MD5";

        /// <summary>
        /// sha256加密方式
        /// </summary>
        public const string SIGN_TYPE_HMAC_SHA256 = "HMAC-SHA256";

        #endregion

        #region Properties

        /// <summary>
        /// 微信分配的公众账号ID(企业号corpid即为此appId)
        /// </summary>
        public virtual string AppId { get => base["appid"]; set => base["appid"] = value; }

        /// <summary>
        /// 随机字符串
        /// </summary>
        public virtual string NonceString { get => base["nonce_str"]; set => base["nonce_str"] = value; }

        /// <summary>
        /// 签名类型(目前支持HMAC-SHA256和MD5，默认为MD5)
        /// </summary>
        public virtual string SignType { get => base["sign_type"]; set => base["sign_type"] = value; }

        #endregion

        #region Constructor

        /// <summary>
        /// 默认构造方法
        /// </summary>
        public PayRequestBase()
        {
            this.SignType = SIGN_TYPE_HMAC_SHA256;

            var randomer = new RandomGenerator();

            this.NonceString = randomer.GetRandomUInt().ToString();
        }

        #endregion

        /// <summary>
        /// 设置签名
        /// </summary>
        /// <param name="request"></param>
        /// <param name="signType"></param>
        /// <param name="merchantPaymentKey"></param>
        public string MakeSign(string merchantPaymentKey)
        {
            var result = string.Empty;
            var builder = new StringBuilder();

            foreach (var pair in this.RequestDatas)
            {
                if (pair.Key != "sign" && pair.Value.IsNotBlank())
                {
                    builder.AppendFormat("{0}={1}&", pair.Key, pair.Value);
                }
            }

            // 在string后加入API KEY
            builder.AppendFormat("key={0}", merchantPaymentKey);

            if (this.SignType == SIGN_TYPE_MD5)
            {
                result = GetMD5Hash(builder.ToString());
            }
            else if (this.SignType == SIGN_TYPE_HMAC_SHA256)
            {
                result = GetHMACSHA256Hash(builder.ToString(), merchantPaymentKey);
            }
            else
            {
                throw new Exception("签名类型不合法！");
            }

            return result;
        }

        #region Private Methods

        private static string GetMD5Hash(string plainText)
        {
            using (var md5 = MD5.Create())
            {
                var bs = md5.ComputeHash(Encoding.UTF8.GetBytes(plainText));
                var sb = new StringBuilder();

                foreach (byte b in bs)
                {
                    sb.Append(b.ToString("x2"));
                }

                return sb.ToString().ToUpper();
            }
        }

        private static string GetHMACSHA256Hash(string plainText, string salt)
        {
            var result = "";
            var enc = Encoding.Default;

            var baText2BeHashed = enc.GetBytes(plainText);
            var baSalt = enc.GetBytes(salt);

            using (var hasher = new HMACSHA256(baSalt))
            {
                var baHashedText = hasher.ComputeHash(baText2BeHashed);

                result = string.Join("", baHashedText.ToList().Select(b => b.ToString("x2")).ToArray());

                return result.ToUpper();
            }
        }

        #endregion
    }
}
