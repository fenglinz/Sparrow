using System.Collections.Generic;
using System.IO;

namespace Mercurius.Infrastructure.Data.Excel
{
    /// <summary>
    /// 数据导出器接口。
    /// </summary>
    public interface IExporter
    {
        /// <summary>
        /// 导出数据模板。
        /// </summary>
        /// <typeparam name="T">导出数据的类型</typeparam>
        /// <param name="output">输出流</param>
        void ExportDataTemplate<T>(Stream output) where T : class,new();

        /// <summary>
        /// 导出数据模板。
        /// </summary>
        /// <param name="output">输出流</param>
        /// <param name="configuration">导出设置</param>
        void ExportDataTemplate(Stream output, Configuration configuration);

        /// <summary>
        /// 导出数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="sources">数据源</param>
        /// <param name="output">输出流</param>
        void Export<T>(IEnumerable<T> sources, Stream output) where T : class,new();

        /// <summary>
        /// 导出数据。
        /// </summary>
        /// <typeparam name="T">数据类型</typeparam>
        /// <param name="sources">数据源</param>
        /// <param name="output">输出流</param>
        /// <param name="configuration">导出设置</param>
        void Export<T>(IEnumerable<T> sources, Stream output, Configuration configuration) where T : class,new();
    }
}
