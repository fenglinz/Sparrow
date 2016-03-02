using System;
using System.Collections.Generic;
using System.Data;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Entities.WebApi;
using Mercurius.Sparrow.Entities.WebApi.SO;
using Mercurius.Sparrow.Contracts.WebApi;
using Mercurius.Sparrow.Repositories;
using Mercurius.Sparrow.Services.Support;

namespace Mercurius.Sparrow.Services.WebApi
{
    /// <summary>
    /// Web API角色业务逻辑接口实现。 
    /// </summary>
    [Module("Web Api模块")]
    public class RoleService : ServiceSupport, IRoleService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Sparrow.Repositories.WebApi.Role";
        private static readonly StatementNamespace ApiNS = "Mercurius.Sparrow.Repositories.WebApi.Api";

        #endregion

        #region IRoleService接口实现 

        /// <summary>
        /// 添加Web API角色。
        /// </summary>
        /// <param name="role">Web API角色</param>
        /// <returns>返回结果</returns>
        public Response Create(Role role)
        {
            return this.InvokeService(
                nameof(Create),
                () =>
                {
                    this.Persistence.Create(NS, "Create", role);

                    this.ClearCache<Role>();
                },
                role);
        }

        /// <summary>
        /// 编辑Web API角色。
        /// </summary>
        /// <param name="role">Web API角色</param>
        /// <returns>返回结果</returns>
        public Response Update(Role role)
        {
            return this.InvokeService(
                nameof(Update),
                () =>
                {
                    this.Persistence.Update(NS, "Update", role);

                    this.ClearCache<Role>();
                },
                role);
        }

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
            }, id);
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
                }, args);
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
                args: id);
        }

        /// <summary>
        /// 查询并分页获取Web API角色信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回Web API角色的分页查询结果</returns>
        public ResponseCollection<Role> SearchRoles(RoleSO so)
        {
            so = so ?? new RoleSO();

            return this.InvokePagingService(
                nameof(SearchRoles),
                (out int totalRecords) => this.Persistence.QueryForPaginatedList<Role>(NS, "SearchRoles", out totalRecords, so),
                args: so);
        }

        /// <summary>
        /// 获取已分配的用户。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>已分配的用户信息</returns>
        public ResponseCollection<User> GetAllotUsers(int id)
        {
            return this.InvokeService(nameof(GetAllotUsers), () => this.Persistence.QueryForList<User>(NS, "GetAllotUsers", id), args: id);
        }

        /// <summary>
        /// 获取未分配的用户。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <param name="account">账号</param>
        /// <returns>未分配的用户信息</returns>
        public ResponseCollection<User> GetUnAllotUsers(int roleId, string account = null)
        {
            var args = new { RoleId = roleId, Account = account };

            return this.InvokeService(nameof(GetUnAllotUsers), () => this.Persistence.QueryForList<User>(NS, "GetUnAllotUsers", args), args: args);
        }

        /// <summary>
        /// 获取已分配及未分配角色的权限
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public ResponseCollection<Api> GetRolePower(int roleId)
        {
            return this.InvokeService(nameof(GetRolePower), () => this.Persistence.QueryForList<Api>(ApiNS, "GetRolePower", roleId), args: roleId);
        }

        /// <summary>
        /// 分配用户权限
        /// </summary>
        /// <returns></returns>
        public Response AllotUserPower(Role role)
        {
            return this.InvokeService(
                nameof(AllotUserPower),
                () =>
                {
                    this.Persistence.Update(NS, "AllotUserPower", role);

                    this.ClearCache<Role>();
                },
                role);
        }

        #endregion
    }
}
