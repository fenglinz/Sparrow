using Mercurius.CodeBuilder.Core.Database;

namespace Mercurius.CodeBuilder.Core.Config
{
    /// <summary>
    /// 文件生成完毕后的事件处理接口。
    /// </summary>
    public interface IFileCreatedHandler
    {
        /// <summary>
        /// 文件生成完毕后的处理。
        /// </summary>
        /// <param name="configuration">代码生成配置信息</param>
        /// <param name="item">生成配置项</param>
        /// <param name="table">数据库表信息</param>
        /// <param name="fileName">文件名</param>
        void OnFileCreateComplated(Configuration configuration, Item item, DbTable table, string fileName);
    }
}
