using System.Collections.Generic;
using System.Linq;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Entities;

namespace Mercurius.Kernel.Contracts.Dynamic.Entities
{
    /// <summary>
    /// 查询配置信息。
    /// </summary>
    [Table("Dynamic.Search")]
    public class SearchInfo
    {
        #region 字段

        private string _sortColumns;
        private string _visibleColumns;

        private IEnumerable<string> _sortColumnsArray;
        private IEnumerable<string> _visibleColumnArray;

        #endregion

        #region 属性

        /// <summary>
        /// 编号。
        /// </summary>
        [Column(IsPrimaryKey = true, IsIdentity = true)]
        public int Id { get; set; }

        /// <summary>
        /// 表名称。
        /// </summary>
        public string TableName { get; set; }

        /// <summary>
        /// 标题。
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// 排号。
        /// </summary>
        public string SortColumns
        {
            get { return this._sortColumns; }
            set
            {
                this._sortColumns = value;

                if (string.IsNullOrWhiteSpace(value))
                {
                    this._sortColumnsArray = null;
                }
                else
                {
                    this._sortColumnsArray = value.Split(',').Select(c => c.Trim());
                }
            }
        }

        /// <summary>
        /// 显示列列表。
        /// </summary>
        public string VisibleColumns
        {
            get { return this._visibleColumns; }
            set
            {
                this._visibleColumns = value;

                if (!string.IsNullOrWhiteSpace(value))
                {
                    this._visibleColumnArray = value.Split(',').Select(c => c.Trim());
                }
                else
                {
                    this._visibleColumnArray = null;
                }
            }
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 获取已排序显示的列。
        /// </summary>
        /// <returns>排序列集合</returns>
        public IEnumerable<string> GetSortedColumns()
        {
            if (this._sortColumnsArray.IsEmpty())
            {
                return null;
            }

            return this._sortColumnsArray;
        }

        /// <summary>
        /// 获取需要显示的列。
        /// </summary>
        /// <returns>显示列集合</returns>
        public string[] GetVisibleColumns()
        {
            if (this._visibleColumnArray.IsEmpty())
            {
                return null;
            }

            return this._visibleColumnArray.ToArray();
        }

        /// <summary>
        /// 判断列是否显示。
        /// </summary>
        /// <param name="column">列名称</param>
        /// <returns>是否显示</returns>
        public bool IsVisible(string column)
        {
            if (string.IsNullOrWhiteSpace(this.VisibleColumns))
            {
                return false;
            }

            return this._visibleColumnArray.Contains(column);
        }

        #endregion
    }
}
