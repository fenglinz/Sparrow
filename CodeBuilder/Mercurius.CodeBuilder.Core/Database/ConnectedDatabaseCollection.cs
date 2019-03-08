using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using DatabaseType = Mercurius.Prime.Data.Database;

namespace Mercurius.CodeBuilder.Core.Database
{
    /// <summary>
    /// 已连接的数据库配置管理器。
    /// </summary>
    public class ConnectedDatabaseCollection
    {
        #region 属性

        public ObservableCollection<ConnectedDatabase> Items { get; private set; }

        #endregion

        #region 索引

        public ConnectedDatabase this[DatabaseType database, string databaseName]
        {
            get
            {
                return this.Items.Where(d => d.Type == database && d.Name == databaseName).FirstOrDefault();
            }
            set
            {
                var connectedDatabase = (from d in this.Items
                                         where
                                             d.Type == database && d.Name == databaseName
                                         select d).FirstOrDefault();

                if (connectedDatabase != null)
                {
                    connectedDatabase = value;
                }
                else
                {
                    this.Items.Add(value);
                }
            }
        }

        #endregion

        public static explicit operator ConnectedDatabaseCollection(List<ConnectedDatabase> lists)
        {
            var result = new ConnectedDatabaseCollection();

            if (lists != null)
            {
                foreach (var item in lists)
                {
                    result[item.Type, item.Name] = item;
                }
            }

            return result;
        }

        #region 构造方法

        /// <summary>
        /// 静态构造方法
        /// </summary>
        public ConnectedDatabaseCollection()
        {
            this.Items = new ObservableCollection<ConnectedDatabase>();
        }

        #endregion
    }
}
