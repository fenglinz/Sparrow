using System;
using System.Collections.Generic;
using System.Text;

namespace Goldensoft.OpenApi.WeChat
{
    /// <summary>
    /// tokon管理器
    /// </summary>
    public class TokenManager
    {
        #region Fields

        private static object locker = new object();

        private static readonly Dictionary<string, CachedToken> tokenDatas = new Dictionary<string, CachedToken>();

        #endregion

        /// <summary>
        /// 获取token信息
        /// </summary>
        /// <param name="key">键</param>
        /// <returns>token信息</returns>
        public static Token GetToken(string key)
        {
            if (tokenDatas.ContainsKey(key))
            {
                var token = tokenDatas[key];

                if (DateTime.Now < token.BeginDateTime.AddSeconds(token.ExpiresIn))
                {
                    return token;
                }
                else
                {
                    return null;
                }
            }

            return null;
        }

        /// <summary>
        /// 保存token信息
        /// </summary>
        /// <param name="key">键</param>
        /// <param name="token">值</param>
        public static void SaveToken(string key, Token token)
        {
            lock (locker)
            {
                if (tokenDatas.ContainsKey(key))
                {
                    tokenDatas[key] = CachedToken.FromToken(token);
                }
                else
                {
                    tokenDatas.Add(key, CachedToken.FromToken(token));
                }
            }
        }

        #region Inner Class

        public class CachedToken : Token
        {
            public DateTime BeginDateTime { get; set; }

            public static CachedToken FromToken(Token token)
            {
                return token == null ? null : new CachedToken
                {
                    ErrorCode = token.ErrorCode,
                    ErrorMessage = token.ErrorMessage,
                    AccessToken = token.AccessToken,
                    RefreshToken = token.RefreshToken,
                    ExpiresIn = token.ExpiresIn,
                    OpenId = token.OpenId,
                    Scope = token.Scope,
                    BeginDateTime = DateTime.Now
                };
            }
        }

        #endregion
    }
}
