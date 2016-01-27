using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Mercurius.CodeBuilder.Core;
using Mercurius.CodeBuilder.Core.Database;

namespace Mercurius.CodeBuilder.DbMetadata.MSSQL
{
    /// <summary>
    /// <para>
    /// SqlServer数据类型映射转换器。
    /// </para>
    /// 
    /// <para>
    /// 作者：Fenglinz
    /// 日期：2011-11-10
    /// </para>
    /// </summary>
    public class MSSQLDbTypeMapping : DbTypeMapping
    {
        #region 常量

        /// <summary>
        /// 映射文件路径格式。
        /// </summary>
        private const string MAPPING_FORMAT = "Mercurius.CodeBuilder.DbMetadata.MSSQL.DbTypeMapping_{0}.txt";

        #endregion

        #region 构造方法

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        public MSSQLDbTypeMapping()
            : base()
        {
            var assembly = typeof(MSSQLMetadata).Assembly;

            this.LoadMappingFile("C#", assembly.GetManifestResourceStream(string.Format(MAPPING_FORMAT, "CSharp")));
            this.LoadMappingFile("Java", assembly.GetManifestResourceStream(string.Format(MAPPING_FORMAT, "Java")));
        }

        #endregion
    }
}
