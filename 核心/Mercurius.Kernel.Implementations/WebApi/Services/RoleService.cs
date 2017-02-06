using System;
using System.Collections.Generic;
using System.Data;
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
            return this.InvokeService(
                nameof(CreateOrUpdate),
                () =>
                {
                    this.Persistence.Update(NS, "CreateOrUpdate", role);

                    this.ClearCache<Role>();
                },
                role);
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

            return this.InvokeService(nameof(AddMember),
                () =>
                {
                    this.Persistence.Create(NS, "AddMember", args);

                    this.ClearCache<Role>();
                    this.ClearCache<User>();
                }, args);
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

            return this.InvokeService(nameof(RemoveMember),
                () =>
                {
                    this.Persistence.Delete(NS, "RemoveMember", args);

                    this.ClearCache<Role>();
                    this.ClearCache<User>();
                }, args);
        }

        /// <summary>
        /// 根据主键删除Web API角色信息。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>返回删除结果</returns>
        public Response Remove(int id)
        {
            return this.InvokeService(nameof(Remove), () =>
            {
                this.Persistence.Delete(NS, "Remove", id);

                this.ClearCache<Role>();
                this.ClearCache<User>();
            }, id);
        }

        /// <summary>
        /// 根据主键获取数据。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>返回Web API角色查询结果</returns>
        public Response<Role> GetRoleById(int id)
        {
            return this.InvokeService(
                nameof(GetRoleById),
                () => this.Persistence.QueryForObject<Role>(NS, "GetById", id),
                id);
        }

        /// <summary>
        /// 查询并分页获取Web API角色信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回Web API角色的分页查询结果</returns>
        public ResponseSet<Role> SearchRoles(RoleSO so)
        {
            so = so ?? new RoleSO();

            return this.InvokePagingService(
                nameof(SearchRoles),
                (out int totalRecords) => this.Persistence.QueryForPaginatedList<Role>(NS, "SearchRoles", out totalRecords, so),
                so);
        }

        /// <summary>
        /// 获取已分配的用户。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>已分配的用户信息</returns>
        public ResponseSet<User> GetAllotUsers(int id)
        {
            return this.InvokeService(nameof(GetAllotUsers), () => this.Persistence.QueryForList<User>(NS, "GetAllotUsers", id), id);
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

            return this.InvokeService(nameof(GetUnAllotUsers), () => this.Persistence.QueryForList<User>(NS, "GetUnAllotUsers", args), args);
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

            return this.InvokeService(
                nameof(AllotPermissions),
                () =>
                {
                    this.Persistence.Create(NS, "AllotPermissions", args);

                    this.ClearCache<Api>();
                    this.ClearCache<Role>();
                },
                args);
        }

        /// <summary>
        /// 查询并分页获取WebApi权限列表信息。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <returns>返回结果</returns>
        public ResponseSet<Api> GetRolePermissions(int roleId)
        {
            return this.InvokeService(nameof(GetRolePermissions),
                () => this.Persistence.QueryForList<Api>(NS, "GetRolePermissions", roleId), roleId);
        }

        #endregion
    }
}
