using System;
using System.Linq;
using Mercurius.Kernel.Contracts.RBAC.Entities;
using Mercurius.Kernel.Contracts.RBAC.SearchObjects;
using Mercurius.Kernel.Contracts.RBAC.Services;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Services;
using Mercurius.Prime.Data.Support;

namespace Mercurius.Kernel.Implementations.RBAC.Services
{
    /// <summary>
    /// 用户服务接口实现。
    /// </summary>
    [Module("基于角色的访问控制模块")]
    public class UserService : ServiceSupport, IUserService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Kernel.Repositories.RBAC.User";

        #endregion

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
            return this.Transaction(
                rs =>
                {
                    user.DepartmentId = departments.FirstOrDefault();

                    this.Persistence.Update(NS, "CreateOrUpdate", user);
                    this.Persistence.Create(NS, "AddToOrganizations", new
                    {
                        UserId = user.Id,
                        CreateUserId = WebHelper.GetLogOnUserId(),
                        OrganizationIds = departments
                    });
                    this.Persistence.Create(NS, "AddToRoles", new
                    {
                        UserId = user.Id,
                        CreateUserId = WebHelper.GetLogOnUserId(),
                        RoleIds = roles
                    });

                    this.ClearCache<User>();
                    this.ClearCache<Role>();
                    this.ClearCache<Organization>();
                });
        }

        /// <summary>
        /// 删除用户信息。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <returns>删除结果</returns>
        public Response Remove(string id)
        {
            return this.Delete(NS, "Remove", id,
                rs =>
                {
                    if (string.CompareOrdinal(id, WebHelper.GetLogOnUserId()) == 0)
                    {
                        rs.ErrorMessage = "不能删除当前用户！";

                        return false;
                    }

                    return true;
                },
                rs =>
                {
                    this.ClearCache<User>();
                    this.ClearCache<Role>();
                    this.ClearCache<Organization>();
                });
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

            return this.Update<User>(
                NS, "ChangeStatus", args, null,
                callback: rs => this.AddOperationRecord("用户管理", userId, "将状态修改为：" + status));
        }

        /// <summary>
        /// 更新用户密码。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <param name="oldPassword">用户旧密码</param>
        /// <param name="newPassword">用户新密码</param>
        public Response ChangePassword(string id, string oldPassword, string newPassword)
        {
            return this.Update(NS, "ChangePassword",
                        new User { Id = id, Password = newPassword.Encrypt(), ModifyUserId = WebHelper.GetLogOnUserId() },
                        rs =>
                        {
                            if (string.IsNullOrWhiteSpace(newPassword))
                            {
                                rs.ErrorMessage = "新密码不能为空！";
                            }
                            else if (oldPassword == newPassword)
                            {
                                rs.ErrorMessage = "新密码不能与旧密码相同!";
                            }
                            else
                            {
                                var user = this.Persistence.QueryForObject<User>(NS, "GetUser", id);

                                if (user == null)
                                {
                                    rs.ErrorMessage = "用户不存在！";
                                }
                                else
                                {
                                    oldPassword = oldPassword.Encrypt();

                                    if (user.Password != oldPassword)
                                    {
                                        rs.ErrorMessage = "旧密码不正确！";
                                    }
                                    else
                                    {
                                        return true;
                                    }
                                }
                            }
                            return false;
                        }, rs =>
                        {
                            this.AddOperationRecord("用户管理", id, "修改了密码");
                        });
        }

        /// <summary>
        /// 获取用户信息。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <returns>用户信息</returns>
        public Response<User> GetUserById(string id)
        {
            return this.QueryForObject<User>(NS, "GetUserById", id);
        }

        /// <summary>
        /// 获取用户信息。
        /// </summary>
        /// <param name="account">登录账号</param>
        /// <returns>用户信息</returns>
        public Response<User> GetUserByAccount(string account)
        {
            return this.QueryForObject<User>(NS, "GetUserByAccount", account);
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

            return this.QueryForObject<User>(NS, "ValidateUser", args);
        }

        /// <summary>
        /// 获取报告者和直接下属信息。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <returns>报告者和直接下属信息</returns>
        public ResponseSet<User> GetRepoterAndSubordinates(string id)
        {
            return this.QueryForList<User>(NS, "GetRepoterAndSubordinates", id);
        }

        /// <summary>
        /// 查询用户信息。
        /// </summary>
        /// <param name="so">用户信息查询对象</param>
        /// <returns>用户信息列表</returns>
        public ResponseSet<User> SearchUsers(UserSO so)
        {
            return this.QueryForPagedList<User>(NS, "SearchUsers", so);
        }

        #endregion
    }
}
