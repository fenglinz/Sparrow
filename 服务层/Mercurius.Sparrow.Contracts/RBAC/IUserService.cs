using Mercurius.Sparrow.Entities.RBAC;
using Mercurius.Sparrow.Entities.RBAC.SO;

namespace Mercurius.Sparrow.Contracts.RBAC
{
    /// <summary>
    /// 用户服务接口。
    /// </summary>
    public interface IUserService
    {
        /// <summary>
        /// 更新用户状态。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="status">用户状态</param>
        /// <returns>执行结果</returns>
        Response UpdateUserStatus(string userId, int status);

        /// <summary>
        /// 更新用户密码。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <param name="oldPassword">用户旧密码</param>
        /// <param name="newPassword">用户新密码</param>
        Response ChangePassword(string id, string oldPassword, string newPassword);

        /// <summary>
        /// 添加或者修改用户信息。
        /// </summary>
        /// <param name="user">用户信息</param>
        /// <param name="departments">所属部门编号列表</param>
        /// <param name="roles">所属角色编号列表</param>
        /// <param name="groups">所属工作组编号列表</param>
        /// <param name="permissions">所属用户权限列表</param>
        /// <returns>执行结果</returns>
        Response CreateOrUpdateUser(User user, string[] departments, string[] roles, string[] groups, string[] permissions);

        /// <summary>
        /// 获取用户信息。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <returns>用户信息</returns>
        Response<User> GetUser(string id);

        /// <summary>
        /// 获取用户信息。
        /// </summary>
        /// <param name="account">登录账号</param>
        /// <returns>用户信息</returns>
        Response<User> GetUserByAccount(string account);

        /// <summary>
        /// 验证登录用户。
        /// </summary>
        /// <param name="account">登录账号</param>
        /// <param name="password">登录密码</param>
        /// <returns>用户信息</returns>
        Response<User> ValidateUser(string account, string password);

        /// <summary>
        /// 查询用户信息。
        /// </summary>
        /// <param name="so">用户信息查询对象</param>
        /// <returns>用户信息列表</returns>
        ResponseCollection<User> GetUsers(UserSO so);

        /// <summary>
        /// 查询角色成员。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>角色成员信息</returns>
        ResponseCollection<User> GetUsersByRole(string id);

        /// <summary>
        /// 获取未分配角色的用户。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>角色成员信息</returns>
        ResponseCollection<User> GetUnAllotRoleUsers(string id);

        /// <summary>
        /// 获取用户组成员。
        /// </summary>
        /// <param name="id">用户组编号</param>
        /// <returns>用户组成员信息</returns>
        ResponseCollection<User> GetUsersByGroup(string id);

        /// <summary>
        /// 获取未分组的用户信息。
        /// </summary>
        /// <param name="userGroupId">用户组Id</param>
        /// <returns>用户信息列表</returns>
        ResponseCollection<User> GetUnAllotGroupUsers(string userGroupId);

        /// <summary>
        /// 添加首页快捷方式信息。
        /// </summary>
        /// <param name="homeShortcut">首页快捷方式信息</param>
        /// <returns>操作结果</returns>
        Response CreateOrUpdateHomeShortcut(HomeShortcut homeShortcut);

        /// <summary>
        /// 删除用户首页快捷方式。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="args">快捷方式编号</param>
        /// <returns>操作结果</returns>
        Response RemoveHomeShortcut(string userId, params string[] args);

        /// <summary>
        /// 获取首页快捷方式信息。
        /// </summary>
        /// <param name="id">快捷方式编号</param>
        /// <returns>首页快捷方式信息</returns>
        Response<HomeShortcut> GetHomeShortcut(string id);

        /// <summary>
        /// 获取用户定义的首页快捷方式。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <returns>首页快捷方式列表</returns>
        ResponseCollection<HomeShortcut> GetHomeShortcuts(string userId);

        /// <summary>
        /// 添加或者修改用户组信息。
        /// </summary>
        /// <param name="userGroup">用户组信息</param>
        /// <returns>执行结果</returns>
        Response CreateOrUpdateUserGroup(UserGroup userGroup);

        /// <summary>
        /// 获取用户组信息。
        /// </summary>
        /// <param name="id">用户组信息编号</param>
        /// <returns>用户组信息</returns>
        Response<UserGroup> GetUserGroup(string id);

        /// <summary>
        /// 获取用户组信息。
        /// </summary>
        /// <returns>用户组列表</returns>
        ResponseCollection<UserGroup> GetUserGroups();

        /// <summary>
        /// 添加用户组成员。
        /// </summary>
        /// <param name="id">用户组编号</param>
        /// <param name="args">用户列表</param>
        Response AddUserGroupMembers(string id, params string[] args);

        /// <summary>
        /// 删除用户组成员。
        /// </summary>
        /// <param name="id">用户组编号</param>
        /// <param name="userId">用户编号</param>
        Response RemoveUserGroupMember(string id, string userId);
    }
}
