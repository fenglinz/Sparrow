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
        /// <param name="rolePermission">WebApi权限列表</param>
        /// <returns>返回添加结果</returns>
        Response Create(RolePermission rolePermission);

        /// <summary>
        /// 编辑WebApi权限列表。
        /// </summary>
        /// <param name="rolePermission">WebApi权限列表</param>
        /// <returns>返回编辑结果</returns>
        Response Update(RolePermission rolePermission);

        /// <summary>
        /// 添加或者编辑WebApi权限列表
        /// </summary>
        /// <param name="rolePermission">WebApi权限列表</param>
        /// <returns>返回添加或保存结果</returns>
        Response CreateOrUpdate(RolePermission rolePermission);

        /// <summary>
        /// 根据主键删除WebApi权限列表信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回删除结果</returns>
        Response Remove(int id);

        /// <summary>
        /// 根据主键获取WebApi权限列表信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回WebApi权限列表查询结果</returns>
        Response<RolePermission> GetRolePermissionById(int id);

        /// <summary>
        /// 查询并分页获取WebApi权限列表信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回结果</returns>
        ResponseCollection<RolePermission> SearchRolePermissions(RolePermissionSO so);
    }
}
