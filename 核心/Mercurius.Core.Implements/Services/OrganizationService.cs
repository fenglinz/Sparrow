using Mercurius.Core.Interfaces.Entities;
using Mercurius.Core.Interfaces.SearchObjects;
using Mercurius.Core.Interfaces.Services;
using Mercurius.EntityBase;
using Mercurius.Infrastructure;
using Mercurius.RepositoryBase;
using Mercurius.ServiceBase;

namespace Mercurius.Core.Implements.Services
{
    /// <summary>
    /// 组织信息服务接口实现。
    /// </summary>
    [Module("基于角色的访问控制模块")]
    public class OrganizationService : ServiceSupport, IOrganizationService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Repositories.Core.Organization";

        #endregion

        #region IOrganizationService接口实现

        /// <summary>
        /// 添加或者更新组织机构信息。
        /// </summary>
        /// <param name="org">组织机构信息</param>
        /// <returns>添加或更新结果</returns>
        public Response CreateOrUpdate(Organization org)
        {
            return this.InvokeService(
                nameof(CreateOrUpdate),
                () =>
                {
                    this.Persistence.Update(NS, "CreateOrUpdate", org);

                    this.ClearCache<User>();
                    this.ClearCache<Organization>();
                }, org);
        }

        /// <summary>
        /// 删除组织机构信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>删除结果</returns>
        public Response Remove(string id)
        {
            return this.InvokeService(nameof(Remove), () =>
            {
                this.Persistence.Delete(NS, "Remove", id);

                this.ClearCache<User>();
                this.ClearCache<Organization>();
            }, id);
        }

        /// <summary>
        /// 添加机构成员。
        /// </summary>
        /// <param name="id">机构编号</param>
        /// <param name="users">成员编号集合</param>
        /// <returns>添加结果</returns>
        public Response AddMembers(string id, params string[] users)
        {
            return this.InvokeService(nameof(AddMembers), () =>
            {
                this.Persistence.Create(NS, "AddMembers", new
                {
                    Id = id,
                    UserIds = users,
                    CreateUserId = WebHelper.GetLogOnUserId()
                });

                this.ClearCache<User>();
            }, new { id, users });
        }

        /// <summary>
        /// 删除机构成员。
        /// </summary>
        /// <param name="id">机构编号</param>
        /// <param name="users">成员编号集合</param>
        /// <returns>删除结果</returns>
        public Response RemoveMembers(string id, params string[] users)
        {
            return this.InvokeService(nameof(RemoveMembers), () =>
            {
                this.Persistence.Delete(NS, "RemoveMembers", new
                {
                    Id = id,
                    UserIds = users,
                    CreateUserId = WebHelper.GetLogOnUserId()
                });

                this.ClearCache<User>();
            }, new { id, users });
        }

        /// <summary>
        /// 获取组织机构信息.
        /// </summary>
        /// <param name="id">组织ID</param>
        /// <returns>组织机构信息</returns>
        public Response<Organization> GetOrganizationById(string id)
        {
            return this.InvokeService(
                nameof(GetOrganizationById),
                () => this.Persistence.QueryForObject<Organization>(NS, "GetOrganizationById", id), id);
        }

        /// <summary>
        /// 获取组织机构信息。
        /// </summary>
        /// <returns>组织机构信息</returns>
        public ResponseSet<Organization> GetOrganizations()
        {
            return this.InvokeService(
                nameof(GetOrganizations),
                () => this.Persistence.QueryForList<Organization>(NS, "GetOrganizations"));
        }

        /// <summary>
        /// 获取未分配给该组织的用户。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>用户信息集合</returns>
        public ResponseSet<User> GetUnAllotUsers(OrganizationSO so)
        {
            return this.InvokePagingService(nameof(GetUnAllotUsers),
                (out int totalRecords) => this.Persistence.QueryForPaginatedList<User>(NS, "GetUnAllotUsers", out totalRecords, so), so);
        }

        #endregion
    }
}
