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
    /// WebApi权限列表业务逻辑接口实现。 
    /// </summary>
    public class RolePermissionService : ServiceSupport, IRolePermissionService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Sparrow.Repositories.WebApi.RolePermission";

        #endregion

        #region IRolePermissionService接口实现 

        /// <summary>
        /// 添加WebApi权限列表。
        /// </summary>
        /// <param name="rolePermission">WebApi权限列表</param>
        /// <returns>返回结果</returns>
        public Response Create(RolePermission rolePermission)
        {
            return this.InvokeService(
                "Create",
                () =>
                {
                    this.Persistence.Create(NS, "Create", rolePermission);

                    this.ClearCache<RolePermission>();
                },
                rolePermission);
        }

        /// <summary>
        /// 编辑WebApi权限列表。
        /// </summary>
        /// <param name="rolePermission">WebApi权限列表</param>
        /// <returns>返回结果</returns>
        public Response Update(RolePermission rolePermission)
        {
            return this.InvokeService(
                "Update",
                () =>
                {
                    this.Persistence.Update(NS, "Update", rolePermission);

                    this.ClearCache<RolePermission>();
                },
                rolePermission);
        }

        /// <summary>
        /// 添加或者编辑WebApi权限列表
        /// </summary>
        /// <param name="rolePermission">WebApi权限列表</param>
        /// <returns>返回添加或保存结果</returns>
        public Response CreateOrUpdate(RolePermission rolePermission)
        {
            return this.InvokeService(
                "CreateOrUpdate",
                () =>
                {
                    this.Persistence.Update(NS, "CreateOrUpdate", rolePermission);

                    this.ClearCache<RolePermission>();
                },
                rolePermission);
        }

        /// <summary>
        /// 根据主键删除WebApi权限列表信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回删除结果</returns>
        public Response Remove(int id)
        {
            return this.InvokeService("Remove", () =>
            {
                this.Persistence.Delete(NS, "Remove", id);

                this.ClearCache<RolePermission>();
            }, id);
        }

        /// <summary>
        /// 根据主键获取WebApi权限列表信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回WebApi权限列表查询结果</returns>
        public Response<RolePermission> GetRolePermissionById(int id)
        {
            return this.InvokeService(
                "GetRolePermissionById",
                () => this.Persistence.QueryForObject<RolePermission>(NS, "GetById", id),
                args: id);
        }

        /// <summary>
        /// 查询并分页获取WebApi权限列表信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回WebApi权限列表的分页查询结果</returns>
        public ResponseCollection<RolePermission> SearchRolePermissions(RolePermissionSO so)
        {
            so = so ?? new RolePermissionSO();

            return this.InvokePagingService(
                "SearchRolePermissions",
                (out int totalRecords) => this.Persistence.QueryForPaginatedList<RolePermission>(NS, "SearchRolePermissions", out totalRecords, so),
                args: so);
        }

        #endregion

        #region 重写基类方法

        protected override string GetModelName()
        {
            return "Web Api模块";
        }

        #endregion

    }
}
