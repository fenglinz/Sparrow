using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.CodeBuilder.Core.Database
{
    /// <summary>
    /// 数据库脚本导出者抽象类。
    /// </summary>
    public abstract class DatabaseScriptExporter
    {
        #region  公开方法

        /// <summary>
        /// 导出脚本。
        /// </summary>
        /// <param name="scriptSavedFolder">脚本保存目录</param>
        public void Export(string scriptSavedFolder)
        {
            if (string.IsNullOrWhiteSpace(scriptSavedFolder))
            {
                throw new ArgumentException(nameof(scriptSavedFolder));
            }

            var schemas = this.GetSchemasDefinition();

            if (!string.IsNullOrWhiteSpace(schemas))
            {
                this.WriteScripts(Path.Combine(scriptSavedFolder, "01-Schemas.sql"), schemas);
            }

            var tables = this.GetTablesDefinition();

            if (!string.IsNullOrWhiteSpace(tables))
            {
                this.WriteScripts(Path.Combine(scriptSavedFolder, "02-Tables.sql"), tables);
            }

            var procedures = this.GetProceduresDefinition();

            if (!string.IsNullOrWhiteSpace(procedures))
            {
                this.WriteScripts(Path.Combine(scriptSavedFolder, "03-Procedures.sql"), procedures);
            }

            var addScripts = this.GetAddDatasScript();

            if (!string.IsNullOrWhiteSpace(addScripts))
            {
                this.WriteScripts(Path.Combine(scriptSavedFolder, "04-Datas.sql"), addScripts);
            }
        }

        #endregion

        /// <summary>
        /// 获取数据库的自定义架构列表。
        /// </summary>
        /// <returns>自定义架构</returns>
        protected abstract string GetSchemasDefinition();

        /// <summary>
        /// 获取数据库表的数据库定义语句。
        /// </summary>
        /// <param name="table">表名称</param>
        /// <returns>表的数据库定义语句</returns>
        protected abstract string GetTablesDefinition();

        /// <summary>
        /// 获取数据库中自定义过程(包括函数)的详细定义。
        /// </summary>
        /// <returns>脚本</returns>
        protected abstract string GetProceduresDefinition();

        /// <summary>
        /// 获取数据库表的添加数据的语句。
        /// </summary>
        /// <param name="table">表名称</param>
        /// <returns>表的添加数据的脚本</returns>
        protected abstract string GetAddDatasScript();

        #region 私有方法

        private void WriteScripts(string path, string script)
        {
            using (var writer = new StreamWriter(path, false, Encoding.UTF8))
            {
                writer.Write(script);
            }
        }

        #endregion
    }
}
