using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Sparrow.Contracts.RBAC;
using Mercurius.Sparrow.Entities.RBAC.SO;
using Mercurius.Infrastructure;

namespace Mercurius.Sparrow.Backstage.Areas.Admin.Controllers
{
    /// <summary>
    /// 回收站控制器。
    /// </summary>
    public class RecyclebinController : BaseController
    {
        #region 静态字段

        private const string NotExistsTable = "不存在该业务表！";
        private static readonly IDictionary<string, string> _DictTables = new Dictionary<string, string>
        {
            { "角色管理", "RBAC.Role" },
            { "导航菜单", "RBAC.SystemMenu" },
            { "用户组管理", "RBAC.UserGroup" },
            { "部门管理", "RBAC.Organization" },
            { "用户管理", "RBAC.User" },
            { "按钮管理", "RBAC.Button" }
        };

        #endregion

        #region 属性

        /// <summary>
        /// 回收站服务对象。
        /// </summary>
        public IRecyclebinService RecyclebinService { get; set; }

        #endregion

        public ActionResult Index()
        {
            return this.View();
        }

        public ActionResult Navigation()
        {
            var model = this.RecyclebinService.GetCategories(WebHelper.GetLogOnUserId());

            return this.View(model);
        }

        public ActionResult Details(RecyclebinSO so)
        {
            so.UserId = WebHelper.GetLogOnUserId();
            this.ViewBag.Recyclebins = this.RecyclebinService.GetRecyclebins(so);

            return this.View(so);
        }

        public ActionResult ViewDetail(string name, string table, string column, string value)
        {
            this.ViewBag.Name = name;
            this.ViewBag.Metadatas = this.DynamicQuery.Provider.DbMetadata.GetColumns(table);
            this.ViewBag.Details = this.RecyclebinService.GetRecyclebinDetails(table, column, value);

            return this.View();
        }

        [HttpPost]
        public ActionResult Restore(string id)
        {
            var rsp = this.RecyclebinService.Restore(id.Split(','));

            return this.Json(new { rsp.IsSuccess, rsp.ErrorMessage });
        }

        [HttpPost]
        public ActionResult Clear(string id)
        {
            var rsp = this.RecyclebinService.Clear(id.Split(','));

            return this.Json(new { rsp.IsSuccess, rsp.ErrorMessage });
        }

        /// <summary>
        /// 将数据删除至回收站。
        /// </summary>
        /// <param name="name">业务名称</param>
        /// <param name="column">删除数据时的查询字段</param>
        /// <param name="value">删除数据时的查询字段数据</param>
        /// <param name="relyColumn">删除数据时检查是否可删除的字段</param>
        /// <param name="relyValue">删除数据时检查是否可删除的字段数据</param>
        /// <returns>操作结果</returns>
        [HttpPost]
        public ActionResult RemoveToRecyclebin(
            string name,
            string column,
            string value,
            string relyColumn,
            string relyValue)
        {
            var isSuccess = false;
            var data = NotExistsTable;

            if (_DictTables.ContainsKey(name))
            {
                var canRemove = true;
                var table = _DictTables[name];

                if (!string.IsNullOrWhiteSpace(relyColumn) && !string.IsNullOrWhiteSpace(relyValue))
                {
                    var rspCanRemove = this.RecyclebinService.CanRemoveToRecyclebin(table, relyColumn, relyValue.Split(','));

                    canRemove = rspCanRemove.IsSuccess && rspCanRemove.Data;
                    data = canRemove ? data : rspCanRemove.ErrorMessage;
                }

                if (canRemove)
                {
                    var rspRemove = this.RecyclebinService.RemoveToRecyclebin(name, table, column, value.Split(','));

                    isSuccess = string.IsNullOrWhiteSpace(rspRemove.ErrorMessage);
                    data = rspRemove.IsSuccess ? null : rspRemove.ErrorMessage;
                }
                else if (data != NotExistsTable)
                {
                    data = "不能直接删除父节点！";
                }
            }

            return this.Json(new { IsSuccess = isSuccess, Data = data });
        }
    }
}
