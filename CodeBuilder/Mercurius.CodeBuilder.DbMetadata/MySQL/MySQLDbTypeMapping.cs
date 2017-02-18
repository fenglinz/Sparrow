using Mercurius.CodeBuilder.Core.Database;

namespace Mercurius.CodeBuilder.DbMetadata.MySQL
{
    /// <summary>
    /// <para>
    /// MySql数据类型映射转换器。
    /// </para>
    /// 
    /// <para>
    /// 作者：Fenglinz
    /// 日期：2011-11-16
    /// </para>
    /// </summary>
    public class MySQLDbTypeMapping : DbTypeMapping
    {
        #region 常量

        /// <summary>
        /// 映射文件路径格式。
        /// </summary>
        private const string MAPPING_FORMAT = "Mercurius.CodeBuilder.DbMetadata.MySQL.DbTypeMapping_{0}.txt";

        #endregion

        #region 默认构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        public MySQLDbTypeMapping()
        {
            var assembly = typeof(MySQLMetadata).Assembly;

            this.LoadMappingFile("C#", assembly.GetManifestResourceStream(string.Format(MAPPING_FORMAT, "CSharp")));
            this.LoadMappingFile("Java", assembly.GetManifestResourceStream(string.Format(MAPPING_FORMAT, "Java")));
        }

        #endregion
    }
}
