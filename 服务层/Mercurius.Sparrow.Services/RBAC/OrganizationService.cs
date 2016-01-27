﻿using Mercurius.Siskin.Contracts;
using Mercurius.Siskin.Contracts.RBAC;
using Mercurius.Siskin.Entities;
using Mercurius.Siskin.Entities.RBAC;
using Mercurius.Siskin.Services.Support;
using static Mercurius.Siskin.Repositories.StatementNamespaces.RBAC;

namespace Mercurius.Siskin.Services.RBAC
{
    /// <summary>
    /// 组织信息服务接口实现。
    /// </summary>
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
                "GetOrganizationById",
                () => this.Persistence.QueryForObject<Organization>(OrganizationNamespace, "GetOrganization", id),
                args: id);
        }

        /// <summary>
        /// 获取组织机构信息。
        /// </summary>
        /// <returns>组织机构信息</returns>
        public ResponseCollection<Organization> GetOrganizations()
        {
            return this.InvokeService(
                "GetOrganizations",
                () => this.Persistence.QueryForList<Organization>(OrganizationNamespace, "GetOrganizations"));
        }

        /// <summary>
        /// 获取人员组织机构信息。
        /// </summary>
        /// <returns>人员组织机构信息</returns>
        public ResponseCollection<StaffOrganize> GetStaffOrganizes()
        {
            return this.InvokeService(
                "GetStaffOrganizes",
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
                "CreateOrUpdate",
                () =>
                {
                    this.Persistence.Update(OrganizationNamespace, "CreateOrUpdate", org);

                    this.ClearCache<Organization>();
                    this.ClearCache<StaffOrganize>();
                },
                org);
        }

        #endregion

        #region 重写基类方法

        /// <summary>
        /// 获取模块名称。
        /// </summary>
        /// <returns>模块名称</returns>
        protected override string GetModelName()
        {
            return Constants.Model_RBAC;
        }

        #endregion
    }
}
