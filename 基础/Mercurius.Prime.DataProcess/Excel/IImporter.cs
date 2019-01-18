using System.Collections.Generic;
using System.IO;

namespace Mercurius.Prime.DataProcess.Excel
{
    /// <summary>
    /// Excel数据导入接口。
    /// </summary>
    public interface IImporter
    {
        /// <summary>
        /// 导入数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="input">输入流</param>
        /// <returns>导入的数据对象集合</returns>
        IList<T> Import<T>(Stream input) where T : class,new();

        /// <summary>
        /// 导入数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="input">输入流</param>
        /// <param name="configuration">Excel导入导出配置信息</param>
        /// <returns>导入的数据对象集合</returns>
        IList<T> Import<T>(Stream input, Configuration configuration) where T : class,new();
    }
}
