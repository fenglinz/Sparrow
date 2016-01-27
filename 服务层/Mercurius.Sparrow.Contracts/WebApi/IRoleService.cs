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
    /// Web API角色业务逻辑接口。
    /// </summary>
    public interface IRoleService
    {
        /// <summary>
        /// 添加Web API角色。
        /// </summary>
        /// <param name="role">Web API角色</param>
        /// <returns>返回添加结果</returns>
        Response Create(Role role);

        /// <summary>
        /// 编辑Web API角色。
        /// </summary>
        /// <param name="role">Web API角色</param>
        /// <returns>返回编辑结果</returns>
        Response Update(Role role);

        /// <summary>
        /// 添加或者编辑Web API角色
        /// </summary>
        /// <param name="role">Web API角色</param>
        /// <returns>返回添加或保存结果</returns>
        Response CreateOrUpdate(Role role);

        /// <summary>
        /// 添加角色成员。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <param name="userId">用户编号</param>
        /// <returns>返回添加结果</returns>
        Response AddMember(int roleId, int userId);

        /// <summary>
        /// 根据主键删除Web API角色信息。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>返回删除结果</returns>
        Response Remove(int id);

        /// <summary>
        /// 删除角色成员。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <param name="userId">用户编号</param>
        /// <returns>返回删除结果</returns>
        Response RemoveMember(int roleId, int userId);

        /// <summary>
        /// 根据主键获取Web API角色信息。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>返回Web API角色查询结果</returns>
        Response<Role> GetRoleById(int id);

        /// <summary>
        /// 查询并分页获取Web API角色信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回结果</returns>
        ResponseCollection<Role> SearchRoles(RoleSO so);

        /// <summary>
        /// 获取已分配的用户。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>已分配的用户信息</returns>
        ResponseCollection<User> GetAllotUsers(int id);

        /// <summary>
        /// 获取未分配的用户。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <param name="account">账号</param>
        /// <returns>未分配的用户信息</returns>
        ResponseCollection<User> GetUnAllotUsers(int roleId, string account = null);

        /// <summary>
        /// 获取已分配及未分配角色的权限
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        ResponseCollection<Api> GetRolePower(int roleId);

        /// <summary>
        /// 分配用户权限
        /// </summary>
        /// <returns></returns>
        Response AllotUserPower(Role role);
    }
}
