using System;
using System.Collections.Generic;
using System.Linq;
using AutoMapper;

namespace Mercurius.Prime.Data.Service
{
    internal class MappedItem
    {
        public Type Source { get; set; }

        public Type Target { get; set; }
    }

    /// <summary>
    /// dto转换工具类。
    /// </summary>
    public static class DtoUtils
    {
        #region Fields

        private static object locker = new object();

        [ThreadStatic]
        private static IList<MappedItem> mappedTypes = new List<MappedItem>();

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
        public static T As<S, T>(this S s, Action<IMappingOperationOptions> opts = null)
        {
            InitializeMapper<S, T>();

            return s == null ? default : Mapper.Map<T>(s, opts);
        }

        /// <summary>
        /// 将源类型转换为目标类型数据.
        /// </summary>
        /// <typeparam name="S">源类型</typeparam>
        /// <typeparam name="T">目标类型</typeparam>
        /// <param name="s">源类型数据</param>
        /// <param name="opts">转换映射处理</param>
        /// <returns>目标类型</returns>
        public static IEnumerable<T> As<S, T>(this IEnumerable<S> sources, Action<IMappingOperationOptions> opts = null)
        {
            InitializeMapper<S, T>();

            return sources == null ? null : Mapper.Map<IEnumerable<T>>(sources, opts);
        }

        #endregion

        #region Private Methods

        /// <summary>
        /// automapper初始化处理.
        /// </summary>
        /// <typeparam name="S">源类型</typeparam>
        /// <typeparam name="T">目标类型</typeparam>
        private static void InitializeMapper<S, T>()
        {
            lock (locker)
            {
                var sourceType = typeof(S);
                var targetType = typeof(T);

                if (!mappedTypes.Any(i => i.Source == sourceType && i.Target == targetType))
                {
                    Mapper.Initialize(cfg =>
                    {
                        cfg.CreateMap<S, T>();
                    });

                    mappedTypes.Add(new MappedItem { Source = sourceType, Target = targetType });
                }
            }
        }

        #endregion
    }
}
