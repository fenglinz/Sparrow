using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Siskin.Contracts;
using Mercurius.Siskin.Contracts.WebApi;
using Mercurius.Siskin.Entities.WebApi;
using Mercurius.Siskin.Entities.WebApi.SO;

namespace Mercurius.Siskin.Backstage.Areas.WebApi.Controllers
{
    /// <summary>
    /// 角色管理控制器。
    /// </summary>
    public class RoleController : BaseController
    {
        #region 属性

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

        [HttpGet]
        public ActionResult AllotPermission(int? id)
        {
            if (!id.HasValue)
            {
                return Content("角色Id是必须的");
            }
            var routes = this.RoleService.GetRolePower(id.Value);
            if (!routes.IsSuccess)
            {
                return Content(routes.ErrorMessage);
            }

            ViewBag.RoleId = id;

            return View(routes.Datas);
        }

        [HttpPost]
        public ActionResult ConfirmAllotPermission(int roleId, int[] apiId)
        {
            var role = new Role { Id = roleId, RolePermissions = apiId };

            return Json(RoleService.AllotUserPower(role));
        }
    }
}