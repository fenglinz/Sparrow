using Mercurius.Sparrow.Entities.RBAC;

namespace Mercurius.Sparrow.Contracts.RBAC
{
    /// <summary>
    /// 组织信息服务接口。
    /// </summary>
    public interface IOrganizationService
    {
        /// <summary>
        /// 获取组织机构信息
        /// </summary>
        /// <param name="id">组织ID</param>
        /// <returns>组织机构信息</returns>
        Response<Organization> GetOrganizationById(string id);

        /// <summary>
        /// 获取组织机构信息。
        /// </summary>
        /// <returns>组织机构信息</returns>
        ResponseCollection<Organization> GetOrganizations();

        /// <summary>
        /// 获取人员组织机构信息。
        /// </summary>
        /// <returns>人员组织机构信息</returns>
        ResponseCollection<StaffOrganize> GetStaffOrganizes();

       /// <summary>
        /// 新增或修改数据
        /// </summary>
        /// <param name="org">Organization对象</param>
        /// <returns></returns>
        Response CreateOrUpdate(Organization org);
    }
}
