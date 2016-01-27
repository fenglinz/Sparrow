using System;
using System.Configuration;
using System.Linq;
using System.Threading.Tasks;
using Couchbase;

namespace Mercurius.Infrastructure.Cache
{
    /// <summary>
    /// 基于Couchbase的缓存提供者。
    /// </summary>
    public class CouchbaseCacheProvider : ICacheProvider
    {
        #region 字段

        private readonly Cluster _client;

        #endregion

        #region 属性

        /// <summary>
        /// Bucket名称。
        /// </summary>
        public string BucketName { get; set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        public CouchbaseCacheProvider()
        {
            this._client = new Cluster();
        }

        #endregion

        #region ICacheProvider接口实现

        /// <summary>
        /// 将数据添加到缓存。
        /// </summary>
        /// <param name="key">键</param>
        /// <param name="value">值</param>
        /// <param name="timeSpan">保存时间</param>
        public void Add(string key, object value, TimeSpan? timeSpan = null)
        {
            using (var bucket = this._client.OpenBucket(this.BucketName))
            {
                if (bucket.Exists(key))
                {
                    bucket.Upsert(key, value);
                }
                else
                {
                    bucket.Insert(key, value);
                }
            }
        }

        /// <summary>
        /// 移除缓存。
        /// </summary>
        /// <param name="key">键</param>
        public void Remove(string key)
        {
            using (var bucket = this._client.OpenBucket(this.BucketName))
            {
                if (bucket.Exists(key))
                {
                    bucket.Remove(key);
                }
            }
        }

        /// <summary>
        /// 移除以指定键开始的缓存。
        /// </summary>
        /// <param name="key">键</param>
        public void RemoveStarts(string key)
        {
            using (var bucket = this._client.OpenBucket(this.BucketName))
            {
                var query = bucket.CreateQuery("cache", "GetCacheKeys").Limit(int.MaxValue);
                var rows = from r in bucket.Query<string>(query).Rows where r.Value.StartsWith(key) select r.Value;

                bucket.Remove(rows.ToList());
            }
        }

        /// <summary>
        /// 清空缓存。
        /// </summary>
        public void Clear()
        {
            using (var bucket = _client.OpenBucket(this.BucketName))
            {
                var query = bucket.CreateQuery("cache", "GetCacheKeys").Limit(int.MaxValue);
                var rows = bucket.Query<string>(query).Rows.Select(r => r.Value).ToList();

                bucket.Remove(rows);
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
            using (var bucket = this._client.OpenBucket(this.BucketName))
            {
                return bucket.Get<T>(key).Value;
            }
        }

        #endregion
    }
}
