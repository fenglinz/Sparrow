using System.Collections.Generic;
using System.Linq;
using Mercurius.Kernel.Contracts.WebApi.Entities;
using Mercurius.Kernel.Contracts.WebApi.SearchObjects;
using Mercurius.Kernel.Contracts.WebApi.Services;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Services;
using Mercurius.Prime.Data.Support;

namespace Mercurius.WebApi.Implementations.WebApi.Services
{
    /// <summary>
    /// Web API信息业务逻辑接口实现。 
    /// </summary>
    [Module("Web Api模块")]
    public class ApiService : ServiceSupport, IApiService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Kernel.Repositories.WebApi.Api";

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

            return this.Create(NS, "Create", args,
                () =>
                {
                    this.ClearCache<Api>();
                    this.ClearCache<Role>();
                });
        }

        /// <summary>
        /// 添加或者编辑Web API信息
        /// </summary>
        /// <param name="api">Web API信息</param>
        /// <returns>返回添加或保存结果</returns>
        public Response CreateOrUpdate(Api api)
        {
            return this.Update<Api>(NS, "CreateOrUpdate", api);
        }

        /// <summary>
        /// 根据主键删除Web API信息信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回删除结果</returns>
        public Response Remove(int id)
        {
            return this.Delete<Api>(NS, "Remove", id);
        }

        /// <summary>
        /// 清空路由信息
        /// </summary>
        /// <returns></returns>
        public Response Truncate()
        {
            return this.Delete<Api>(NS, "Truncate", null);
        }

        /// <summary>
        /// 根据主键获取Web API信息信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回Web API信息查询结果</returns>
        public Response<Api> GetApiById(int id)
        {
            return this.QueryForObject<Api>(NS, "GetById", id);
        }

        /// <summary>
        /// 查询并分页获取Web API信息信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回Web API信息的分页查询结果</returns>
        public ResponseSet<Api> SearchApis(ApiSO so)
        {
            so = so ?? new ApiSO();

            return this.QueryForPagedList<Api>(NS, "SearchApis", so);
        }

        #endregion
    }
}
