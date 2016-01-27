using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace Mercurius.Infrastructure
{
    /// <summary>
    /// Json扩展。
    /// </summary>
    public static class JsonExtensions
    {
        /// <summary>
        /// 将数据序列化为json字符。
        /// </summary>
        /// <param name="source">数据</param>
        /// <returns>json字符串</returns>
        public static string AsJson(this object source)
        {
            if (source == null)
            {
                return null;
            }

            return JsonConvert.SerializeObject(source);
        }

        /// <summary>
        /// 将集合数据转换为Json数据。
        /// </summary>
        /// <typeparam name="T">集合数据项数据类型</typeparam>
        /// <param name="sources">集合对象</param>
        /// <param name="selector">数据选择表达式</param>
        /// <returns>Json字符串</returns>
        public static string AsJson<T>(this IEnumerable<T> sources, Func<T, object> selector = null)
        {
            if (sources == null)
            {
                return null;
            }

            return selector == null ? JsonConvert.SerializeObject(sources) : JsonConvert.SerializeObject(sources.Select(selector));
        }

        /// <summary>
        /// 将JSON字符串转换为实体数据。
        /// </summary>
        /// <typeparam name="T">实体数据类型</typeparam>
        /// <param name="source">JSON字符串</param>
        /// <returns>实体数据</returns>
        public static T AsObject<T>(this string source)
        {
            if (string.IsNullOrWhiteSpace(source))
            {
                return default(T);
            }

            return JsonConvert.DeserializeObject<T>(source);
        }

    }
}
