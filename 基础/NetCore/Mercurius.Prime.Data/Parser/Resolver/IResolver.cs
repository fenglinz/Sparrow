using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Prime.Data.Parser.Resolver
{
    /// <summary>
    /// 解析接口
    /// </summary>
    public interface IResolver
    {
        /// <summary>
        /// 解析实体元数据.
        /// </summary>
        /// <param name="typeInfo">类型</param>
        /// <returns>解析结果</returns>
        Columns Resolve<T>();
    }
}
