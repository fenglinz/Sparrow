using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Entities.WebApi;
using Mercurius.Sparrow.Entities.WebApi.SO;
using Mercurius.Sparrow.Contracts.WebApi;
using Mercurius.Sparrow.Repositories;
using Mercurius.Sparrow.Services.Support;

namespace Mercurius.Sparrow.Services.WebApi
{
    /// <summary>
    /// Web API信息业务逻辑接口实现。 
    /// </summary>
    [Module("Web Api模块")]
    public class ApiService : ServiceSupport, IApiService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Sparrow.Repositories.WebApi.Api";

        #endregion

        #region IApiService接口实现 

        /// <summary>
        /// 添加Web API信息。
        /// </summary>
        /// <param name="apis">Web API信息</param>
        /// <returns>返回结果</returns>
        public Response Adds(IList<Api> apis)
        {
            var args = new
            {
                Apis = apis,
                CreateUserId = apis?.FirstOrDefault().CreateUserId,
                ModifyUserId = apis?.FirstOrDefault().ModifyUserId
            };

            return this.InvokeService(
                nameof(Adds),
                () =>
                {
                    this.Persistence.Create(NS, "Create", args);

                    this.ClearCache<Api>();
                    this.ClearCache<Role>();
                },
                args);
        }

        /// <summary>
        /// 添加或者编辑Web API信息
        /// </summary>
        /// <param name="api">Web API信息</param>
        /// <returns>返回添加或保存结果</returns>
        public Response CreateOrUpdate(Api api)
        {
            return this.InvokeService(
                nameof(CreateOrUpdate),
                () =>
                {
                    this.Persistence.Update(NS, "CreateOrUpdate", api);

                    this.ClearCache<Api>();
                },
                api);
        }

        /// <summary>
        /// 根据主键删除Web API信息信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回删除结果</returns>
        public Response Remove(int id)
        {
            return this.InvokeService(nameof(Remove), () =>
            {
                this.Persistence.Delete(NS, "Remove", id);

                this.ClearCache<Api>();
            }, id);
        }

        /// <summary>
        /// 清空路由信息
        /// </summary>
        /// <returns></returns>
        public Response Truncate()
        {
            return this.InvokeService(nameof(Truncate), () =>
            {
                this.Persistence.Delete(NS, "Truncate");

                this.ClearCache<Api>();
            });
        }

        /// <summary>
        /// 根据主键获取Web API信息信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回Web API信息查询结果</returns>
        public Response<Api> GetApiById(int id)
        {
            return this.InvokeService(
                nameof(GetApiById),
                () => this.Persistence.QueryForObject<Api>(NS, "GetById", id),
                id);
        }

        /// <summary>
        /// 查询并分页获取Web API信息信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回Web API信息的分页查询结果</returns>
        public ResponseCollection<Api> SearchApis(ApiSO so)
        {
            so = so ?? new ApiSO();

            return this.InvokePagingService(
                nameof(SearchApis),
                (out int totalRecords) => this.Persistence.QueryForPaginatedList<Api>(NS, "SearchApis", out totalRecords, so),
                so);
        }

        #endregion
    }
}
