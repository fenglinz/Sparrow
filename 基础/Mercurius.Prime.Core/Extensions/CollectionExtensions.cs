using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;

namespace Mercurius.Prime.Core
{
    /// <summary>
    /// 集合扩展方法。
    /// </summary>
    public static class CollectionExtensions
    {
        #region Public Methods

        /// <summary>
        /// 判断集合是否为空(即null或者Count为0).
        /// </summary>
        /// <param name="collections">集合</param>
        /// <returns>是否为空</returns>
        public static bool IsEmpty(this IEnumerable collections)
        {
            if (collections == null)
            {
                return true;
            }

            return collections.GetEnumerator().MoveNext() == false;
        }

        /// <summary>
        /// 遍历集合。
        /// </summary>
        /// <typeparam name="T">集合元素的类型</typeparam>
        /// <param name="collections">集合</param>
        /// <param name="callback">元素处理回调方法</param>
        public static void ForEach<T>(this IEnumerable<T> collections, Action<T> callback)
        {
            if (collections.IsEmpty())
            {
                return;
            }

            foreach (var item in collections)
            {
                callback(item);
            }
        }

        /// <summary>
        /// 合并集合中的数据。
        /// </summary>
        /// <typeparam name="T1">数据类型1</typeparam>
        /// <typeparam name="T2">数据类型2</typeparam>
        /// <param name="items1">集合1</param>
        /// <param name="items2">几何</param>
        /// <param name="compare">合并条件</param>
        /// <param name="merge">合并处理</param>
        public static IEnumerable<T1> MergeDatas<T1, T2>(
            this IEnumerable<T1> items1,
            IEnumerable<T2> items2,
            Func<T1, T2, bool> compare,
            Action<T1, T2> merge)
        {
            if (items1.IsEmpty() || items2.IsEmpty())
            {
                return items1;
            }

            foreach (var item1 in items1)
            {
                foreach (var item2 in items2)
                {
                    if (compare(item1, item2))
                    {
                        merge(item1, item2);
                    }
                }
            }

            Debug.WriteLine("完成后：" + items1.AsJson());

            return items1;
        }

        #endregion
    }
}
