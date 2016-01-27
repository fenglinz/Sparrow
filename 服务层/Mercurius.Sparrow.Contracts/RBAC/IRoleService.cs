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
        /// 获取角色信息。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>角色信息</returns>
        Response<Role> GetRole(string id);

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
        ResponseCollection<Role> GetRolesByUser(string userId);

        /// <summary>
        /// 获取角色拥有的用户。
        /// </summary>
        /// <param name="roleId">角色信息</param>
        /// <returns>用户角色信息</returns>
        ResponseCollection<UserRole> GetRoleUsers(string roleId);
    }
}
