using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Infrastructure.Ado
{
    /// <summary>
    /// 字段元数据集合。
    /// </summary>
    [Serializable]
    public class Columns : IEnumerable<Column>
    {
        #region 字段

        /// <summary>
        /// 实体数据字典(key：实体属性名；value：实体数据信息)。
        /// </summary>
        private Dictionary<string, Column> _columns;

        #endregion

        #region 构造方法

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        public Columns()
        {
            this._columns = new Dictionary<string, Column>();
        }

        #endregion

        #region 索引

        /// <summary>
        /// 获取或者添加实体数据信息。
        /// </summary>
        /// <param name="key">键</param>
        /// <returns>实体数据信息</returns>
        public Column this[string key]
        {
            get
            {
                return this._columns[key];
            }
            set
            {
                if (this._columns.ContainsKey(key))
                {
                    this._columns[key] = value;
                }
                else
                {
                    this._columns.Add(key, value);
                }

            }
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 添加实体数据信息。
        /// </summary>
        /// <param name="data">实体数据信息</param>
        public void Add(Column data)
        {
            this[data.PropertyName] = data;
        }

        /// <summary>
        /// 添加实体数据信息。
        /// </summary>
        /// <param name="datas">实体数据信息集合</param>
        public Columns Add(IEnumerable<Column> datas)
        {
            if (datas != null)
            {
                foreach (var item in datas)
                {
                    this[item.PropertyName] = item;
                }
            }

            return this;
        }

        /// <summary>
        /// 根据字段获取实体数据信息。
        /// </summary>
        /// <param name="column">字段名称</param>
        /// <returns></returns>
        public Column Get(string column)
        {
            return this._columns.Values.FirstOrDefault(e => e.Name.Equals(column, StringComparison.OrdinalIgnoreCase));
        }

        #endregion

        #region IEnumerator<Column>接口实现

        public IEnumerator<Column> GetEnumerator()
        {
            foreach (var item in this._columns.Values)
            {
                yield return item;
            }
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return this.GetEnumerator();
        }

        #endregion
    }
}
