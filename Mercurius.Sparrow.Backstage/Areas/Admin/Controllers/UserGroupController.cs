using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts.RBAC;
using Mercurius.Sparrow.Entities;
using Mercurius.Sparrow.Entities.RBAC;

namespace Mercurius.Sparrow.Backstage.Areas.Admin.Controllers
{
    /// <summary>
    /// 用户组控制器。
    /// </summary>
    public class UserGroupController : BaseController
    {
        #region 属性

        /// <summary>
        /// 获取或者设置用户信息。
        /// </summary>
        public IUserService UserService { get; set; }

        /// <summary>
        /// 获取或者设置权限管理服务。
        /// </summary>
        public IPermissionService PermissionService { get; set; }

        #endregion

        /// <summary>
        /// 用户组显示。
        /// </summary>
        /// <returns>执行结果</returns>
        public ActionResult Index()
        {
            var rspGroups = this.UserService.GetUserGroups();

            this.ViewBag.UserGroups = rspGroups;

            return this.View();
        }

        #region 添加或编辑用户组信息

        /// <summary>
        /// 显示添加或编辑用户组信息界面。
        /// </summary>
        /// <param name="id">用户组编号</param>
        /// <param name="parentId">用户组父编号</param>
        /// <returns>执行结果</returns>
        public ActionResult CreateOrUpdate(string id, string parentId = "0")
        {
            this.ViewBag.Id = id;
            this.ViewBag.ParentId = parentId;
            this.ViewBag.UserGroups = this.UserService.GetUserGroups();
            this.ViewBag.ParentId = string.IsNullOrWhiteSpace(parentId) ? "0" : parentId;

            if (!string.IsNullOrWhiteSpace(id))
            {
                var rspUserGroup = this.UserService.GetUserGroup(id);

                if (rspUserGroup.IsSuccess)
                {
                    this.ViewBag.ParentId = rspUserGroup.Data?.ParentId;

                    return this.View(rspUserGroup.Data);
                }

                this.ViewBag.ErrorMessage = rspUserGroup.ErrorMessage;
            }

            return this.View();
        }

        /// <summary>
        /// 保存用户组信息。
        /// </summary>
        /// <param name="userGroup">用户组信息</param>
        /// <returns>操作结果</returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateOrUpdate(UserGroup userGroup)
        {
            if (string.IsNullOrWhiteSpace(userGroup.Id))
            {
                userGroup.Id = Guid.NewGuid().ToString();
            }
            
            userGroup.Initialize();

            string errorMsg;

            if (userGroup.IsValid())
            {
                var rsp = this.UserService.CreateOrUpdateUserGroup(userGroup);

                if (rsp.IsSuccess)
                {
                    return this.CloseDialogWithAlert("保存成功！");
                }

                errorMsg = rsp.ErrorMessage;
            }
            else
            {
                errorMsg = this.ConvertToHtml(userGroup.GetErrorMessage());
            }

            return this.Alert(errorMsg);
        }

        #endregion

        #region 用户组成员管理

        /// <summary>
        /// 显示用户组成员分配界面。
        /// </summary>
        /// <param name="id">用户组编号</param>
        /// <param name="name">用户组名称</param>
        /// <returns>执行结果</returns>
        public ActionResult AllotMembers(string id, string name)
        {
            this.ViewBag.Id = id;
            this.ViewBag.Name = name;
            this.ViewBag.GroupMembers = this.UserService.GetUsersByGroup(id);
            this.ViewBag.UnAllotGroupUsers = this.UserService.GetUnAllotGroupUsers(id);

            return this.View();
        }

        /// <summary>
        /// 获取未分配的用户信息。
        /// </summary>
        /// <param name="type">查询类型</param>
        /// <param name="userGroupId">用户组Id</param>
        /// <param name="query">查询关键字</param>
        /// <returns>执行结果</returns>
        [HttpPost]
        public ActionResult _GetUnAllotGroupUsers(string type, string userGroupId, string query)
        {
            var rsUnAllotUsers = this.UserService.GetUnAllotGroupUsers(userGroupId);

            if (!string.IsNullOrWhiteSpace(query) && !rsUnAllotUsers.Datas.IsEmpty())
            {
                query = query.ToUpper();

                switch (type)
                {
                case "Code":
                    rsUnAllotUsers.Datas = rsUnAllotUsers.Datas.Where(u => u.Code.ToUpper().Contains(query)).ToList();

                    break;

                case "Account":
                    rsUnAllotUsers.Datas = rsUnAllotUsers.Datas.Where(u => u.Account.ToUpper().Contains(query)).ToList();

                    break;

                case "Name":
                    rsUnAllotUsers.Datas = rsUnAllotUsers.Datas.Where(u => u.Name.ToUpper().Contains(query)).ToList();

                    break;
                }
            }

            this.ViewBag.UnAllotGroupUsers = rsUnAllotUsers;

            return this.PartialView("_UnAllotGroupUsers");
        }

        /// <summary>
        /// 获取用户组成员。
        /// </summary>
        /// <param name="id">用户组编号</param>
        /// <param name="name">用户组名称</param>
        /// <returns>执行结果</returns>
        [HttpPost]
        public ActionResult _GetGroupMembers(string id, string name)
        {
            this.ViewBag.Name = name;
            this.ViewBag.GroupMembers = this.UserService.GetUsersByGroup(id);

            return this.PartialView("_UserGroupMembers");
        }

        /// <summary>
        /// 添加用户组成员。
        /// </summary>
        /// <param name="id">用户组编号</param>
        /// <param name="userIds">用户编号</param>
        /// <returns>执行结果</returns>
        [HttpPost]
        public ActionResult AddUserGroupMembers(string id, string userIds)
        {
            var rs = this.UserService.AddUserGroupMembers(id, userIds.Split(','));

            return this.Json(new { IsSuccess = rs.IsSuccess, Message = rs.ErrorMessage });
        }

        /// <summary>
        /// 移除用户组成员。
        /// </summary>
        /// <param name="id">用户组编号</param>
        /// <param name="userId">用户编号</param>
        /// <returns>执行结果</returns>
        [HttpPost]
        public ActionResult RemoveUserGroupMember(string id, string userId)
        {
            var rs = this.UserService.RemoveUserGroupMember(id, userId);

            return this.Json(new { IsSuccess = rs.IsSuccess, Message = rs.ErrorMessage });
        }

        #endregion

        #region 用户组权限管理

        /// <summary>
        /// 显示用户组权限分配界面。
        /// </summary>
        /// <param name="id">用户组编号</param>
        /// <param name="name">用户组名称</param>
        /// <returns>执行结果</returns>
        public ActionResult AllotPermission(string id, string name)
        {
            var model = this.PermissionService.GetSystemMenusWithAllotedByUserGroup(id);

            this.ViewBag.Id = id;
            this.ViewBag.UserGroup = name;

            return this.View(model);
        }

        /// <summary>
        /// 保存用户组权限分配。
        /// </summary>
        /// <param name="id">用户组编号</param>
        /// <param name="selecteds">拥有访问权限的资源</param>
        /// <returns>执行结果</returns>
        [HttpPost]
        public ActionResult ConfirmAllotPermission(string id, string selecteds)
        {
            var menus = selecteds.Split(',');
            var rspAllot = this.PermissionService.AllotPermissionByUserGroup(id, menus);

            return this.Json(new { Data = rspAllot.IsSuccess ? "分配成功！" : rspAllot.ErrorMessage });
        }

        #endregion

        /// <summary>
        /// 查看用户组权限。
        /// </summary>
        /// <param name="id">用户组编号</param>
        /// <param name="name">用户组名称</param>
        /// <returns>执行结果</returns>
        public ActionResult ViewDetails(string id, string name)
        {
            var model = this.PermissionService.GetSystemMenusWithAllotedByUserGroup(id);

            this.ViewBag.UserGroup = name;

            return this.View(model);
        }
    }
}
