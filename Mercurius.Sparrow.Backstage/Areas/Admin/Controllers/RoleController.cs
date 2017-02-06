using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.WebPages;
using Mercurius.Kernel.Contracts.RBAC.Entities;
using Mercurius.Kernel.Contracts.RBAC.SearchObjects;
using Mercurius.Kernel.Contracts.RBAC.Services;
using Mercurius.Kernel.WebCores.Filters;
using Mercurius.Prime.Core.Services;

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
                var rspRole = this.RoleService.GetRoleById(id);

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
        [IgnorePermissionValid]
        [ValidateAntiForgeryToken]
        public ActionResult CreateOrUpdate(Role role)
        {
            if (string.IsNullOrWhiteSpace(role.Id))
            {
                role.Id = Guid.NewGuid().ToString();
            }

            role.Initialize();

            var rsp = this.RoleService.CreateOrUpdate(role);

            return rsp.IsSuccess ? this.CloseDialogWithAlert("保存成功！") : this.Alert("保存失败，失败原因：" + rsp.ErrorMessage, AlertType.Error);
        }

        #endregion

        /// <summary>
        /// 删除角色信息。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>删除结果</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult Remove(string id)
        {
            return Json(this.RoleService.Remove(id));
        }

        /// <summary>
        /// 查看角色详细信息。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <param name="roleName">角色名称</param>
        /// <returns>操作结果</returns>
        public ActionResult ViewPermissions(string roleId, string roleName)
        {
            var rspSystemMenus = this.PermissionService.GetSystemMenusWithAllotedByRole(roleId);

            this.ViewBag.RoleId = roleId;
            this.ViewBag.RoleName = roleName;
            this.ViewBag.SystemMenus = rspSystemMenus;
            this.ViewBag.RoleUsers = this.RoleService.GetMembers(new UserSO { RoleId = roleId });

            return this.View();
        }

        #region 成员管理

        /// <summary>
        /// 显示分配成员界面。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <param name="roleName">角色名称</param>
        /// <returns>分配成员界面</returns>
        public ActionResult AllotMembers(string id, string roleName)
        {
            this.ViewBag.RoleId = id;
            this.ViewBag.RoleName = roleName;
            
            return View();
        }

        /// <summary>
        /// 获取未分配到角色的用户。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>未分配角色的用户</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult _GetUnAllotUsers(UserSO so)
        {
            this.ViewBag.SO = so;
            this.ViewBag.UnAllotRoleUsers = this.RoleService.GetUnAllotUsers(so);

            return PartialView("_UnAllotUsers");
        }

        /// <summary>
        /// 显示角色成员。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>角色成员信息</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult _GetMembers(string id)
        {
            this.ViewBag.RoleId = id;
            this.ViewBag.RoleMembers = this.RoleService.GetMembers(new UserSO
            {
                RoleId = id,
                PageIndex = this.Request.Params["PageIndex"].AsInt(1),
                PageSize = this.Request.Params["PageSize"].AsInt(15)
            });

            return PartialView("_Members");
        }

        /// <summary>
        /// 添加角色信息。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <param name="userIds">用户编号</param>
        /// <returns>添加结果信息</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult AddMembers(string id, string userIds)
        {
            if (string.IsNullOrWhiteSpace(userIds))
            {
                return Json(new Response { ErrorMessage = "请选中用户列表员工！" });
            }

            var rsp = this.RoleService.AddMembers(id, userIds.Split(','));

            return Json(rsp);
        }

        /// <summary>
        /// 删除角色成员信息。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <param name="userIds">用户编号</param>
        /// <returns>删除结果信息</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult RemoveMember(string id, string userIds)
        {
            var rsp = this.RoleService.RemoveMembers(id, userIds.Split(','));

            return Json(rsp);
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
        [IgnorePermissionValid]
        public ActionResult SaveAllotPermissions(string selecteds)
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
