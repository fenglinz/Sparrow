﻿using System;
using System.Linq;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Contracts.RBAC;
using Mercurius.Sparrow.Entities;
using Mercurius.Sparrow.Entities.RBAC;
using Mercurius.Sparrow.Entities.RBAC.SO;
using Mercurius.Sparrow.Services.Support;
using static Mercurius.Sparrow.Repositories.StatementNamespaces.RBAC;

namespace Mercurius.Sparrow.Services.RBAC
{
    /// <summary>
    /// 用户服务接口实现。
    /// </summary>
    [Module("基于角色的访问控制模块")]
    public class UserService : ServiceSupport, IUserService
    {
        #region IUserService接口实现

        /// <summary>
        /// 添加或者修改用户信息。
        /// </summary>
        /// <param name="user">用户信息</param>
        /// <param name="departments">所属部门编号列表</param>
        /// <param name="roles">所属角色编号列表</param>
        /// <returns>执行结果</returns>
        public Response CreateOrUpdate(User user, string[] departments, string[] roles)
        {
            return this.InvokeService(
                nameof(CreateOrUpdate),
                () =>
                {
                    using (this.Persistence.BeginTransaction())
                    {
                        this.Persistence.Update(UserNamespace, "CreateOrUpdate", user);
                        this.Persistence.Create(UserNamespace, "AddToOrganizations", new
                        {
                            UserId = user.Id,
                            CreateUserId = WebHelper.GetLogOnUserId(),
                            OrganizationIds = departments
                        });
                        this.Persistence.Create(UserNamespace, "AddToRoles", new
                        {
                            UserId = user.Id,
                            CreateUserId = WebHelper.GetLogOnUserId(),
                            RoleIds = roles
                        });

                        this.ClearCache<User>();
                        this.ClearCache<Role>();
                        this.ClearCache<SystemMenu>();
                        this.ClearCache<Organization>();
                    }
                }, new { user, departments, roles });
        }

        /// <summary>
        /// 更新用户状态。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="status">用户状态</param>
        /// <returns>执行结果</returns>
        public Response ChangeStatus(string userId, int status)
        {
            var args = new { UserId = userId, Status = status };

            return this.InvokeService(
                nameof(ChangeStatus),
                () =>
                {
                    this.Persistence.Update(UserNamespace, "ChangeStatus", args);

                    this.ClearCache<User>();
                }, args);
        }

        /// <summary>
        /// 更新用户密码。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <param name="oldPassword">用户旧密码</param>
        /// <param name="newPassword">用户新密码</param>
        public Response ChangePassword(string id, string oldPassword, string newPassword)
        {
            return this.InvokeService(
                nameof(ChangePassword),
                () =>
                {
                    if (string.IsNullOrWhiteSpace(newPassword))
                    {
                        throw new Exception("新密码不能为空！");
                    }

                    if (oldPassword == newPassword)
                    {
                        throw new Exception("新密码不能与旧密码相同!");
                    }

                    var user = this.Persistence.QueryForObject<User>(UserNamespace, "GetUser", id);

                    if (user == null)
                    {
                        throw new Exception("用户不存在！");
                    }

                    oldPassword = oldPassword.Encrypt();

                    if (user.Password != oldPassword)
                    {
                        throw new Exception("旧密码不正确！");
                    }

                    this.Persistence.Update(
                        UserNamespace,
                        "ChangePassword",
                        new User
                        {
                            Id = id,
                            Password = newPassword.Encrypt(),
                            ModifyUserId = WebHelper.GetLogOnUserId()
                        });
                }, new { id, oldPassword, newPassword });
        }

        /// <summary>
        /// 获取用户信息。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <returns>用户信息</returns>
        public Response<User> GetUserById(string id)
        {
            return this.InvokeService(nameof(GetUserById), () => this.Persistence.QueryForObject<User>(UserNamespace, "GetUserById", id), id, false);
        }

        /// <summary>
        /// 获取用户信息。
        /// </summary>
        /// <param name="account">登录账号</param>
        /// <returns>用户信息</returns>
        public Response<User> GetUserByAccount(string account)
        {
            return this.InvokeService(nameof(GetUserByAccount), () => this.Persistence.QueryForObject<User>(UserNamespace, "GetUserByAccount", account), account, false);
        }

        /// <summary>
        /// 验证登录用户。
        /// </summary>
        /// <param name="account">登录账号</param>
        /// <param name="password">登录密码</param>
        /// <returns>服务执行结果</returns>
        public Response<User> ValidateUser(string account, string password)
        {
            password = password.Encrypt();

            var args = new { Account = account, Password = password };

            return this.InvokeService(nameof(ValidateUser), () => this.Persistence.QueryForObject<User>(UserNamespace, "ValidateUser", args), args, false);
        }

        /// <summary>
        /// 查询用户信息。
        /// </summary>
        /// <param name="so">用户信息查询对象</param>
        /// <returns>用户信息列表</returns>
        public ResponseCollection<User> SearchUsers(UserSO so)
        {
            so = so ?? new UserSO();

            return this.InvokePagingService(
                nameof(SearchUsers),
                (out int totalRecords) => this.Persistence.QueryForPaginatedList<User>(UserNamespace, "SearchUsers", out totalRecords, so), so);
        }

        /// <summary>
        /// 添加首页快捷方式信息。
        /// </summary>
        /// <param name="homeShortcut">首页快捷方式信息</param>
        /// <returns>操作结果</returns>
        public Response CreateOrUpdateHomeShortcut(HomeShortcut homeShortcut)
        {
            return this.InvokeService(
                nameof(CreateOrUpdateHomeShortcut),
                () =>
                {
                    this.Persistence.Create(HomeShortcutNamespace, "CreateOrUpdate", homeShortcut);

                    this.ClearCache<HomeShortcut>();
                }, homeShortcut);
        }

        /// <summary>
        /// 删除用户首页快捷方式。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="args">快捷方式编号</param>
        /// <returns>操作结果</returns>
        public Response RemoveHomeShortcut(string userId, params string[] args)
        {
            return this.InvokeService(
                nameof(RemoveHomeShortcut),
                () =>
                {
                    if (!args.IsEmpty())
                    {
                        this.Persistence.Delete(HomeShortcutNamespace, "Remove", new { UserId = userId, HomeShortcutIds = args });
                    }

                    this.ClearCache<HomeShortcut>();
                }, new { userId, args });
        }

        /// <summary>
        /// 获取首页快捷方式信息。
        /// </summary>
        /// <param name="id">快捷方式编号</param>
        /// <returns>首页快捷方式信息</returns>
        public Response<HomeShortcut> GetHomeShortcut(string id)
        {
            return this.InvokeService(
                nameof(GetHomeShortcut),
                () => this.Persistence.QueryForObject<HomeShortcut>(HomeShortcutNamespace, "GetHomeShortcut", id),
                id);
        }

        /// <summary>
        /// 获取用户定义的首页快捷方式。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <returns>首页快捷方式列表</returns>
        public ResponseCollection<HomeShortcut> GetHomeShortcuts(string userId)
        {
            return this.InvokeService(
                nameof(GetHomeShortcuts),
                () => this.Persistence.QueryForList<HomeShortcut>(HomeShortcutNamespace, "GetHomeShortcuts", userId),
                userId);
        }

        #endregion
    }
}
