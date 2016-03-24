using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Sparrow.Entities;
using Mercurius.Sparrow.Entities.RBAC;

namespace Mercurius.Sparrow.Contracts.RBAC
{
    /// <summary>
    /// 用户组信息服务接口。
    /// </summary>
    public interface IUserGroupService
    {
        /// <summary>
        /// 添加或修改用户组信息。
        /// </summary>
        /// <param name="userGroup">用户组信息</param>
        /// <returns>操作结果</returns>
        Response CreateOrUpdate(UserGroup userGroup);

        /// <summary>
        /// 删除用户组。
        /// </summary>
        /// <param name="id">用户组编号</param>
        /// <returns>删除结果</returns>
        Response Remove(string id);

        /// <summary>
        /// 添加用户组成员。
        /// </summary>
        /// <param name="id">用户组编号</param>
        /// <param name="users">组成员编号集合</param>
        /// <returns>添加结果</returns>
        Response AddMembers(string id, params string[] users);

        /// <summary>
        /// 删除角色组成员。
        /// </summary>
        /// <param name="id">用户组编号</param>
        /// <param name="users">组成员编号集合</param>
        /// <returns>删除结果</returns>
        Response RemoveMembers(string id, params string[] users);

        /// <summary>
        /// 获取用户组信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>用户组信息</returns>
        Response<UserGroup> GetUserGroupById(string id);

        /// <summary>
        /// 获取用户组信息。
        /// </summary>
        /// <returns>用户组集合信息</returns>
        ResponseCollection<UserGroup> GetUserGroups();

        /// <summary>
        /// 获取用户组成员。
        /// </summary>
        /// <param name="id">用户组编号</param>
        /// <returns>用户组成员</returns>
        ResponseCollection<User> GetMembers(string id);

        /// <summary>
        /// 获取未分配到指定组的用户信息。
        /// </summary>
        /// <param name="id">用户组编号</param>
        /// <returns>用户集合信息</returns>
        ResponseCollection<User> GetUnAllotUsers(string id);
    }
}
