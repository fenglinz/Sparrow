using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Contracts.RBAC;
using Mercurius.Sparrow.Entities;
using Mercurius.Sparrow.Entities.RBAC;
using Mercurius.Sparrow.Services.Support;
using static Mercurius.Sparrow.Repositories.StatementNamespaces.RBAC;

namespace Mercurius.Sparrow.Services.RBAC
{
    /// <summary>
    /// 角色信息服务接口实现。
    /// </summary>
    public class RoleService : ServiceSupport, IRoleService
    {
        #region IRoleService接口实现

        /// <summary>
        /// 添加或者编辑角色信息。
        /// </summary>
        /// <param name="role">角色信息</param>
        public Response CreateOrUpdate(Role role)
        {
            return this.InvokeService(
                "CreateOrUpdate",
                () =>
                {
                    this.Persistence.Update(RoleNamespace, "CreateOrUpdate", role);

                    this.ClearCache<Role>();
                },
                role);
        }

        /// <summary>
        /// 获取角色信息。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>角色信息</returns>
        public Response<Role> GetRole(string id)
        {
            return this.InvokeService(
                "GetRole",
                () => this.Persistence.QueryForObject<Role>(RoleNamespace, "GetRoleById", id),
                args: id);
        }

        /// <summary>
        /// 获取角色信息。
        /// </summary>
        /// <returns>角色信息列表</returns>
        public ResponseCollection<Role> GetRoles()
        {
            return this.InvokeService("GetRoles", () => this.Persistence.QueryForList<Role>(RoleNamespace, "GetRoles"));
        }

        /// <summary>
        /// 获取用户拥有的角色。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <returns>角色列表</returns>
        public ResponseCollection<Role> GetRolesByUser(string userId)
        {
            return this.InvokeService(
                "GetRolesByUser",
                () => this.Persistence.QueryForList<Role>(RoleNamespace, "GetRolesByUser", userId),
                args: userId);
        }

        /// <summary>
        /// 获取角色拥有的用户。
        /// </summary>
        /// <param name="roleId">角色信息</param>
        /// <returns>用户角色信息</returns>
        public ResponseCollection<UserRole> GetRoleUsers(string roleId)
        {
            return this.InvokeService(
                "GetRoleUsers",
                () => this.Persistence.QueryForList<UserRole>(RoleNamespace, "GetRoleUsers", roleId),
                args: roleId);
        }

        #endregion

        #region 重写基类方法

        /// <summary>
        /// 获取模块名称。
        /// </summary>
        /// <returns>模块名称</returns>
        protected override string GetModelName()
        {
            return Constants.Model_RBAC;
        }

        #endregion
    }
}
