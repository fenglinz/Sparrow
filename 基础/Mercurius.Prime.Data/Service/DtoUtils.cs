using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using AutoMapper.Configuration;

namespace Mercurius.Prime.Data.Service
{
    /// <summary>
    /// dto转换工具类。
    /// </summary>
    public static class DtoUtils
    {
        #region 字段

        [ThreadStatic]
        private static Dictionary<Type, Type> mappedDictionary;

        #endregion

        public static T As<S, T>(this S s)
        {
            Mapper.Initialize(cfg =>
            {
                cfg.CreateMap<S, T>();
            });

            return Mapper.Map<T>(s);
        }
    }
}
