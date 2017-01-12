using System.Collections.Generic;
using Mercurius.Core.Interfaces.Entities;
using Mercurius.Core.Interfaces.SearchObjects;
using Mercurius.Prime.Core.Services;

namespace Mercurius.Core.Interfaces.Services
{
    /// <summary>
    /// 全球化信息服务接口。
    /// </summary>
    public interface IGlobalizationService
    {
        /// <summary>
        /// 添加或者编辑全局资源。
        /// </summary>
        /// <param name="key">键</param>
        /// <param name="value">值</param>
        /// <param name="remark">备注信息</param>
        Response CreateOrUpdateGlobalResource(string key, string value, string remark);

        /// <summary>
        /// 添加或者编辑资源信息。
        /// </summary>
        /// <param name="resource">资源信息</param>
        Response CreateOrUpdateResource(Globalization resource);

        /// <summary>
        /// 删除资源信息。
        /// </summary>
        /// <param name="id">资源编号</param>
        Response Remove(string id);

        /// <summary>
        /// 获取全局视图资源。
        /// </summary>
        /// <param name="key">键</param>
        /// <returns>值</returns>
        string GetGlobalResource(string key);

        /// <summary>
        /// 获取视图资源信息。
        /// </summary>
        /// <param name="controller">控制器</param>
        /// <param name="view">视图</param>
        /// <param name="area">区域</param>
        /// <returns>资源信息字典</returns>
        Dictionary<string, string> GetResources(string controller, string view, string area = null);

        /// <summary>
        /// 获取资源信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>资源信息</returns>
        Response<Globalization> GetResource(string id);

        /// <summary>
        /// 获取全局视图资源信息。
        /// </summary>
        /// <param name="so">查询对象</param>
        /// <returns>视图资源列表</returns>
        ResponseSet<Globalization> GetGlobalResources(SearchObject so);

        /// <summary>
        /// 获取本地视图资源信息。
        /// </summary>
        /// <param name="so">查询对象</param>
        /// <returns>视图资源列表</returns>
        ResponseSet<Globalization> GetLocalResources(GlobalizationSO so);
    }
}
