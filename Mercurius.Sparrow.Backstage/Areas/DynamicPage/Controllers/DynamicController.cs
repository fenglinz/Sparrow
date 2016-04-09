using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Dynamic;
using Mercurius.Sparrow.Entities;
using Mercurius.Sparrow.Entities.Dynamic;
using Mercurius.Sparrow.Backstage.Areas.DynamicPage.Models.Configuration;
using Mercurius.Sparrow.Backstage.Areas.DynamicPage.Models.Dynamic;

namespace Mercurius.Sparrow.Backstage.Areas.DynamicPage.Controllers
{
    /// <summary>
    /// 动态页面处理控制器。
    /// </summary>
    public class DynamicController : BaseController
    {
        /// <summary>
        /// 数据查询操作。
        /// </summary>
        /// <param name="id">表名称</param>
        /// <param name="conditions">查询条件配置信息</param>
        /// <param name="pageIndex">当前页</param>
        /// <returns>返回数据查询页面</returns>
        public ActionResult Index(string id, IList<ConditionInfo> conditions = null, int pageIndex = 1)
        {
            var model = new SearchModel
            {
                Table = this.DynamicQuery.Provider.DbMetadata.GetTable(id)
            };

            if (model.Table != null)
            {
                model.Columns = this.DynamicQuery.Provider.DbMetadata.GetColumns(id);
                model.Search = this.DynamicQuery.Where<SearchInfo>(m => m.TableName, id).Single();
                model.Conditions = this.DynamicQuery.Where<ConditionInfo>(m => m.TableName, id).List();

                var showColumns = model.Search?.GetVisibleColumns();
                var orders = this.DynamicQuery.Where<OrderInfo>(m => m.TableName, id).List().Select(o => (Order)o);

                int totalRecords;
                if (conditions.IsEmpty())
                {
                    model.DataSource = this.DynamicQuery.OrderBy(orders.ToArray()).PagedList(id, pageIndex < 1 ? 1 : pageIndex, SearchObject.DefalutPageSize, out totalRecords, showColumns);
                }
                else
                {
                    var temps = conditions.Select(c => (Condition)c);

                    model.Conditions = conditions.MergeDatas(model.Conditions, (i1, i2) => i1.Column == i2.Column, (i1, i2) =>
                    {
                        i1.Id = i2.Id;
                        i1.TableName = i2.TableName;
                        i1.Op = i2.Op;
                        i1.ValidateRule = i2.ValidateRule;
                        i1.DictionaryKey = i2.DictionaryKey;
                    }) as IList<ConditionInfo>;

                    model.DataSource = this.DynamicQuery.Where(temps).OrderBy(orders.ToArray()).PagedList(id, pageIndex < 1 ? 1 : pageIndex, SearchObject.DefalutPageSize, out totalRecords, showColumns);
                }

                model.TotalRecords = totalRecords;
            }

            this.ViewBag.Model = model;

            return View();
        }

        /// <summary>
        /// 显示数据添加/编辑页面。
        /// </summary>
        /// <param name="id">表名称</param>
        /// <param name="conditions">查询条件</param>
        /// <returns>返回数据添加/编辑页面</returns>
        public ActionResult CreateOrUpdate(string id, string conditions)
        {
            var model = new CreateOrUpdateModel
            {
                Table = this.DynamicQuery.Provider.DbMetadata.GetTable(id)
            };

            if (model.Table != null)
            {
                model.Columns = this.DynamicQuery.Provider.DbMetadata.GetColumns(id);
                model.CreateOrUpdates = this.DynamicQuery.Where<CreateOrUpdateColumn>(m => m.TableName, id).List();

                if (!string.IsNullOrWhiteSpace(conditions))
                {
                    model.Conditions = conditions.AsObject<IList<Condition>>();
                    model.DataSource = this.DynamicQuery.Where(model.Conditions).Single(id);
                }
            }

            return View(model);
        }

        /// <summary>
        /// 保存数据添加/编辑的操作。
        /// </summary>
        /// <param name="table">表名称</param>
        /// <returns>返回数据查询页面</returns>
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Save(string table)
        {
            this.DynamicQuery.CreateOrUpdate(table, this.Request.Params);

            return RedirectToAction("Index", new { @id = table });
        }

        /// <summary>
        /// 删除数据的操作。
        /// </summary>
        /// <param name="id">表名称</param>
        /// <param name="conditions">删除条件</param>
        /// <returns>返回删除成功的json</returns>
        [HttpPost]
        public JsonResult Remove(string id, string conditions)
        {
            this.DynamicQuery.Where(conditions.AsObject<IList<Condition>>()).Remove(id);

            return Json(new { Success = true });
        }

        /// <summary>
        /// 查看数据。
        /// </summary>
        /// <param name="id">表名称</param>
        /// <param name="conditions">查询条件</param>
        /// <returns>返回数据查看页面</returns>
        public ActionResult ViewDetail(string id, string conditions)
        {
            var model = new CreateOrUpdateModel
            {
                Table = this.DynamicQuery.Provider.DbMetadata.GetTable(id)
            };

            if (model.Table != null)
            {
                model.Columns = this.DynamicQuery.Provider.DbMetadata.GetColumns(id);
                model.CreateOrUpdates = this.DynamicQuery.Where<CreateOrUpdateColumn>(m => m.TableName, id).List();

                if (!string.IsNullOrWhiteSpace(conditions))
                {
                    model.Conditions = conditions.AsObject<IList<Condition>>();
                    model.DataSource = this.DynamicQuery.Where(model.Conditions).Single(id);
                }
            }

            return View(model);
        }
    }
}