using System.Collections.Generic;
using Mercurius.Kernel.Contracts.WebApi.Services;
using Mercurius.Kernel.Contracts.WebApi.Entities;
using Mercurius.Kernel.Contracts.WebApi.SearchObjects;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Services;
using Mercurius.Prime.Data.Support;

namespace Mercurius.WebApi.Implementations.WebApi.Services
{
    /// <summary>
    /// Web API角色业务逻辑接口实现。 
    /// </summary>
    [Module("Web Api模块")]
    public class RoleService : ServiceSupport, IRoleService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Kernel.Repositories.WebApi.Role";

        #endregion

        #region IRoleService接口实现 

        /// <summary>
        /// 添加或者编辑Web API角色
        /// </summary>
        /// <param name="role">Web API角色</param>
        /// <returns>返回添加或保存结果</returns>
        public Response CreateOrUpdate(Role role)
        {
            return this.Update<Role>(NS, "CreateOrUpdate", role);
        }

        /// <summary>
        /// 添加角色成员。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <param name="userId">用户编号</param>
        /// <returns>返回添加结果</returns>
        public Response AddMember(int roleId, int userId)
        {
            var args = new { RoleId = roleId, UserId = userId };

            return this.Create(NS, "AddMember", args,
                () =>
                {
                    this.ClearCache<Role>();
                    this.ClearCache<User>();
                });
        }

        /// <summary>
        /// 删除角色成员。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <param name="userId">用户编号</param>
        /// <returns>返回删除结果</returns>
        public Response RemoveMember(int roleId, int userId)
        {
            var args = new { RoleId = roleId, UserId = userId };

            return this.Delete(NS, "RemoveMember", args,
                () =>
                {
                    this.ClearCache<Role>();
                    this.ClearCache<User>();
                });
        }

        /// <summary>
        /// 根据主键删除Web API角色信息。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>返回删除结果</returns>
        public Response Remove(int id)
        {
            return this.Delete(NS, "Remove", id,
                () =>
                {
                    this.ClearCache<Role>();
                    this.ClearCache<User>();
                });
        }

        /// <summary>
        /// 根据主键获取数据。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>返回Web API角色查询结果</returns>
        public Response<Role> GetRoleById(int id)
        {
            return this.QueryForObject<Role>(NS, "GetById", id);
        }

        /// <summary>
        /// 查询并分页获取Web API角色信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回Web API角色的分页查询结果</returns>
        public ResponseSet<Role> SearchRoles(RoleSO so)
        {
            return this.QueryForPagedList<Role>(NS, "SearchRoles", so);
        }

        /// <summary>
        /// 获取已分配的用户。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>已分配的用户信息</returns>
        public ResponseSet<User> GetAllotUsers(int id)
        {
            return this.QueryForList<User>(NS, "GetAllotUsers", id);
        }

        /// <summary>
        /// 获取未分配的用户。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <param name="account">账号</param>
        /// <returns>未分配的用户信息</returns>
        public ResponseSet<User> GetUnAllotUsers(int roleId, string account = null)
        {
            var args = new { RoleId = roleId, Account = account };

            return this.QueryForList<User>(NS, "GetUnAllotUsers", args);
        }

        /// <summary>
        /// 添加WebApi权限列表。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <param name="apis">Web Api集合</param>
        /// <returns>返回添加结果</returns>
        public Response AllotPermissions(int roleId, IList<int> apis)
        {
            var args = new
            {
                RoleId = roleId,
                CreateUserId = WebHelper.GetLogOnUserId(),
                Apis = apis
            };

            return this.Create(NS, "AllotPermissions", args,
                () =>
                {
                    this.ClearCache<Api>();
                    this.ClearCache<Role>();
                });
        }

        /// <summary>
        /// 查询并分页获取WebApi权限列表信息。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <returns>返回结果</returns>
        public ResponseSet<Api> GetRolePermissions(int roleId)
        {
            return this.QueryForList<Api>(NS, "GetRolePermissions", roleId);
        }

        #endregion
    }
}
