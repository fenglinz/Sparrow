using System;
using System.Collections.Generic;
using System.Reflection;
using Mercurius.Prime.Core.Entity;
using Newtonsoft.Json;

namespace Mercurius.Prime.Core.Cache
{
    /// <summary>
    /// 缓存提供者抽象类。
    /// </summary>
    public abstract class CacheProvider
    {
        #region 静态字段

        /// <summary>
        /// 缓存键前缀。
        /// </summary>
        private static readonly Dictionary<Type, string> _dictCacheKeyPrefix;

        #endregion

        #region 构造方法

        /// <summary>
        /// 静态构造方法。
        /// </summary>
        static CacheProvider()
        {
            _dictCacheKeyPrefix = new Dictionary<Type, string>();
        }

        #endregion

        #region 缓存键

        /// <summary>
        /// 获取缓存键。
        /// </summary>
        /// <param name="prefix">前缀</param>
        /// <param name="key">键</param>
        /// <param name="value">值</param>
        /// <returns>缓存键</returns>
        public string GetCacheKey(string prefix, string key, object value = null)
        {
            var cacheKeyFormat = $"{this.GetCacheKeyPrefix(prefix)}_{(value == null ? "{0}{1}" : "{0}_{1}")}";

            return string.Format(
                cacheKeyFormat,
                key,
                value == null
                    ? string.Empty
                    : JsonConvert.SerializeObject(value)
                        .Replace("{", string.Empty)
                        .Replace("}", string.Empty)
                        .Replace("[", string.Empty)
                        .Replace("]", string.Empty)
                        .Replace(@"\", string.Empty)
                        .Replace("\"", string.Empty)
                        .Replace('.', '_')
                        .Replace(':', '_')
                        .Replace(',', '_'));
        }

        /// <summary>
        /// 获取缓存键。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="key">键</param>
        /// <param name="value">查询参数</param>
        /// <returns>缓存键</returns>
        public string GetCacheKey<T>(string key, object value = null)
        {
            var prefix = GetCacheKeyPrefix(typeof(T));

            return GetCacheKey(prefix, key, value);
        }

        /// <summary>
        /// 获取缓存键。
        /// </summary>
        /// <param name="type">缓存数据类型</param>
        /// <param name="key">键</param>
        /// <param name="value">查询参数</param>
        /// <returns>缓存键</returns>
        public string GetCacheKey(Type type, string key, object value = null)
        {
            var prefix = GetCacheKeyPrefix(type);

            return GetCacheKey(prefix, key, value);
        }

        #endregion

        #region 抽象方法

        /// <summary>
        /// 将数据添加到缓存。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="key">键</param>
        /// <param name="value">值</param>
        /// <param name="timeSpan">保存时间</param>
        public abstract void Add<T>(string key, T value, TimeSpan? timeSpan = null);

        /// <summary>
        /// 移除缓存。
        /// </summary>
        /// <param name="key">键</param>
        public abstract void Remove(string key);

        /// <summary>
        /// 移除以指定键开始的缓存。
        /// </summary>
        /// <param name="key">键</param>
        public abstract void RemoveStarts(string key);

        /// <summary>
        /// 清空缓存。
        /// </summary>
        public abstract void Clear();

        /// <summary>
        /// 获取缓存中的数据(json格式)。
        /// </summary>
        /// <param name="key">键</param>
        /// <returns>值</returns>
        public abstract string Get(string key);

        /// <summary>
        /// 获取缓存中的数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="key">键</param>
        /// <returns>值</returns>
        public abstract T Get<T>(string key);

        /// <summary>
        /// 获取所有缓存键。
        /// </summary>
        /// <returns>缓存键集合</returns>
        public abstract IList<string> GetAllKeys();

        #endregion

        #region 私有方法

        /// <summary>
        /// 获取缓存键前缀。
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <returns>缓存键前缀</returns>
        private string GetCacheKeyPrefix(Type type)
        {
            if (!_dictCacheKeyPrefix.ContainsKey(type))
            {
                var tableAttribute = type.GetCustomAttribute<TableAttribute>();
                var tableName = tableAttribute == null ? type.Name : tableAttribute.Name;

                _dictCacheKeyPrefix.Add(type, tableName);
            }

            return _dictCacheKeyPrefix[type];
        }

        /// <summary>
        /// 获取缓存键前缀。
        /// </summary>
        /// <param name="prefix">前缀</param>
        /// <returns>缓存键前缀</returns>
        private string GetCacheKeyPrefix(string prefix)
        {
            return prefix.Replace('.', '_').ToUpper();
        }

        #endregion
    }
}
