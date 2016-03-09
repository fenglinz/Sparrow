using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Mercurius.Sparrow.Entities.WebApi;
using Mercurius.Sparrow.Entities.WebApi.SO;

namespace Mercurius.Sparrow.Contracts.WebApi
{
    /// <summary>
    /// WebApi权限列表业务逻辑接口。
    /// </summary>
    public interface IRolePermissionService
    {
        /// <summary>
        /// 添加WebApi权限列表。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <param name="permissions">角色权限集合</param>
        /// <returns>返回添加结果</returns>
        Response Create(int roleId ,IList<RolePermission> permissions);

        /// <summary>
        /// 查询并分页获取WebApi权限列表信息。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <returns>返回结果</returns>
        ResponseCollection<RolePermission> GetRolePermissions(int roleId);
    }
}
