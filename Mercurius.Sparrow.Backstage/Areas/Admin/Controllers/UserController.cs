using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts.RBAC;
using Mercurius.Sparrow.Entities.RBAC.SO;
using Mercurius.Sparrow.Backstage.Areas.Admin.Models.User;

namespace Mercurius.Sparrow.Backstage.Areas.Admin.Controllers
{
    /// <summary>
    /// 用户管理控制器。
    /// </summary>
    public class UserController : BaseController
    {
        #region 常量

        private const string PasswordReplaceString = "********";
        private const string SessionVerifyCode = "session_verifyCode";

        #endregion

        #region 属性

        /// <summary>
        /// 用户信息服务。
        /// </summary>
        public IUserService UserService { get; set; }

        /// <summary>
        /// 角色信息服务。
        /// </summary>
        public IRoleService RoleService { get; set; }

        /// <summary>
        /// 权限管理服务。
        /// </summary>
        public IPermissionService PermissionService { get; set; }

        /// <summary>
        /// 组织机构服务对象。
        /// </summary>
        public IOrganizationService OrganizationService { get; set; }

        #endregion

        #region 用户信息查询

        /// <summary>
        /// 显示用户信息主界面。
        /// </summary>
        /// <param name="so">搜索条件</param>
        /// <returns>执行结果</returns>
        public ActionResult Index(UserSO so = null)
        {
            return this.View();
        }

        /// <summary>
        /// 获取部门信息。
        /// </summary>
        /// <returns>执行结果</returns>
        public ActionResult Departments()
        {
            this.ViewBag.Organizations = this.OrganizationService.GetOrganizations();

            return this.View();
        }

        /// <summary>
        /// 获取用户信息。
        /// </summary>
        /// <param name="so">用户信息查询对象</param>
        /// <returns>执行结果</returns>
        public ActionResult Users(UserSO so = null)
        {
            var rspUsers = this.UserService.SearchUsers(so);

            this.ViewBag.SO = so;
            this.ViewBag.ResponseUsers = rspUsers;

            return this.View();
        }

        #endregion

        #region 单个用户信息处理

        /// <summary>
        /// 添加或编辑用户信息界面。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <returns>执行结果</returns>
        public ActionResult CreateOrUpdate(string id)
        {
            var model = new CreateOrUpdateVM
            {
                User = this.UserService.GetUserById(id).Data
            };

            if (model.User != null)
            {
                this.ViewBag.RealPassword = model.User.Password;

                model.User.Password = PasswordReplaceString;
            }

            this.ViewBag.Roles = this.RoleService.GetRoles();
            this.ViewBag.Departments = this.OrganizationService.GetOrganizations();

            return this.View(model);
        }

        /// <summary>
        /// 提交用户信息。
        /// </summary>
        /// <param name="vm">添加或编辑用户信息视图模型</param>
        /// <returns>执行结果</returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateOrUpdate(CreateOrUpdateVM vm)
        {
            vm.User.Initialize();
            vm.User.Password = vm.User.Password == PasswordReplaceString ?
                this.Request.Form["RealPassword"] : vm.User.Password.Encrypt();

            var rsp = this.UserService.CreateOrUpdate(vm.User, vm.Departments, vm.Roles);

            return rsp.IsSuccess ?
                this.CloseDialogWithAlert("保存成功！") :
                this.Alert($"发生错误，错误原因：{rsp.ErrorMessage}", AlertType.Error);
        }

        /// <summary>
        /// 删除用户信息。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <returns>删除结果信息</returns>
        [HttpPost]
        public ActionResult Remove(string id)
        {
            var rsp = this.UserService.Remove(id);

            return Json(rsp);
        }

        /// <summary>
        /// 授权用户。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <returns>执行结果</returns>
        [HttpPost]
        public ActionResult AuthorizeUser(string id)
        {
            var rsp = this.UserService.ChangeStatus(id, 1);

            return this.Json(rsp.IsSuccess);
        }

        /// <summary>
        /// 锁定用户。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <returns>执行结果</returns>
        [HttpPost]
        public ActionResult LockUser(string id)
        {
            var rsp = this.UserService.ChangeStatus(id, 2);

            return this.Json(rsp.IsSuccess);
        }

        /// <summary>
        /// 显示当前用户信息。
        /// </summary>
        /// <returns>执行结果</returns>
        public ActionResult CurrentUser()
        {
            var model = this.UserService.GetUserById(WebHelper.GetLogOnUserId());

            this.ViewBag.Roles = this.RoleService.GetRolesById(WebHelper.GetLogOnUserId());

            return this.View(model);
        }

        #endregion

        #region 修改密码

        /// <summary>
        /// 显示修改密码界面。
        /// </summary>
        /// <returns>操作结果</returns>
        public ActionResult ChangePassword()
        {
            return this.View();
        }

        /// <summary>
        /// 修改密码操作。
        /// </summary>
        /// <param name="oldPassword">旧密码</param>
        /// <param name="newPassword">新密码</param>
        /// <param name="verifyCode">验证码</param>
        /// <returns>操作结果</returns>
        [HttpPost]
        public ActionResult ChangePassword(string oldPassword, string newPassword, string verifyCode)
        {
            string message;
            var isSuccess = false;

            if (string.Compare(verifyCode, Convert.ToString(this.Session[SessionVerifyCode]), StringComparison.OrdinalIgnoreCase) == 0)
            {
                var rsp = this.UserService.ChangePassword(WebHelper.GetLogOnUserId(), oldPassword, newPassword);

                isSuccess = rsp.IsSuccess;
                message = rsp.ErrorMessage;
            }
            else
            {
                message = "验证码不正确！";
            }

            return this.Json(new { IsSuccess = isSuccess, Message = message });
        }

        #endregion

        #region 权限管理

        /// <summary>
        /// 显示用户授权界面。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <param name="userName">用户名称</param>
        /// <returns>显示用户授权界面</returns>
        public ActionResult AllotPermissions(string id, string userName)
        {
            this.ViewBag.Id = id;
            this.ViewBag.UserName = userName;

            var rsp = this.PermissionService.GetSystemMenusWithAllotedByUser(id);

            return View(rsp);
        }

        /// <summary>
        /// 保存用户权限信息。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <param name="selecteds">选择的权限编号</param>
        /// <returns>保存结果信息</returns>
        [HttpPost]
        public ActionResult ConfirmAllotPermissions(string id, string selecteds)
        {
            var rsp = this.PermissionService.AllotPermissionByRole(id, selecteds.Split(','));

            return Json(rsp);
        }

        /// <summary>
        /// 查看权限详情。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <param name="userName">用户名</param>
        /// <returns>权限详情界面</returns>
        public ActionResult ViewPermissions(string id, string userName)
        {
            var rsp = this.PermissionService.GetSystemMenusWithAllotedByUser(id);

            this.ViewBag.UserName = userName;

            return View(rsp);
        }

        #endregion

        #region 用户选择

        /// <summary>
        /// 选择用户界面。
        /// </summary>
        /// <param name="so">用户查询</param>
        /// <returns>显示界面</returns>
        public ActionResult ChooseUser(UserSO so)
        {
            so = so ?? new UserSO();
            so.PageSize = 10;

            this.ViewBag.SO = so;
            this.ViewBag.Type = this.Request.Params["type"];
            this.ViewBag.Organizations = this.OrganizationService.GetOrganizations();
            this.ViewBag.Users = this.UserService.SearchUsers(so);

            return View();
        }

        /// <summary>
        /// 获取用户信息。
        /// </summary>
        /// <param name="so">用户查询</param>
        /// <returns>显示界面</returns>
        public ActionResult GetUsers(UserSO so)
        {
            so.PageSize = 10;
            var rspUsers = this.UserService.SearchUsers(so);

            this.ViewBag.SO = so;
            this.ViewBag.Type = this.Request.Params["type"];

            return PartialView("_ChooseUsers", rspUsers);
        }

        #endregion
    }
}
