using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.Mvc;
using Mercurius.Core.Interfaces.Entities;
using Mercurius.Core.Interfaces.Services;
using Mercurius.Prime.Web;
using Mercurius.Prime.Web.Filters;
using Mercurius.Security.Interfaces.Services;

namespace Mercurius.Plugins.Security.Controllers
{
    /// <summary>
    /// 系统菜单管理控制器。
    /// </summary>
    public class SystemMenuController : BaseController
    {
        #region 属性

        /// <summary>
        /// 按钮服务对象。
        /// </summary>
        public IButtonService ButtonService { get; set; }

        /// <summary>
        /// 权限管理服务对象。
        /// </summary>
        public IPermissionService PermissionService { get; set; }

        #endregion

        /// <summary>
        /// 菜单导航设置。
        /// </summary>
        /// <returns>执行结果</returns>
        public ActionResult Index()
        {
            var rspSystemMenu = this.PermissionService.GetSystemMenus();

            return this.View(rspSystemMenu.Datas);
        }

        #region 添加或保存菜单信息

        /// <summary>
        /// 添加或编辑系统菜单信息页面。
        /// </summary>
        /// <param name="id">菜单编号</param>
        /// <param name="parentId">所属菜单</param>
        /// <returns>执行结果</returns>
        public ActionResult CreateOrUpdate(string id, string parentId = "0")
        {
            var rspSystemMenus = this.PermissionService.GetSystemMenus();
            this.ViewBag.ParentId = string.IsNullOrWhiteSpace(parentId) ? "0" : parentId;

            if (rspSystemMenus.IsSuccess)
            {
                this.ViewBag.SystemMenus = rspSystemMenus.Datas.Where(t => t.Category != 3).ToList();
            }

            if (!string.IsNullOrWhiteSpace(id))
            {
                var rspSystemMenu = this.PermissionService.GetSystemMenu(id);

                if (rspSystemMenu.IsSuccess)
                {
                    this.ViewBag.ParentId = rspSystemMenu.Data?.ParentId;

                    return this.View(rspSystemMenu.Data);
                }
            }

            return this.View();
        }

        /// <summary>
        /// 添加或编辑系统菜单信息。
        /// </summary>
        /// <param name="systemMenu">系统菜单信息</param>
        /// <returns>执行结果</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult CreateOrUpdate(SystemMenu systemMenu)
        {
            systemMenu.Initialize();

            var rsp = this.PermissionService.CreateOrUpdate(systemMenu);

            return rsp.IsSuccess ? this.CloseDialogWithAlert("保存成功！") : this.Alert("保存失败，失败详情：" + rsp.ErrorMessage);
        }

        #endregion

        /// <summary>
        /// 删除菜单。
        /// </summary>
        /// <param name="id">菜单编号</param>
        /// <returns>删除结果信息</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult Remove(string id)
        {
            var rsp = this.PermissionService.Remove(id);

            return this.Json(rsp);
        }

        #region 分配菜单按钮

        /// <summary>
        /// 显示分配按钮界面。
        /// </summary>
        /// <param name="id">菜单编号</param>
        /// <returns>分配按钮界面</returns>
        public ActionResult AllotButtons(string id)
        {
            this.ViewBag.Id = id;
            this.ViewBag.Buttons = this.ButtonService.GetButtonsWithAllot(id);

            return this.View();
        }

        /// <summary>
        /// 保存按钮分配。
        /// </summary>
        /// <param name="id">菜单编号</param>
        /// <param name="buttonIds">按钮编号</param>
        /// <returns>保存结果信息</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult AllotButtons(string id, string buttonIds)
        {
            var rsp = this.PermissionService.AllotButtons(id, buttonIds);

            return this.Json(rsp);
        }

        #endregion
    }
}
