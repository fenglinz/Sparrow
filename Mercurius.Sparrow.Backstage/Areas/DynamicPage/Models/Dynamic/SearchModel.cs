using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Ado;
using Mercurius.Sparrow.Entities.Dynamic;

namespace Mercurius.Sparrow.Backstage.Areas.DynamicPage.Models.Dynamic
{
    /// <summary>
    /// 动态查询页面数据模型。
    /// </summary>
    [Serializable]
    public class SearchModel
    {
        #region 属性

        /// <summary>
        /// 表信息。
        /// </summary>
        public Table Table { get; set; }

        /// <summary>
        /// 查询信息。
        /// </summary>
        public SearchInfo Search { get; set; }

        /// <summary>
        /// 查询信息。
        /// </summary>
        public IList<ConditionInfo> Conditions { get; set; }

        /// <summary>
        /// 表的所有字段信息。
        /// </summary>
        public IList<Column> Columns { get; set; }

        /// <summary>
        /// 总记录数。
        /// </summary>
        public int TotalRecords { get; set; }

        /// <summary>
        /// 数据源。
        /// </summary>
        public DataTable DataSource { get; set; }

        #endregion

        #region 公开方法

        /// <summary>
        /// 获取查询界面标题。
        /// </summary>
        /// <returns>查询界面标题</returns>
        public string GetTitle()
        {
            if (this.Search == null)
            {
                return $"{this.Table.Comments}管理";
            }

            return this.Search.Title;
        }

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
        /// 获取字段描述信息。
        /// </summary>
        /// <param name="column">字段</param>
        /// <returns>字段的描述信息</returns>
        public string GetColumnDescription(string column)
        {
            if (this.Columns.IsEmpty())
            {
                return column;
            }

            var metaColumn = this.Columns.FirstOrDefault(c => c.Name == column);

            return metaColumn == null ? column : metaColumn.Description;
        }

        #endregion
    }
}