using System;
using System.Collections.Generic;
using System.Web;
using Microsoft.Extensions.Caching.Memory;

namespace Mercurius.Prime.Core.Cache
{
    /// <summary>
    /// 采用Asp.Net自带的缓存。
    /// </summary>
    public class DefaultCacheProvider : CacheProvider
    {
        #region Properties

        /// <summary>
        /// 缓存对象
        /// </summary>
        public IMemoryCache Cache { get; set; }

        #endregion

        #region Overrides

        /// <summary>
        /// 将数据添加到缓存。
        /// </summary>
        /// <param name="key">键</param>
        /// <param name="value">值</param>
        /// <param name="timeSpan">保存时间</param>
        public override void Add<T>(string key, T value, TimeSpan? timeSpan = null)
        {
            if (timeSpan.HasValue)
            {
                this.Cache.Set(key, value, timeSpan.Value);
            }
            else
            {
                this.Cache.Set(key, value);
            }
        }

        /// <summary>
        /// 移除缓存。
        /// </summary>
        /// <param name="key">键</param>
        public override void Remove(string key)
        {
            this.Cache.Remove(key);
        }

        /// <summary>
        /// 移除以指定键开始的缓存。
        /// </summary>
        /// <param name="key">键</param>
        public override void RemoveStarts(string key)
        {

        }

        /// <summary>
        /// 清空缓存。
        /// </summary>
        public override void Clear()
        {

        }

        /// <summary>
        /// 获取缓存中的数据(json格式)。
        /// </summary>
        /// <param name="key">键</param>
        /// <returns>值</returns>
        public override string Get(string key)
        {
            var obj = this.Cache.Get(key);

            return obj.AsJson();
        }

        /// <summary>
        /// 获取缓存中的数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="key">键</param>
        /// <returns>值</returns>
        public override T Get<T>(string key)
        {
            return this.Cache.Get<T>(key);
        }

        /// <summary>
        /// 获取所有缓存键。
        /// </summary>
        /// <returns>缓存键集合</returns>
        public override IList<string> GetAllKeys()
        {
            return null;
        }

        #endregion
    }
}
