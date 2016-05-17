using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Contracts.WebApi;
using Mercurius.Sparrow.Entities.WebApi;
using Mercurius.Sparrow.Entities.WebApi.SO;
using Mercurius.Sparrow.Mvc.Extensions;

namespace Mercurius.Sparrow.Backstage.Areas.WebApi.Controllers
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

        #endregion

        /// <summary>
        /// 显示角色列表。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>显示视图</returns>
        public ActionResult Index(RoleSO so)
        {
            var model = this.RoleService.SearchRoles(so);

            return View(model);
        }

        /// <summary>
        /// 显示添加或者修改角色信息视图。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>显示视图</returns>
        public ActionResult CreateOrUpdate(int? id = null)
        {
            if (id != null)
            {
                var rsp = this.RoleService.GetRoleById(id.Value);

                return View(rsp.Data);
            }

            return View();
        }

        /// <summary>
        /// 保存角色信息。
        /// </summary>
        /// <param name="role">角色信息</param>
        /// <returns>保存结果提示</returns>
        [HttpPost]
        [IgnorePermissionValid]
        [ValidateAntiForgeryToken]
        public ActionResult CreateOrUpdate(Role role)
        {
            var rsp = this.RoleService.CreateOrUpdate(role);

            return rsp.IsSuccess ? CloseDialogWithAlert("保存成功！") : Alert("保存失败，失败原因：" + rsp.GetErrorMessage());
        }

        /// <summary>
        /// 删除角色信息。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>删除结果信息</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult Remove(int id)
        {
            return Json(this.RoleService.Remove(id));
        }

        #region 角色成员管理

        /// <summary>
        /// 显示分配角色成员界面。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>显示视图</returns>
        public ActionResult AllotMembers(int id)
        {
            this.ViewBag.RoleId = id;
            this.ViewBag.AllotMembers = this.RoleService.GetAllotUsers(id);
            this.ViewBag.UnAllotUsers = this.RoleService.GetUnAllotUsers(id);

            return View();
        }

        /// <summary>
        /// 获取未分配的用户列表。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <param name="account">账号过滤</param>
        /// <returns>显示部分视图</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult _GetUnAllotUsers(int roleId, string account)
        {
            this.ViewBag.UnAllotUsers = this.RoleService.GetUnAllotUsers(roleId, account);

            return PartialView("_UnAllotUsers");
        }

        /// <summary>
        /// 获取已分配的用户列表。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <returns>显示部分视图</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult _GetAllotUsers(int roleId)
        {
            this.ViewBag.AllotMembers = this.RoleService.GetAllotUsers(roleId);

            return PartialView("_AllotUsers");
        }

        /// <summary>
        /// 为角色添加成员。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <param name="userId">成员编号</param>
        /// <returns>添加结果信息</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult AddMember(int roleId, int userId)
        {
            return Json(this.RoleService.AddMember(roleId, userId));
        }

        /// <summary>
        /// 删除角色成员。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <param name="userId">用户编号</param>
        /// <returns>删除结果信息</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult RemoveMember(int roleId, int userId)
        {
            return Json(this.RoleService.RemoveMember(roleId, userId));
        }

        #endregion

        #region 角色权限管理

        /// <summary>
        /// 显示分配角色权限界面。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>显示视图</returns>
        [HttpGet]
        public ActionResult AllotPermissions(int id)
        {
            var rolePermissions = this.RoleService.GetRolePermissions(id);

            this.ViewBag.RoleId = id;

            return View(rolePermissions);
        }

        /// <summary>
        /// 保存权限修改界面。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <param name="apiIds">API编号</param>
        /// <returns>保存结果提示</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult SaveAllotPermissions(int roleId, int[] apiIds)
        {
            var rsp = this.RoleService.AllotPermissions(roleId, apiIds);

            return rsp.IsSuccess ? AlertWithRefresh("保存成功！") : Alert("保存失败，失败原因：" + rsp.ErrorMessage, AlertType.Error);
        }

        /// <summary>
        /// 显示查看角色权限信息界面。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>显示视图</returns>
        public ActionResult ViewPermissions(int id)
        {
            var rolePermissions = this.RoleService.GetRolePermissions(id);

            return View(rolePermissions);
        }

        #endregion
    }
}