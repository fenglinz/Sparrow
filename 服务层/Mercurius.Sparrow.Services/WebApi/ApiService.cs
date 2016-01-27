using System;
using System.Collections.Generic;
using System.Data;
using Mercurius.Siskin.Contracts;
using Mercurius.Siskin.Entities.WebApi;
using Mercurius.Siskin.Entities.WebApi.SO;
using Mercurius.Siskin.Contracts.WebApi;
using Mercurius.Siskin.Repositories;
using Mercurius.Siskin.Services.Support;

namespace Mercurius.Siskin.Services.WebApi
{
    /// <summary>
    /// Web API信息业务逻辑接口实现。 
    /// </summary>
    public class ApiService : ServiceSupport, IApiService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Siskin.Repositories.WebApi.Api";

        #endregion

        #region IApiService接口实现 

        /// <summary>
        /// 添加Web API信息。
        /// </summary>
        /// <param name="api">Web API信息</param>
        /// <returns>返回结果</returns>
        public Response Create(Api api)
        {
            return this.InvokeService(
                "Create",
                () =>
                {
                    this.Persistence.Create(NS, "Create", api);

                    this.ClearCache<Api>();
                },
                api);
        }

        /// <summary>
        /// 编辑Web API信息。
        /// </summary>
        /// <param name="api">Web API信息</param>
        /// <returns>返回结果</returns>
        public Response Update(Api api)
        {
            return this.InvokeService(
                "Update",
                () =>
                {
                    this.Persistence.Update(NS, "Update", api);

                    this.ClearCache<Api>();
                },
                api);
        }

        /// <summary>
        /// 添加或者编辑Web API信息
        /// </summary>
        /// <param name="api">Web API信息</param>
        /// <returns>返回添加或保存结果</returns>
        public Response CreateOrUpdate(Api api)
        {
            return this.InvokeService(
                "CreateOrUpdate",
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
            return this.InvokeService("Remove", () =>
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
            return this.InvokeService("Truncate", () =>
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
                "GetApiById",
                () => this.Persistence.QueryForObject<Api>(NS, "GetById", id),
                args: id);
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
                "SearchApis",
                (out int totalRecords) => this.Persistence.QueryForPaginatedList<Api>(NS, "SearchApis", out totalRecords, so),
                args: so);
        }

        #endregion

        #region 重写基类方法

        protected override string GetModelName()
        {
            return "Web Api模块";
        }

        #endregion

    }
}
