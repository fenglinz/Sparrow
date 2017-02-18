using Mercurius.CodeBuilder.Core.Database;

namespace Mercurius.CodeBuilder.DbMetadata.Oracle
{
    public class OracleDbTypeMapping : DbTypeMapping
    {
        #region 常量

        /// <summary>
        /// 映射文件路径格式。
        /// </summary>
        private const string MAPPING_FORMAT = "Mercurius.CodeBuilder.DbMetadata.Oracle.DbTypeMapping_{0}.txt";

        #endregion

        #region 构造方法

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        public OracleDbTypeMapping()
            : base()
        {
            var assembly = typeof(OracleDbTypeMapping).Assembly;

            this.LoadMappingFile("C#", assembly.GetManifestResourceStream(string.Format(MAPPING_FORMAT, "CSharp")));
            // this.LoadMappingFile("Java", assembly.GetManifestResourceStream(string.Format(MAPPING_FORMAT, "Java")));
        }

        #endregion
    }
}
