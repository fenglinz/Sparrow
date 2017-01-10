using Mercurius.Core.Interfaces.Entities;
using Mercurius.Core.Interfaces.Entities.SO;
using Mercurius.EntityBase;

namespace Mercurius.Core.Interfaces.Services
{
    /// <summary>
    /// 组织信息服务接口。
    /// </summary>
    public interface IOrganizationService
    {
        /// <summary>
        /// 添加或者更新组织机构信息。
        /// </summary>
        /// <param name="org">组织机构信息</param>
        /// <returns>添加或更新结果</returns>
        Response CreateOrUpdate(Organization org);

        /// <summary>
        /// 删除组织机构信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>删除结果</returns>
        Response Remove(string id);
        
        /// <summary>
        /// 添加机构成员。
        /// </summary>
        /// <param name="id">机构编号</param>
        /// <param name="users">成员编号集合</param>
        /// <returns>添加结果</returns>
        Response AddMembers(string id, params string[] users);

        /// <summary>
        /// 删除机构成员。
        /// </summary>
        /// <param name="id">机构编号</param>
        /// <param name="users">成员编号集合</param>
        /// <returns></returns>
        Response RemoveMembers(string id, params string[] users);

        /// <summary>
        /// 获取组织机构信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>组织机构信息</returns>
        Response<Organization> GetOrganizationById(string id);

        /// <summary>
        /// 获取组织机构信息。
        /// </summary>
        /// <returns>组织机构信息</returns>
        ResponseSet<Organization> GetOrganizations();

        /// <summary>
        /// 获取未分配给该组织的用户。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>用户信息集合</returns>
        ResponseSet<User> GetUnAllotUsers(OrganizationSO so);
    }
}
