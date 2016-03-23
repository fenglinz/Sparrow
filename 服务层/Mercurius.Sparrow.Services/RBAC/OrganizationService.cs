using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Contracts.RBAC;
using Mercurius.Sparrow.Entities;
using Mercurius.Sparrow.Entities.RBAC;
using Mercurius.Sparrow.Services.Support;
using static Mercurius.Sparrow.Repositories.StatementNamespaces.RBAC;

namespace Mercurius.Sparrow.Services.RBAC
{
    /// <summary>
    /// 组织信息服务接口实现。
    /// </summary>
    [Module("基于角色的访问控制模块")]
    public class OrganizationService : ServiceSupport, IOrganizationService
    {
        #region IOrganizationService接口实现

        /// <summary>
        /// 获取组织机构信息(单个)
        /// </summary>
        /// <param name="id">组织ID</param>
        /// <returns>组织机构信息</returns>
        public Response<Organization> GetOrganizationById(string id)
        {
            return this.InvokeService(
                nameof(GetOrganizationById),
                () => this.Persistence.QueryForObject<Organization>(OrganizationNamespace, "GetOrganization", id),
                id);
        }

        /// <summary>
        /// 获取组织机构信息。
        /// </summary>
        /// <returns>组织机构信息</returns>
        public ResponseCollection<Organization> GetOrganizations()
        {
            return this.InvokeService(
                nameof(GetOrganizations),
                () => this.Persistence.QueryForList<Organization>(OrganizationNamespace, "GetOrganizations"));
        }

        /// <summary>
        /// 获取人员组织机构信息。
        /// </summary>
        /// <returns>人员组织机构信息</returns>
        public ResponseCollection<StaffOrganize> GetStaffOrganizes()
        {
            return this.InvokeService(
                nameof(GetStaffOrganizes),
                () => this.Persistence.QueryForList<StaffOrganize>(OrganizationNamespace, "GetStaffOrganizes"));
        }

        /// <summary>
        /// 新增或修改数据
        /// </summary>
        /// <param name="org">Organization对象</param>
        /// <returns></returns>
        public Response CreateOrUpdate(Organization org)
        {
            return this.InvokeService(
                nameof(CreateOrUpdate),
                () =>
                {
                    this.Persistence.Update(OrganizationNamespace, "CreateOrUpdate", org);

                    this.ClearCache<User>();
                    this.ClearCache<Organization>();
                    this.ClearCache<StaffOrganize>();
                },
                org);
        }

        #endregion
    }
}
