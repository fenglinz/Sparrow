using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mercurius.CodeBuilder.Core.Database;
using Mercurius.Prime.Data.Ado;

namespace Mercurius.CodeBuilder.DbMetadata.MySQL
{
    public class MySQLDatabaseScriptExporter : DatabaseScriptExporter
    {
        #region 字段

        private readonly DbHelper _dbHelper;

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="dbHelper">数据库访问对象</param>
        public MySQLDatabaseScriptExporter(DbHelper dbHelper)
        {
            this._dbHelper = dbHelper;
        }

        #endregion

        #region 重写基类方法

        protected override string GetAddDatasScript()
        {
            throw new NotImplementedException();
        }

        protected override string GetProceduresDefinition()
        {
            throw new NotImplementedException();
        }

        protected override string GetSchemasDefinition()
        {
            throw new NotImplementedException();
        }

        protected override string GetTablesDefinition()
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}
