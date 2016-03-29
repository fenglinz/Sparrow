using Mercurius.Sparrow.Entities.RBAC;
using Mercurius.Sparrow.Entities.RBAC.SO;

namespace Mercurius.Sparrow.Contracts.RBAC
{
    /// <summary>
    /// 角色信息服务接口。
    /// </summary>
    public interface IRoleService
    {
        /// <summary>
        /// 添加或者编辑角色信息。
        /// </summary>
        /// <param name="role">角色信息</param>
        Response CreateOrUpdate(Role role);

        /// <summary>
        /// 删除用户角色。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>删除结果</returns>
        Response Remove(string id);

        /// <summary>
        /// 添加角色成员。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <param name="users">用户编号列表</param>
        /// <returns>添加结果</returns>
        Response AddMembers(string id, params string[] users);

        /// <summary>
        /// 删除角色成员。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <param name="users">用户编号列表</param>
        /// <returns>删除结果</returns>
        Response RemoveMembers(string id, params string[] users);

        /// <summary>
        /// 获取角色信息。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>角色信息</returns>
        Response<Role> GetRoleById(string id);

        /// <summary>
        /// 获取角色信息。
        /// </summary>
        /// <returns>角色信息列表</returns>
        ResponseCollection<Role> GetRoles();

        /// <summary>
        /// 获取用户拥有的角色。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <returns>角色列表</returns>
        ResponseCollection<Role> GetRolesById(string userId);

        /// <summary>
        /// 查询角色成员。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>角色成员信息</returns>
        ResponseCollection<User> GetMembers(UserSO so);

        /// <summary>
        /// 获取未分配角色的用户。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>角色成员信息</returns>
        ResponseCollection<User> GetUnAllotUsers(UserSO so);
    }
}
