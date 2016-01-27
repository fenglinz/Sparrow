using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Diagnostics;

namespace Mercurius.Infrastructure
{
    /// <summary>
    /// 集合扩展方法。
    /// </summary>
    public static class CollectionExtensions
    {
        #region 公开方法

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

        /// <summary>
        /// 将集合转换为树形集合。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="sources">数据源</param>
        /// <param name="parentPredicate">父节点查询条件</param>
        /// <param name="childrenPredicate">子节点查询回调</param>
        /// <param name="mappingHandler">数据映射</param>
        /// <returns>树形集合</returns>
        public static IList<TreeNode> AsTree<T>(
            this IEnumerable<T> sources,
            Func<T, bool> parentPredicate,
            Func<T, T, bool> childrenPredicate,
            Func<T, TreeNode> mappingHandler)
        {
            if (sources.IsEmpty())
            {
                return null;
            }

            var parents = sources.Where(parentPredicate);

            if (!parents.IsEmpty())
            {
                var result = new List<TreeNode>();

                foreach (var parent in parents)
                {
                    var treeNode = mappingHandler(parent);

                    treeNode.Children = GetChildrenTreeNode(sources, parent, childrenPredicate, mappingHandler);

                    result.Add(treeNode);
                }

                return result;
            }

            return null;
        }

        /// <summary>
        /// 将层级集合转换为树结构。
        /// </summary>
        /// <typeparam name="T">层级集合项类型</typeparam>
        /// <typeparam name="K">Id,ParentId类型</typeparam>
        /// <param name="sources">层级集合</param>
        /// <param name="textFunc">获取树文本回调</param>
        /// <param name="selectedFunc">选中回调</param>
        /// <returns>树结构集合</returns>
        public static IList<TreeNode> AsTree<T, K>(
            this IEnumerable<T> sources,
            Func<T, string> textFunc,
            Func<T, bool> selectedFunc = null) where T : IHierarchy<K>
        {
            if (sources.IsEmpty())
            {
                return null;
            }

            return sources.AsTree<T>(
                item => Convert.ToString(item.ParentId) == string.Empty || Convert.ToString(item.ParentId) == "0",
                (parent, item) => parent.Id.Equals(item.ParentId),
                item => new TreeNode
                {
                    Id = Convert.ToString(item.Id),
                    Text = textFunc(item),
                    Checked = selectedFunc != null && selectedFunc(item)
                });
        }

        /// <summary>
        /// 将集合按层级排序。
        /// </summary>
        /// <typeparam name="R">集合项类型</typeparam>
        /// <typeparam name="T">Id,ParentId类型</typeparam>
        /// <param name="sources">集合信息</param>
        /// <returns>安层级排序后的集合信息</returns>
        public static IList<R> AsSorted<R, T>(this IEnumerable<R> sources) where R : IHierarchy<T>
        {
            var result = new List<R>();

            if (sources.IsEmpty())
            {
                return result;
            }

            var parents = sources.Where(s => Convert.ToString(s.ParentId) == string.Empty || Convert.ToString(s.ParentId) == "0").OrderBy(s => s.Sort);

            foreach (var item in parents)
            {
                var children = GetSortedChildren(sources, item.Id);

                result.Add(item);

                if (!children.IsEmpty())
                {
                    result.AddRange(children);
                }
            }

            return result;
        }

        /// <summary>
        /// 判断是否为父级。
        /// </summary>
        /// <typeparam name="T">Id,ParentId类型</typeparam>
        /// <param name="sources">层级集合</param>
        /// <param name="parentId">父Id</param>
        /// <returns></returns>
        public static bool IsParent<T>(this IEnumerable<IHierarchy<T>> sources, T parentId)
        {
            if (sources.IsEmpty() || Convert.ToString(parentId) == string.Empty)
            {
                return false;
            }

            return sources.GroupBy(s => s.ParentId).Count() == 1 || sources.Any(h => parentId.Equals(h.ParentId));
        }

        #endregion

        #region 私有方法

        private static IList<TreeNode> GetChildrenTreeNode<T>(
            IEnumerable<T> sources,
            T parent,
            Func<T, T, bool> childrenPredicate,
            Func<T, TreeNode> mappingHandler)
        {
            var children = sources.Where(s => childrenPredicate(parent, s));

            if (children.IsEmpty())
            {
                return null;
            }

            var nodes = new List<TreeNode>();

            foreach (var item in children)
            {
                var treeNode = mappingHandler(item);
                var childrenNodes = GetChildrenTreeNode(sources, item, childrenPredicate, mappingHandler);

                if (!childrenNodes.IsEmpty())
                {
                    treeNode.Children = childrenNodes;
                }

                nodes.Add(treeNode);
            }

            return nodes;
        }

        private static IEnumerable<R> GetSortedChildren<R, T>(IEnumerable<R> sources, T parentId) where R : IHierarchy<T>
        {
            var result = new List<R>();
            IEnumerable<R> children = sources.Where(s => parentId.Equals(s.ParentId)).OrderBy(s => s.Sort);

            if (children.IsEmpty())
            {
                return null;
            }

            foreach (var item in children)
            {
                children = GetSortedChildren(sources, item.Id);

                result.Add(item);

                if (!children.IsEmpty())
                {
                    result.AddRange(children);
                }
            }

            return result;
        }

        #endregion
    }
}
