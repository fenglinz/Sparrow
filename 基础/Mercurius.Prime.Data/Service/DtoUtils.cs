using System;
using System.Collections.Generic;
using System.Linq;
using AutoMapper;
using Mercurius.Prime.Core;

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

        /// <summary>
        /// 线程锁
        /// </summary>
        private static object locker = new object();

        /// <summary>
        /// 已经建立类型转换映射的类型
        /// </summary>
        private static IList<MappedItem> mappedTypes = new List<MappedItem>();

        /// <summary>
        /// automapper配置对象
        /// </summary>
        private static IMapperConfigurationExpression autoMapperConfiguration;

        #endregion

        #region Constructors

        /// <summary>
        /// 静态构造方法
        /// </summary>
        static DtoUtils()
        {
           //  Mapper.(cfg => autoMapperConfiguration = cfg);
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
        public static T As<S, T>(this S s, Action<IMappingOperationOptions> opts = null)
        {
            // InitializeMapper<S, T>();

            // return s == null ? default : (opts == null ? Mapper.Map<T>(s) : Mapper.Map<T>(s, opts));

            return s.AsJson().AsObject<T>();
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
            // InitializeMapper<S, T>();

            // return sources == null ? null : (opts == null ? Mapper.Map<IEnumerable<T>>(sources) : Mapper.Map<IEnumerable<T>>(sources, opts));

            return sources.AsJson().AsObject<IEnumerable<T>>();
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
                    autoMapperConfiguration.CreateMap<S, T>();

                    mappedTypes.Add(new MappedItem { Source = sourceType, Target = targetType });
                }
            }
        }

        #endregion
    }
}
