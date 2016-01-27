using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Mercurius.Siskin.Entities.WebApi;
using Mercurius.Siskin.Entities.WebApi.SO;

namespace Mercurius.Siskin.Contracts.WebApi
{
    /// <summary>
    /// Web API信息业务逻辑接口。
    /// </summary>
    public interface IApiService
    {
        /// <summary>
        /// 添加Web API信息。
        /// </summary>
        /// <param name="api">Web API信息</param>
        /// <returns>返回添加结果</returns>
        Response Create(Api api);

        /// <summary>
        /// 编辑Web API信息。
        /// </summary>
        /// <param name="api">Web API信息</param>
        /// <returns>返回编辑结果</returns>
        Response Update(Api api);

        /// <summary>
        /// 添加或者编辑Web API信息
        /// </summary>
        /// <param name="api">Web API信息</param>
        /// <returns>返回添加或保存结果</returns>
        Response CreateOrUpdate(Api api);

        /// <summary>
        /// 根据主键删除Web API信息信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回删除结果</returns>
        Response Remove(int id);

        /// <summary>
        /// 清空路由信息
        /// </summary>
        /// <returns></returns>
        Response Truncate();

        /// <summary>
        /// 根据主键获取Web API信息信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回Web API信息查询结果</returns>
        Response<Api> GetApiById(int id);

        /// <summary>
        /// 查询并分页获取Web API信息信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回结果</returns>
        ResponseCollection<Api> SearchApis(ApiSO so);
    }
}
