using System.Collections.Generic;

namespace Mercurius.CodeBuilder.Core.Config
{
    public class ItemCollection : IEnumerable<Item>
    {
        #region 字段

        private Dictionary<string, Item> _dictItem = null;

        #endregion

        #region 索引

        public Item this[string name]
        {
            get
            {
                if (this._dictItem.ContainsKey(name))
                {
                    return this._dictItem[name];
                }

                return null;
            }
            set
            {
                if (this._dictItem.ContainsKey(name))
                {
                    this._dictItem[name] = value;
                }
                else
                {
                    this._dictItem.Add(name, value);
                }
            }
        }

        #endregion

        #region 构造方法

        public ItemCollection()
        {
            this._dictItem = new Dictionary<string, Item>();
        }

        #endregion

        #region IEnumerable<Item> 成员

        public IEnumerator<Item> GetEnumerator()
        {
            foreach (var item in this._dictItem.Values)
            {
                yield return item;
            }
        }

        #endregion

        #region IEnumerable 成员

        System.Collections.IEnumerator System.Collections.IEnumerable.GetEnumerator()
        {
            return this.GetEnumerator();
        }

        #endregion

        #region 隐式转换

        public static explicit operator ItemCollection(List<Item> items)
        {
            var sections = new ItemCollection();

            if (items != null)
            {
                foreach (var item in items)
                {
                    sections[item.Name] = item;
                }
            }

            return sections;
        }

        #endregion
    }
}
