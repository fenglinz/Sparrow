using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using Mercurius.Prime.Core;

namespace Mercurius.Prime.Data.Service
{
    /// <summary>
    /// 类型映射项
    /// </summary>
    internal class MappingItem
    {
        #region Properties

        /// <summary>
        /// 源类型
        /// </summary>
        public Type Source { get; set; }

        /// <summary>
        /// 目标类型
        /// </summary>
        public Type Target { get; set; }

        /// <summary>
        /// 参数表达式树
        /// </summary>
        public ParameterExpression ParameterExpression { get; set; }

        /// <summary>
        /// 类型绑定
        /// </summary>
        public IList<MemberBinding> MemberBindings { get; set; }

        #endregion
    }

    /// <summary>
    /// dto转换工具类。
    /// </summary>
    public static class DtoUtils
    {
        #region Fields

        /// <summary>
        /// 线程锁
        /// </summary>
        private static object locker = new object();

        /// <summary>
        /// 映射项缓存
        /// </summary>
        private static readonly IList<MappingItem> mappingItems = new List<MappingItem>();

        #endregion

        #region Constructors

        /// <summary>
        /// 静态构造方法
        /// </summary>
        static DtoUtils()
        {

        }

        #endregion

        #region Public Methods

        /// <summary>
        /// 将源类型转换为目标类型数据.
        /// </summary>
        /// <typeparam name="S">源类型</typeparam>
        /// <typeparam name="T">目标类型</typeparam>
        /// <param name="s">源类型数据</param>
        /// <param name="opts">转换映射处理</param>
        /// <returns>目标类型</returns>
        public static T As<S, T>(this S s)
        {
            return GetMappingFunc<S, T>()(s);
        }

        /// <summary>
        /// 将源类型转换为目标类型数据.
        /// </summary>
        /// <typeparam name="S">源类型</typeparam>
        /// <typeparam name="T">目标类型</typeparam>
        /// <param name="s">源类型数据</param>
        /// <param name="opts">转换映射处理</param>
        /// <returns>目标类型</returns>
        public static IEnumerable<T> As<S, T>(this IEnumerable<S> sources)
        {
            if (sources.IsEmpty())
            {
                return null;
            }

            return sources.AsJson().AsObject<IEnumerable<T>>();
        }

        #endregion

        #region Private Methods

        /// <summary>
        /// 获取类型映射处理函数
        /// </summary>
        /// <typeparam name="S">源类型</typeparam>
        /// <typeparam name="T">目标类型</typeparam>
        /// <returns>映射处理函数</returns>
        private static Func<S, T> GetMappingFunc<S, T>()
        {
            lock (locker)
            {
                var source = typeof(S);
                var target = typeof(T);
                var mappingItem = mappingItems.FirstOrDefault(m => m.Source == source && m.Target == target);

                if (mappingItem == null)
                {
                    var parameterExpression = Expression.Parameter(source, "p");
                    var memberBindingList = new List<MemberBinding>();

                    foreach (var item in target.GetProperties())
                    {
                        if (!item.CanWrite)
                        {
                            continue;
                        }

                        var sourceProperty = source.GetProperty(item.Name);

                        if (sourceProperty == null)
                        {
                            continue;
                        }

                        if (sourceProperty.PropertyType != item.PropertyType)
                        {
                            continue;
                        }

                        var memberProperty = Expression.Property(parameterExpression, sourceProperty);

                        MemberBinding memberBinding = Expression.Bind(item, memberProperty);

                        memberBindingList.Add(memberBinding);
                    }

                    mappingItem = new MappingItem
                    {
                        Source = source,
                        Target = target,
                        ParameterExpression = parameterExpression,
                        MemberBindings = memberBindingList
                    };

                    mappingItems.Add(mappingItem);
                }

                var memberInitExpression = Expression.MemberInit(Expression.New(target), mappingItem.MemberBindings);
                var lambda = Expression.Lambda<Func<S, T>>(memberInitExpression, new ParameterExpression[] { mappingItem.ParameterExpression });

                return lambda.Compile();
            }
        }

        #endregion
    }
}
