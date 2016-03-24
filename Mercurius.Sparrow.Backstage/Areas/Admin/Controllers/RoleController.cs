using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Contracts.RBAC;
using Mercurius.Sparrow.Entities;
using Mercurius.Sparrow.Entities.RBAC;

namespace Mercurius.Sparrow.Backstage.Areas.Admin.Controllers
{
    /// <summary>
    /// 角色管理控制器。
    /// </summary>
    public class RoleController : BaseController
    {
        #region 属性

        /// <summary>
        /// 角色服务对象。
        /// </summary>
        public IRoleService RoleService { get; set; }

        /// <summary>
        /// 用户服务对象。
        /// </summary>
        public IUserService UserService { get; set; }

        /// <summary>
        /// 权限服务对象。
        /// </summary>
        public IPermissionService PermissionService { get; set; }

        /// <summary>
        /// 组织信息服务对象。
        /// </summary>
        public IOrganizationService OrganizationService { get; set; }

        #endregion

        /// <summary>
        /// 进入角色管理首页。
        /// </summary>
        /// <returns>操作结果</returns>
        public ActionResult Index()
        {
            var rspRoles = this.RoleService.GetRoles();

            this.ViewBag.Roles = rspRoles;

            return this.View();
        }

        #region 添加或者编辑角色信息

        /// <summary>
        /// 进入添加或者编辑角色信息页面。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <param name="parentId">父角色编号</param>
        /// <returns>操作结果</returns>
        public ActionResult CreateOrUpdate(string id = null, string parentId = "0")
        {
            this.ViewBag.Roles = this.RoleService.GetRoles();
            this.ViewBag.ParentId = string.IsNullOrWhiteSpace(parentId) ? "0" : parentId;

            if (!string.IsNullOrWhiteSpace(id))
            {
                var rspRole = this.RoleService.GetRole(id);

                if (!rspRole.IsSuccess)
                {
                    this.ViewBag.ErrorMessage = rspRole.ErrorMessage;
                }

                this.ViewBag.ParentId = rspRole.Data?.ParentId;

                return this.View(rspRole.Data);
            }

            return this.View();
        }

        /// <summary>
        /// 保存角色信息。
        /// </summary>
        /// <param name="role">角色信息</param>
        /// <returns>操作结果</returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateOrUpdate(Role role)
        {
            if (string.IsNullOrWhiteSpace(role.Id))
            {
                role.Id = Guid.NewGuid().ToString();
            }

            role.Initialize();

            var rsp = this.RoleService.CreateOrUpdate(role);

            return rsp.IsSuccess ? this.CloseDialogWithAlert("执行成功！") : this.Alert("执行失败，失败原因：" + rsp.ErrorMessage);
        }

        #endregion

        /// <summary>
        /// 查看角色详细信息。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <param name="roleName">角色名称</param>
        /// <returns>操作结果</returns>
        public ActionResult ViewRoleDetails(string roleId, string roleName)
        {
            var rspSystemMenus = this.PermissionService.GetSystemMenusWithAllotedByRole(roleId);

            this.ViewBag.RoleId = roleId;
            this.ViewBag.RoleName = roleName;
            this.ViewBag.SystemMenus = rspSystemMenus;
            this.ViewBag.RoleUsers = this.RoleService.GetRoleMembers(roleId);

            return this.View();
        }

        #region 分配成员

        public ActionResult AllotMembers(string id)
        {
            this.ViewBag.Id = id;
            this.ViewBag.RoleMembers = this.RoleService.GetRoleMembers(id);
            this.ViewBag.UnAllotRoleUsers = this.RoleService.GetUnAllotRoleUsers(id);

            return View();
        }

        [HttpPost]
        public ActionResult _GetUnAllotRoleUsers(string id, string type, string query)
        {
            var users = this.RoleService.GetUnAllotRoleUsers(id);

            if (!string.IsNullOrWhiteSpace(query) && users.HasData())
            {
                switch (type)
                {
                    case "Code":
                        users.Datas = users.Datas.Where(u => u.Code?.Contains(query) == true).ToList();

                        break;

                    case "Account":
                        users.Datas = users.Datas.Where(u => u.Account?.Contains(query) == true).ToList();

                        break;

                    case "Name":
                        users.Datas = users.Datas.Where(u => u.Name?.Contains(query) == true).ToList();

                        break;
                }
            }

            this.ViewBag.UnAllotRoleUsers = users;

            return PartialView("_UnAllotRoleUsers");
        }

        [HttpPost]
        public ActionResult _GetRoleMembers(string id)
        {
            this.ViewBag.RoleMembers = this.RoleService.GetRoleMembers(id);

            return PartialView("_UserRoleMembers");
        }

        public ActionResult AddUserMembers(string id, string userIds)
        {
            if (string.IsNullOrWhiteSpace(userIds))
            {
                return Json(new Response {ErrorMessage = "请选中用户列表员工！" });
            }

            return null;
        }

        #endregion

        #region 权限分配

        /// <summary>
        /// 进入权限分配页面。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <param name="role">角色名称</param>
        /// <returns>操作结果</returns>
        public ActionResult AllotPermissions(string id, string role)
        {
            var rspSystemMenus = this.PermissionService.GetSystemMenusWithAllotedByRole(id);

            this.ViewBag.Id = id;
            this.ViewBag.SystemMenus = rspSystemMenus;
            this.ViewBag.Role = string.IsNullOrWhiteSpace(role) ? string.Empty : role.Trim();

            return this.View();
        }

        /// <summary>
        /// 进行角色权限分配。
        /// </summary>
        /// <param name="selecteds">已选择的可访问的资源</param>
        /// <returns>操作结果</returns>
        [HttpPost]
        public ActionResult ConfirmAllotPermissions(string selecteds)
        {
            var result = "分配成功！";

            if (string.IsNullOrWhiteSpace(selecteds))
            {
                return this.Json(new { Data = result });
            }

            var menus = selecteds.Split(',');
            var rspAllot = this.PermissionService.AllotPermissionByRole(this.Request.Form["roleId"], menus);

            result = rspAllot.IsSuccess ? result : rspAllot.ErrorMessage;

            return this.Json(new { Data = result });
        }

        #endregion
    }
}
