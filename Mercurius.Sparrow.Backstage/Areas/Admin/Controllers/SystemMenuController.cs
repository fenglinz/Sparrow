using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.Mvc;
using Mercurius.Siskin.Contracts.RBAC;
using Mercurius.Siskin.Entities;
using Mercurius.Siskin.Entities.RBAC;

namespace Mercurius.Siskin.Backstage.Areas.Admin.Controllers
{
    /// <summary>
    /// 系统菜单管理控制器。
    /// </summary>
    public class SystemMenuController : BaseController
    {
        #region 属性

        /// <summary>
        /// 获取或者设置用户服务对象。
        /// </summary>
        public IUserService UserService { get; set; }

        /// <summary>
        /// 获取或者设置按钮服务对象。
        /// </summary>
        public IButtonService ButtonService { get; set; }

        /// <summary>
        /// 获取或者设置权限管理服务对象。
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

        /// <summary>
        /// 跳转到添加或编辑系统菜单信息页面。
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
        public ActionResult CreateOrUpdate(SystemMenu systemMenu)
        {
            if (systemMenu.Id == null)
            {
                systemMenu.Id = Guid.NewGuid().ToString();
            }

            systemMenu.Initialize();

            if (!systemMenu.IsValid())
            {
                return this.Alert("数据验证失败，失败详情：" + this.ConvertToHtml(systemMenu.GetErrorMessage()));
            }

            var rsp = this.PermissionService.CreateOrUpdate(systemMenu);

            return rsp.IsSuccess ? this.CloseDialogWithAlert("保存成功！") : this.Alert("保存失败，失败详情：" + rsp.ErrorMessage);
        }

        public ActionResult Icons()
        {
            return this.View();
        }

        public ActionResult AllotButton(string id)
        {
            this.ViewBag.Id = id;
            this.ViewBag.Buttons = this.ButtonService.GetUnUsedButtons(id);
            this.ViewBag.SystemButtons = this.PermissionService.GetSystemMenuButtons(id);

            return this.View();
        }

        [HttpPost]
        public ActionResult AddSystemMenuButton(string id, string name)
        {
            var rsp = this.PermissionService.AddSystemMenuButton(id, name);

            return this.Json(new { rsp.IsSuccess, Message = rsp.ErrorMessage });
        }

        [HttpPost]
        public ActionResult RemoveSystemMenuButton(string id)
        {
            var rsp = this.PermissionService.Remove(id);

            return this.Json(new { rsp.IsSuccess, Data = rsp.ErrorMessage });
        }
    }
}
