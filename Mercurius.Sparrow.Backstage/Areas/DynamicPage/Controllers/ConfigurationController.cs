using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Ado;
using Mercurius.Infrastructure.Dynamic;
using Mercurius.Sparrow.Entities.Core;
using Mercurius.Sparrow.Entities.Dynamic;
using Mercurius.Sparrow.Backstage.Areas.DynamicPage.Models.Configuration;
using Mercurius.Sparrow.Mvc.Extensions;

namespace Mercurius.Sparrow.Backstage.Areas.DynamicPage.Controllers
{
    /// <summary>
    /// 动态查询配置控制器。
    /// </summary>
    public class ConfigurationController : BaseController
    {
        /// <summary>
        /// 动态查询配置首页操作。
        /// </summary>
        /// <returns>返回动态查询配置页面</returns>
        public ActionResult Index()
        {
            var model = this.DynamicQuery.Provider.DbMetadata.GetTables();

            return View(model);
        }

        #region 表注释

        /// <summary>
        /// 注解表信息。
        /// </summary>
        /// <param name="id">表名称</param>
        /// <param name="comments">注解信息</param>
        /// <returns>返回注解结果json</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult CommentTable(string id, string comments)
        {
            this.DynamicQuery.Provider.DbMetadata.CommentTable(id, comments);

            return Json(new { Success = true });
        }

        #endregion

        #region 列注释

        /// <summary>
        /// 显示表的所有列信息操作。
        /// </summary>
        /// <param name="id">表名称</param>
        /// <returns>返回表的所有列信息显示页面</returns>
        public ActionResult ShowColumns(string id)
        {
            this.ViewBag.Table = id;
            var model = this.DynamicQuery.Provider.DbMetadata.GetColumns(id);

            return View(model);
        }

        /// <summary>
        /// 注解表的列信息操作。
        /// </summary>
        /// <param name="id">表名称</param>
        /// <param name="columns">列信息集合</param>
        /// <returns>返回列注释成功的js提醒</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult CommentColumns(string id, IList<Column> columns)
        {
            if (!columns.IsEmpty())
            {
                foreach (var item in columns)
                {
                    this.DynamicQuery.Provider.DbMetadata.CommentColumn(id, item.Name, item.Description);
                }
            }

            return CloseDialogWithAlert("修改成功！");
        }

        #endregion

        #region 查询配置

        /// <summary>
        /// 显示查询配置的操作。
        /// </summary>
        /// <param name="id">表的名称</param>
        /// <returns>返回显示查询配置的页面</returns>
        public ActionResult ShowSearchConfig(string id)
        {
            var model = new SearchConfigModel
            {
                Table = this.DynamicQuery.Provider.DbMetadata.GetTable(id)
            };

            if (model.Table != null)
            {
                model.Columns = this.DynamicQuery.Provider.DbMetadata.GetColumns(id);
                model.Orders = this.DynamicQuery.Where<OrderInfo>(m => m.TableName, id).List();
                model.Search = this.DynamicQuery.Where<SearchInfo>(m => m.TableName, id).Single();
                model.Conditions = this.DynamicQuery.Where<ConditionInfo>(m => m.TableName, id).List();
                model.Dictionaries = this.DynamicQuery.Where<Dictionary>(m => m.ParentId, null, Op.IsNull).OrderBy(m => m.Sort).List<Dictionary>();
            }

            return View(model);
        }

        /// <summary>
        /// 保存查询配置的操作。
        /// </summary>
        /// <param name="id">表名称</param>
        /// <param name="searchId">查询编号</param>
        /// <returns>返回保存成功的js提醒</returns>
        [HttpPost]
        [IgnorePermissionValid]
        [ValidateAntiForgeryToken]
        public ActionResult SaveSearchConfig(string id, int searchId = 0)
        {
            var search = new SearchInfo
            {
                Id = searchId,
                TableName = id,
                Title = this.Request.Params["Title"],
                SortColumns = this.Request.Params["SortColumns"],
                VisibleColumns = this.Request.Params["VisibleColumns"]
            };

            this.DynamicQuery.CreateOrUpdate(search);

            return Alert("查询配置成功！");
        }

        /// <summary>
        /// 保存查询条件配置的操作。
        /// </summary>
        /// <param name="id">表名称</param>
        /// <param name="conditions">查询条件配置信息</param>
        /// <returns>返回保存查询条件配置成功的js</returns>
        [HttpPost]
        [IgnorePermissionValid]
        [ValidateAntiForgeryToken]
        public ActionResult SaveConditionConfig(string id, IList<ConditionInfo> conditions)
        {
            this.DynamicQuery.Where<ConditionInfo>(m => m.TableName, id).Remove();

            if (!conditions.IsEmpty())
            {
                foreach (var item in conditions)
                {
                    this.DynamicQuery.Create(item);
                }
            }

            return Alert("查询条件配置成功！");
        }

        /// <summary>
        /// 保存排序配置的操作。
        /// </summary>
        /// <param name="id">表名称</param>
        /// <param name="orders">排序配置信息</param>
        /// <returns>返回保存排序配置成功的js</returns>
        [HttpPost]
        [IgnorePermissionValid]
        [ValidateAntiForgeryToken]
        public ActionResult SaveOrderConfig(string id, IList<OrderInfo> orders)
        {
            this.DynamicQuery.Where<OrderInfo>(m => m.TableName, id).Remove();

            if (!orders.IsEmpty())
            {
                foreach (var item in orders)
                {
                    this.DynamicQuery.Create(item);
                }
            }

            return Alert("排序规则设置成功！");
        }

        #endregion

        #region 添加/编辑配置

        /// <summary>
        /// 显示添加/编辑配置页面的操作。
        /// </summary>
        /// <param name="id">表名称</param>
        /// <returns>返回添加/编辑配置页面</returns>
        public ActionResult ShowCreateOrUpdateConfig(string id)
        {
            var model = new CreateOrUpdateConfigModel
            {
                Table = this.DynamicQuery.Provider.DbMetadata.GetTable(id)
            };

            if (model.Table != null)
            {
                model.Columns = this.DynamicQuery.Where<CreateOrUpdateColumn>(m => m.TableName, id).List();

                if (model.Columns.IsEmpty())
                {
                    var metaColumns = this.DynamicQuery.Provider.DbMetadata.GetColumns(id);

                    model.Columns = metaColumns.Select(c => new CreateOrUpdateColumn
                    {
                        Name = c.Name,
                        Column = c.Name,
                        PropertyName = c.PropertyName,
                        ColumnLabel = c.Description,
                        Sort = c.Sort,
                        Visible = true,
                        IsPrimaryKey = c.IsPrimaryKey,
                        IsIdentity = c.IsIdentity,
                        Description = c.Description
                    });
                }

                model.Dictionaries = this.DynamicQuery.Where<Dictionary>(m => m.ParentId, null, Op.IsNull).OrderBy(m => m.Sort).List();
            }

            return View(model);
        }

        /// <summary>
        /// 保存添加/编辑配置信息。
        /// </summary>
        /// <param name="id">表名称</param>
        /// <param name="createOrUpdates">添加/编辑配置信息</param>
        /// <returns>返回配置信息保存成功的js</returns>
        [HttpPost]
        [IgnorePermissionValid]
        [ValidateAntiForgeryToken]
        public ActionResult SaveCreateOrUpdateConfig(string id, IList<CreateOrUpdateInfo> createOrUpdates)
        {
            if (!createOrUpdates.IsEmpty())
            {
                foreach (var item in createOrUpdates)
                {
                    this.DynamicQuery.CreateOrUpdate(item);
                }
            }

            return CloseDialogWithAlert("添加/编辑配置成功！");
        }

        #endregion
    }
}