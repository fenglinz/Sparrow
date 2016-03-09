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
    [Module("Web Api模块")]
    public class RolePermissionService : ServiceSupport, IRolePermissionService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Sparrow.Repositories.WebApi.RolePermission";

        #endregion

        #region IRolePermissionService接口实现 

        /// <summary>
        /// 添加WebApi权限列表。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <param name="permissions">角色权限集合</param>
        /// <returns>返回添加结果</returns>
        public Response Create(int roleId, IList<RolePermission> permissions)
        {
            var args = new { RoleId = roleId, Permissions = permissions };

            return this.InvokeService(
                nameof(Create),
                () =>
                {
                    this.Persistence.Create(NS, "Create", args);

                    this.ClearCache<RolePermission>();
                },
                args);
        }

        /// <summary>
        /// 查询并分页获取WebApi权限列表信息。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <returns>返回结果</returns>
        public ResponseCollection<RolePermission> GetRolePermissions(int roleId)
        {
            return this.InvokeService(nameof(GetRolePermissions),
                () => this.Persistence.QueryForList<RolePermission>(NS, "GetRolePermissions", roleId), args: roleId);
        }

        #endregion
    }
}
