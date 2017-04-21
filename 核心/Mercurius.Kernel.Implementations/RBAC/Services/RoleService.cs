using Mercurius.Kernel.Contracts.RBAC.Entities;
using Mercurius.Kernel.Contracts.RBAC.SearchObjects;
using Mercurius.Kernel.Contracts.RBAC.Services;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Services;
using Mercurius.Prime.Data.Support;

namespace Mercurius.Kernel.Implementations.RBAC.Services
{
    /// <summary>
    /// 角色信息服务接口实现。
    /// </summary>
    [Module("基于角色的访问控制模块")]
    public class RoleService : ServiceSupport, IRoleService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Kernel.Repositories.RBAC.Role";

        #endregion

        #region IRoleService接口实现

        /// <summary>
        /// 添加或者编辑角色信息。
        /// </summary>
        /// <param name="role">角色信息</param>
        public Response CreateOrUpdate(Role role)
        {
            return this.Update<Role>(NS, "CreateOrUpdate", role);
        }

        /// <summary>
        /// 删除用户角色。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>删除结果</returns>
        public Response Remove(string id)
        {
            return this.Delete<Role>(NS, "Remove", id);
        }

        /// <summary>
        /// 添加角色成员。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <param name="users">用户编号列表</param>
        /// <returns>添加结果</returns>
        public Response AddMembers(string id, params string[] users)
        {
            var args = new { Id = id, UserIds = users, CreateUserId = WebHelper.GetLogOnUserId() };

            return this.Create(NS, "AddMembers", args, () =>
            {
                this.ClearCache<User>();
                this.ClearCache<Role>();
            });
        }

        /// <summary>
        /// 删除角色成员。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <param name="users">用户编号列表</param>
        /// <returns>删除结果</returns>
        public Response RemoveMembers(string id, params string[] users)
        {
            var args = new { Id = id, UserIds = users };

            return this.Delete(NS, "RemoveMembers", args, () =>
            {
                this.ClearCache<User>();
                this.ClearCache<Role>();
            });
        }

        /// <summary>
        /// 获取角色信息。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>角色信息</returns>
        public Response<Role> GetRoleById(string id)
        {
            return this.QueryForObject<Role>(NS, "GetRoleById", id);
        }

        /// <summary>
        /// 获取角色信息。
        /// </summary>
        /// <returns>角色信息列表</returns>
        public ResponseSet<Role> GetRoles()
        {
            return this.QueryForList<Role>(NS, "GetRoles");
        }

        /// <summary>
        /// 获取用户拥有的角色。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <returns>角色列表</returns>
        public ResponseSet<Role> GetRolesById(string userId)
        {
            return this.QueryForList<Role>(NS, "GetRolesByUser", userId);
        }

        /// <summary>
        /// 查询角色成员。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>角色成员信息</returns>
        public ResponseSet<User> GetMembers(UserSO so)
        {
            return this.QueryForPagedList<User>(NS, "GetMembers", so);
        }

        /// <summary>
        /// 获取未分配角色的用户。
        /// </summary>
        /// <param name="so">查询信息</param>
        /// <returns>角色成员信息</returns>
        public ResponseSet<User> GetUnAllotUsers(UserSO so)
        {
            return this.QueryForPagedList<User>(NS, "GetUnAllotUsers", so);
        }

        #endregion
    }
}
