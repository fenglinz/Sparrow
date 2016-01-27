using System;

namespace Mercurius.Infrastructure.Cache
{
    /// <summary>
    /// 缓存提供者接口。
    /// </summary>
    public interface ICacheProvider
    {
        /// <summary>
        /// 将数据添加到缓存。
        /// </summary>
        /// <param name="key">键</param>
        /// <param name="value">值</param>
        /// <param name="timeSpan">保存时间</param>
        void Add(string key, object value, TimeSpan? timeSpan = null);

        /// <summary>
        /// 移除缓存。
        /// </summary>
        /// <param name="key">键</param>
        void Remove(string key);

        /// <summary>
        /// 移除以指定键开始的缓存。
        /// </summary>
        /// <param name="key">键</param>
        void RemoveStarts(string key);

        /// <summary>
        /// 清空缓存。
        /// </summary>
        void Clear();

        /// <summary>
        /// 获取缓存中的数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="key">键</param>
        /// <returns>值</returns>
        T Get<T>(string key);
    }
}
