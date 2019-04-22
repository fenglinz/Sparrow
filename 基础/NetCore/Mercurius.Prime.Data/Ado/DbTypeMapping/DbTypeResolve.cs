using System;
using System.Collections.Generic;
using System.Data;
using System.IO;

namespace Mercurius.Prime.Data.Ado
{
    public class DbTypeResolve
    {
        #region 字段
        
        private readonly Dictionary<string, System.Data.DbType> _dictDbTypes;

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="type">数据库类型</param>
        public DbTypeResolve(Database type)
        {
            this._dictDbTypes = new Dictionary<string, System.Data.DbType>();

            var typeInfo = typeof(DbTypeResolve);

            using (var stream = typeInfo.Assembly.GetManifestResourceStream($"{typeInfo.Namespace}.DbTypeMapping.DbTypeMapping.{type}.txt"))
            {
                string line;
                var reader = new StreamReader(stream);

                while (!string.IsNullOrWhiteSpace(line = reader.ReadLine()))
                {
                    var items = line.Split(',');

                    if (!this._dictDbTypes.ContainsKey(items[0]))
                    {
                        this._dictDbTypes.Add(items[0], (System.Data.DbType)Enum.Parse(typeof(System.Data.DbType), items[1], true));
                    }
                }

                reader.Dispose();
            }
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 获取数据类型对应的DbType。
        /// </summary>
        /// <param name="dataType">数据类型</param>
        /// <returns>DbType类型</returns>
        public System.Data.DbType? GetDbType(string dataType)
        {
            if (string.IsNullOrWhiteSpace(dataType))
            {
                return null;
            }

            if (this._dictDbTypes.ContainsKey(dataType))
            {
                return this._dictDbTypes[dataType];
            }

            return null;
        }

        #endregion

    }
}
