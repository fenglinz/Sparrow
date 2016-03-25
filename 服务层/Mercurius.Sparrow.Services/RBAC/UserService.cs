using System;
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
        /// 更新用户状态。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="status">用户状态</param>
        /// <returns>执行结果</returns>
        public Response UpdateUserStatus(string userId, int status)
        {
            var args = new { UserId = userId, Status = status };

            return this.InvokeService(
                nameof(UpdateUserStatus),
                () =>
                {
                    this.Persistence.Update(UserNamespace, "UpdateUserStatus", args);

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
                    if (oldPassword == newPassword)
                    {
                        throw new Exception("新密码不能与旧密码相同!");
                    }

                    if (string.IsNullOrWhiteSpace(newPassword))
                    {
                        throw new Exception("新密码不能为空！");
                    }

                    var user = this.Persistence.QueryForObject<User>(UserNamespace, "GetUser", id);

                    if (user == null)
                    {
                        throw new Exception("用户不存在！");
                    }

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
                            Password = newPassword,
                            ModifyUserId = WebHelper.GetLogOnUserId(),
                            ModifyUserName = WebHelper.GetLogOnAccount(),
                            ModifyDateTime = DateTime.Now
                        });
                }, new { id, oldPassword, newPassword });
        }

        /// <summary>
        /// 添加或者修改用户信息。
        /// </summary>
        /// <param name="user">用户信息</param>
        /// <param name="departments">所属部门编号列表</param>
        /// <param name="roles">所属角色编号列表</param>
        /// <param name="groups">所属工作组编号列表</param>
        /// <param name="permissions">所属用户权限列表</param>
        /// <returns>执行结果</returns>
        public Response CreateOrUpdateUser(
            User user,
            string[] departments,
            string[] roles,
            string[] groups,
            string[] permissions)
        {
            var result = this.InvokeService(
                nameof(CreateOrUpdateUser),
                () =>
                {
                    using (this.Persistence.BeginTransaction())
                    {
                        this.Persistence.Update(UserNamespace, "CreateOrUpdateUser", user);

                        var relations = departments.IsEmpty() ? null :
                            departments.Select(arg => new StaffOrganize
                            {
                                Id = Guid.NewGuid().ToString(),
                                UserId = user.Id,
                                OrganizationId = arg,
                                CreateUserId = WebHelper.GetLogOnUserId(),
                                CreateUserName = WebHelper.GetLogOnAccount(),
                                CreateDateTime = DateTime.Now
                            }).ToList();

                        this.Persistence.Create(OrganizationNamespace, "CreateOrUpdateRelation", new { UserId = user.Id, StaffOrganizes = relations });

                        var roleRelations = roles.IsEmpty() ? null : roles.Select(arg => new UserRole
                        {
                            Id = Guid.NewGuid().ToString(),
                            UserId = user.Id,
                            RoleId = arg,
                            CreateUserId = WebHelper.GetLogOnUserId(),
                            CreateUserName = WebHelper.GetLogOnAccount(),
                            CreateDateTime = DateTime.Now
                        }).ToList();

                        this.Persistence.Create(RoleNamespace, "CreateOrUpdateRelation", new { UserId = user.Id, UserRoles = roleRelations });

                        this.Persistence.Create(UserNamespace, "CreateOrUpdateRelation", new { UserId = user.Id });

                        var userPermissions = permissions.IsEmpty() ? null : permissions.Select(arg => new UserPermission
                        {
                            Id = Guid.NewGuid().ToString(),
                            UserId = user.Id,
                            SystemMenuId = arg,
                            CreateUserId = WebHelper.GetLogOnUserId(),
                            CreateUserName = WebHelper.GetLogOnAccount(),
                            CreateDateTime = DateTime.Now
                        }).ToList();

                        this.Persistence.Create(PermissionNamespace, "AllotPermissionByUser", new { UserId = user.Id, UserPermissions = userPermissions });

                        this.ClearCache<User>();
                        this.ClearCache<Role>();
                        this.ClearCache<SystemMenu>();
                        this.ClearCache<Organization>();
                        this.ClearCache<StaffOrganize>();
                    }
                }, new { user, departments, roles, groups, permissions });

            if (!result.IsSuccess)
            {
                throw new Exception(result.ErrorMessage);
            }

            return result;
        }

        /// <summary>
        /// 获取用户信息。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <returns>用户信息</returns>
        public Response<User> GetUser(string id)
        {
            return this.InvokeService(nameof(GetUser), () => this.Persistence.QueryForObject<User>(UserNamespace, "GetUser", id), id, false);
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

            return this.InvokeService(nameof(ValidateUser),
                () => this.Persistence.QueryForObject<User>(UserNamespace, "ValidateUser", args), args, false);
        }

        /// <summary>
        /// 查询用户信息。
        /// </summary>
        /// <param name="so">用户信息查询对象</param>
        /// <returns>用户信息列表</returns>
        public ResponseCollection<User> GetUsers(UserSO so)
        {
            so = so ?? new UserSO();

            return this.InvokePagingService(
                nameof(GetUsers),
                (out int totalRecords) => this.Persistence.QueryForPaginatedList<User>(UserNamespace, "GetUsers", out totalRecords, so),
                so);
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
