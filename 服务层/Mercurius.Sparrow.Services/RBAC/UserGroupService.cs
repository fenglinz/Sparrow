using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Contracts.RBAC;
using Mercurius.Sparrow.Entities;
using Mercurius.Sparrow.Entities.RBAC;
using Mercurius.Sparrow.Repositories;
using Mercurius.Sparrow.Services.Support;
using static Mercurius.Sparrow.Repositories.StatementNamespaces.RBAC;

namespace Mercurius.Sparrow.Services.RBAC
{
    /// <summary>
    /// 用户组信息服务接口实现。
    /// </summary>
    [Module("基于角色的访问控制模块")]
    public class UserGroupService : ServiceSupport, IUserGroupService
    {
        #region IUserGroupService接口实现

        /// <summary>
        /// 添加或修改用户组信息。
        /// </summary>
        /// <param name="userGroup">用户组信息</param>
        /// <returns>操作结果</returns>
        public Response CreateOrUpdate(UserGroup userGroup)
        {
            return this.InvokeService(nameof(CreateOrUpdate),
                () =>
                {
                    this.Persistence.Update(UserGroupNamespace, "CreateOrUpdate", userGroup);
                    
                    this.ClearCache<UserGroup>();
                }, userGroup);
        }

        /// <summary>
        /// 删除用户组。
        /// </summary>
        /// <param name="id">用户组编号</param>
        /// <returns>删除结果</returns>
        public Response Remove(string id)
        {
            return this.InvokeService(nameof(Remove), () =>
            {
                this.Persistence.Delete(UserGroupNamespace, "Remove", id);

                this.ClearCache<UserGroup>();
                this.ClearCache<SystemMenu>();
            }, id);
        }

        /// <summary>
        /// 添加用户组成员。
        /// </summary>
        /// <param name="id">用户组编号</param>
        /// <param name="users">组成员编号集合</param>
        /// <returns>添加结果</returns>
        public Response AddMembers(string id, params string[] users)
        {
            var args = new { Id = id, UserIds = users, CreateUserId = WebHelper.GetLogOnUserId() };

            return this.InvokeService(nameof(AddMembers),
                () =>
                {
                    this.Persistence.Create(UserGroupNamespace, "AddMembers", args);

                    this.ClearCache<User>();
                }, new { id, users });
        }

        /// <summary>
        /// 删除角色组成员。
        /// </summary>
        /// <param name="id">用户组编号</param>
        /// <param name="users">组成员编号集合</param>
        /// <returns>删除结果</returns>
        public Response RemoveMembers(string id, params string[] users)
        {
            var args = new { Id = id, UserIds = users };

            return this.InvokeService(nameof(RemoveMembers),
                () =>
                {
                    this.Persistence.Delete(UserGroupNamespace, "RemoveMembers", args);

                    this.ClearCache<User>();
                }, new { id, users });
        }

        /// <summary>
        /// 获取用户组信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>用户组信息</returns>
        public Response<UserGroup> GetUserGroupById(string id)
        {
            return this.InvokeService(nameof(GetUserGroupById),
                () => this.Persistence.QueryForObject<UserGroup>(UserGroupNamespace, "GetUserGroupById", id), id);
        }

        /// <summary>
        /// 获取用户组信息。
        /// </summary>
        /// <returns>用户组集合信息</returns>
        public ResponseCollection<UserGroup> GetUserGroups()
        {
            return this.InvokeService(nameof(GetUserGroups), () => this.Persistence.QueryForList<UserGroup>(UserGroupNamespace, "GetUserGroups"));
        }

        /// <summary>
        /// 获取用户组成员。
        /// </summary>
        /// <param name="id">用户组编号</param>
        /// <returns>用户组成员</returns>
        public ResponseCollection<User> GetMembers(string id)
        {
            return this.InvokeService(nameof(GetMembers), () => this.Persistence.QueryForList<User>(UserGroupNamespace, "GetMembers", id), id);
        }

        /// <summary>
        /// 获取未分配到指定组的用户信息。
        /// </summary>
        /// <param name="id">用户组编号</param>
        /// <returns>用户集合信息</returns>
        public ResponseCollection<User> GetUnAllotUsers(string id)
        {
            return this.InvokeService(nameof(GetUnAllotUsers),
                () => this.Persistence.QueryForList<User>(UserGroupNamespace, "GetUnAllotUsers", id), id);
        }

        #endregion
    }
}
