using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Ado;
using Mercurius.Infrastructure.Dynamic;
using Mercurius.Sparrow.Backstage.Areas.DynamicPage.Models.Configuration;

namespace Mercurius.Sparrow.Backstage.Areas.DynamicPage.Models.Dynamic
{
    /// <summary>
    /// 动态编辑或修改页面数据模型
    /// </summary>
    public class CreateOrUpdateModel
    {
        #region 属性

        /// <summary>
        /// 查询条件。
        /// </summary>
        public IList<Condition> Conditions { get; set; }

        /// <summary>
        /// 表信息。
        /// </summary>
        public Table Table { get; set; }

        /// <summary>
        /// 表的所有字段信息。
        /// </summary>
        public IList<Column> Columns { get; set; }

        /// <summary>
        /// 更新信息。
        /// </summary>
        public IList<CreateOrUpdateColumn> CreateOrUpdates { get; set; }

        /// <summary>
        /// 数据源。
        /// </summary>
        public DataRow DataSource { get; set; }

        #endregion

        #region 公开方法

        /// <summary>
        /// 获取默认值。
        /// </summary>
        /// <param name="columnName">列名称</param>
        /// <returns>值</returns>
        public string GetValue(string columnName)
        {
            if (this.DataSource == null)
            {
                if (this.CreateOrUpdates.IsEmpty())
                {
                    var column = this.Columns.FirstOrDefault(c => c.Name == columnName);

                    if (column != null && column.IsPrimaryKey && !column.IsIdentity)
                    {
                        return Guid.NewGuid().ToString();
                    }
                }

                var result = string.Empty;
                var createOrUpdate = this.CreateOrUpdates.FirstOrDefault(c => c.Name == columnName);

                if (createOrUpdate != null)
                {
                    switch (createOrUpdate.DefaultValue)
                    {
                        case "GUID":
                            result = Guid.NewGuid().ToString();

                            break;

                        case "CurrentDate":
                            result = DateTime.Now.ToString("yyyy-MM-dd");

                            break;

                        case "CurrentDateTime":
                            result = DateTime.Now.ToString("yyyy-MM-dd HH:mm");

                            break;

                        case "CreateTime":
                            result = DateTime.Now.ToString("HH:mm");

                            break;

                        case "CurrentUserId":
                            result = WebHelper.GetLogOnUserId();

                            break;

                        case "CurrentUserName":
                            result = WebHelper.GetLogOnAccount();

                            break;
                    }
                }

                return result;
            }

            var columnValue = this.DataSource[columnName];

            return Convert.IsDBNull(columnValue) ? string.Empty : columnValue.ToString();
        }

        /// <summary>
        /// 获取添加/编辑列配置信息。
        /// </summary>
        /// <returns>添加/编辑列配置信息集合</returns>
        public IEnumerable<CreateOrUpdateColumn> GetColumns()
        {
            if (this.CreateOrUpdates.IsEmpty())
            {
                return from c in this.Columns
                       select new CreateOrUpdateColumn
                       {
                           Name = c.Name,
                           Column = c.Name,
                           Visible = true,
                           DataType = c.DataType,
                           ColumnLabel = c.Description,
                           PropertyName = c.PropertyName,
                           IsPrimaryKey = c.IsPrimaryKey,
                           IsIdentity = c.IsIdentity,
                           IsNullable = c.IsNullable,
                           ValidateRule = c.IsNullable ? null : "notNull",
                           DataLength = c.DataLength,
                           Description = c.Description,
                           Sort = c.Sort
                       };
            }

            return this.CreateOrUpdates.MergeDatas(this.Columns, (c1, c2) => c1.Column == c2.Name,
                (c1, c2) =>
                {
                    c1.Name = c2.Name;
                    c1.ColumnLabel = string.IsNullOrWhiteSpace(c1.ColumnLabel) ? c2.Description : c1.ColumnLabel;
                    c1.PropertyName = c2.PropertyName;
                    c1.IsPrimaryKey = c2.IsPrimaryKey;
                    c1.IsIdentity = c2.IsIdentity;
                    c1.DataLength = c2.DataLength;
                });
        }

        #endregion
    }
}