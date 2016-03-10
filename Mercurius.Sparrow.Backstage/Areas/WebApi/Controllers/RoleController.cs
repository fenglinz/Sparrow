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

        public ActionResult Index(RoleSO so)
        {
            var model = this.RoleService.SearchRoles(so);

            return View(model);
        }

        public ActionResult CreateOrUpdate(int? id = null)
        {
            if (id != null)
            {
                var rsp = this.RoleService.GetRoleById(id.Value);

                return View(rsp.Data);
            }

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateOrUpdate(Role role)
        {
            var rsp = this.RoleService.CreateOrUpdate(role);

            return rsp.IsSuccess ? CloseDialogWithAlert("保存成功！") : Alert("保存失败，失败原因：" + rsp.GetErrorMessage());
        }

        [HttpPost]
        public ActionResult Remove(int id)
        {
            return Json(this.RoleService.Remove(id));
        }

        #region 角色成员管理

        public ActionResult AllotMembers(int id)
        {
            this.ViewBag.RoleId = id;
            this.ViewBag.AllotMembers = this.RoleService.GetAllotUsers(id);
            this.ViewBag.UnAllotUsers = this.RoleService.GetUnAllotUsers(id);

            return View();
        }

        [HttpPost]
        public ActionResult _GetUnAllotUsers(int roleId, string account)
        {
            this.ViewBag.UnAllotUsers = this.RoleService.GetUnAllotUsers(roleId, account);

            return PartialView("_UnAllotUsers");
        }

        [HttpPost]
        public ActionResult _GetAllotUsers(int roleId)
        {
            this.ViewBag.AllotMembers = this.RoleService.GetAllotUsers(roleId);

            return PartialView("_AllotUsers");
        }

        [HttpPost]
        public ActionResult AddMember(int roleId, int userId)
        {
            return Json(this.RoleService.AddMember(roleId, userId));
        }

        [HttpPost]
        public ActionResult RemoveMember(int roleId, int userId)
        {
            return Json(this.RoleService.RemoveMember(roleId, userId));
        }

        #endregion

        #region 角色权限管理

        [HttpGet]
        public ActionResult AllotPermissions(int id)
        {
            var rolePermissions = this.RoleService.GetRolePermissions(id);

            this.ViewBag.RoleId = id;

            return View(rolePermissions);
        }

        public ActionResult ViewDetails(int id)
        {
            var rolePermissions = this.RoleService.GetRolePermissions(id);

            return View(rolePermissions);
        }

        [HttpPost]
        public ActionResult ConfirmAllotPermissions(int roleId, int[] apiId)
        {
            var rsp = this.RoleService.AllotPermissions(roleId, apiId);

            return rsp.IsSuccess ? AlertWithRefresh("保存成功！") : Alert("保存失败，失败原因：" + rsp.ErrorMessage, AlertType.Error);
        }

        #endregion
    }
}