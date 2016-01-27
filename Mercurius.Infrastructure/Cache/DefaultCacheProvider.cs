using System;
using System.Web;
using SysCache = System.Web.Caching.Cache;

namespace Mercurius.Infrastructure.Cache
{
    /// <summary>
    /// ICacheProvider接口的默认实现(采用Asp.Net自带的缓存)。
    /// </summary>
    public class DefaultCacheProvider : ICacheProvider
    {
        #region ICacheProvider接口实现

        /// <summary>
        /// 将数据添加到缓存。
        /// </summary>
        /// <param name="key">键</param>
        /// <param name="value">值</param>
        /// <param name="timeSpan">保存时间</param>
        public void Add(string key, object value, TimeSpan? timeSpan = null)
        {
            HttpRuntime.Cache.Insert(
                key,
                value,
                null,
                SysCache.NoAbsoluteExpiration,
                timeSpan.HasValue ? timeSpan.Value : SysCache.NoSlidingExpiration);
        }

        /// <summary>
        /// 移除缓存。
        /// </summary>
        /// <param name="key">键</param>
        public void Remove(string key)
        {
            HttpRuntime.Cache.Remove(key);
        }

        /// <summary>
        /// 移除以指定键开始的缓存。
        /// </summary>
        /// <param name="key">键</param>
        public void RemoveStarts(string key)
        {
            var enumerator = HttpRuntime.Cache.GetEnumerator();

            while (enumerator.MoveNext())
            {
                var currentKey = enumerator.Key.ToString();

                if (currentKey.StartsWith(key))
                {
                    HttpRuntime.Cache.Remove(enumerator.Key.ToString());
                }
            }
        }

        /// <summary>
        /// 清空缓存。
        /// </summary>
        public void Clear()
        {
            var enumerator = HttpRuntime.Cache.GetEnumerator();

            while (enumerator.MoveNext())
            {
                HttpRuntime.Cache.Remove(enumerator.Key.ToString());
            }
        }

        /// <summary>
        /// 获取缓存中的数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="key">键</param>
        /// <returns>值</returns>
        public T Get<T>(string key)
        {
            return (T)HttpRuntime.Cache.Get(key);
        }

        #endregion
    }
}
