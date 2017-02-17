using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Mercurius.Kernel.Contracts.Core.Entities;
using Mercurius.Kernel.Contracts.Dynamic.Entities;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Ado;

namespace Mercurius.Sparrow.Backstage.Areas.Dynamic.Models.Configuration
{
    /// <summary>
    /// 查询配置页面模板。
    /// </summary>
    public class SearchConfigModel
    {
        #region 常量

        private static readonly IList<SelectListItem> OPS = new List<SelectListItem>
        {
            new SelectListItem { Text = "等于", Value = "0" },
            new SelectListItem { Text = "大于", Value= "1" },
            new SelectListItem { Text = "大于等于", Value = "2" },
            new SelectListItem { Text = "小于", Value = "3" },
            new SelectListItem { Text = "小于等于", Value = "4" },
            new SelectListItem { Text = "包含", Value = "5" }
        };

        #endregion

        #region 字段

        private IList<Dictionary> _dictionaries;

        #endregion

        #region 属性

        /// <summary>
        /// 表信息。
        /// </summary>
        public Table Table { get; set; }

        /// <summary>
        /// 表查询信息。
        /// </summary>
        public SearchInfo Search { get; set; }

        /// <summary>
        /// 表的字段信息。
        /// </summary>
        public IList<Column> Columns { get; set; }

        /// <summary>
        /// 查询配置信息。
        /// </summary>
        public IList<ConditionInfo> Conditions { get; set; }

        /// <summary>
        /// 排序配置信息。
        /// </summary>
        public IList<OrderInfo> Orders { get; set; }

        /// <summary>
        /// 字典信息。
        /// </summary>
        public IList<Dictionary> Dictionaries
        {
            get { return this._dictionaries; }
            set
            {
                if (this._dictionaries != value)
                {
                    value.ForEach(d => d.Value = d.Key);

                    this._dictionaries = value;
                }
            }
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 列是否显示。
        /// </summary>
        /// <param name="column">列名称</param>
        /// <returns>是否显示</returns>
        public bool IsColumnVisible(string column)
        {
            if (this.Search == null)
            {
                return true;
            }

            return this.Search.IsVisible(column);
        }

        /// <summary>
        /// 获取已排好序的列信息。
        /// </summary>
        /// <returns>列信息集合</returns>
        public IEnumerable<Column> GetSortedColumns()
        {
            if (this.Search == null || string.IsNullOrWhiteSpace(this.Search.SortColumns))
            {
                return this.Columns;
            }

            var index = 1;
            this.Search.GetSortedColumns().MergeDatas(this.Columns, (c1, c2) => c1 == c2.Name, (c1, c2) => c2.Sort = index++);

            return this.Columns.OrderBy(c => c.Sort);
        }

        /// <summary>
        /// 获取列的下拉框数据源。
        /// </summary>
        /// <param name="selectedValue">选定的值</param>
        /// <returns>下拉框数据</returns>
        public SelectList GetColumnSelectList(object selectedValue = null)
        {
            return new SelectList(this.Columns, "Name", "Description", selectedValue);
        }

        /// <summary>
        /// 获取查询操作下拉框数据源。
        /// </summary>
        /// <param name="selectedValue">选定的值</param>
        /// <returns>下拉框数据源</returns>
        public SelectList GetOpSelectList(object selectedValue = null)
        {
            return new SelectList(OPS, "Value", "Text", selectedValue);
        }

        /// <summary>
        /// 获取字典分类信息下拉框数据源。
        /// </summary>
        /// <param name="selectedValue">选定的值</param>
        /// <returns>下拉框数据源</returns>
        public IList<SelectListItem> GetDictionaryList(object selectedValue = null)
        {
            var items = new List<SelectListItem>();

            if (!this.Dictionaries.IsEmpty())
            {
                items.Add(new SelectListItem
                {
                    Text = "无",
                    Value = " "
                });

                items.AddRange(this.Dictionaries.Select(item => new SelectListItem
                {
                    Text = item.Key,
                    Value = item.Key,
                    Selected = item.Key == (string)selectedValue
                }));
            }

            return items;
        }

        #endregion
    }
}