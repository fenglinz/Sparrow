using System;
using System.Collections.Generic;
using System.Data;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Contracts.Core;
using Mercurius.Sparrow.Entities;
using Mercurius.Sparrow.Entities.Core;
using Mercurius.Sparrow.Entities.Core.SO;
using Mercurius.Sparrow.Services.Support;
using static Mercurius.Sparrow.Repositories.StatementNamespaces.Core;

namespace Mercurius.Sparrow.Services.Core
{
    /// <summary>
    /// 视图资源信息服务接口实现。
    /// </summary>
    [Module("基础模块")]
    public class GlobalizationService : ServiceSupport, IGlobalizationService
    {
        #region IGlobalizationService接口实现

        /// <summary>
        /// 获取全局视图资源。
        /// </summary>
        /// <param name="key">键</param>
        /// <returns>值</returns>
        public string GetGlobalResource(string key)
        {
            var result = this.InvokeService(
                nameof(GetGlobalResource),
                () => this.Persistence.QueryForObject<string>(GlobalizationNamespace, "GetGlobalResource", key), key);

            return (result.IsSuccess && !string.IsNullOrWhiteSpace(result.Data)) ? result.Data : key;
        }

        /// <summary>
        /// 获取视图资源信息。
        /// </summary>
        /// <param name="controller">控制器</param>
        /// <param name="view">视图</param>
        /// <param name="area">区域</param>
        /// <returns>资源信息字典</returns>
        public Dictionary<string, string> GetResources(string controller, string view, string area = null)
        {
            var args = new { Area = area, Controller = controller, View = view };

            return this.InvokeService(
                nameof(GetResources),
                () =>
                {
                    var table = this.Persistence.QueryForDataTable(GlobalizationNamespace, "GetResources", args);

                    var dict = new Dictionary<string, string>();

                    if (table != null)
                    {
                        foreach (DataRow item in table.Rows)
                        {
                            var key = Convert.ToString(item[0]);
                            var value = Convert.ToString(item[1]);

                            if (!dict.ContainsKey(key))
                            {
                                dict.Add(key, value);
                            }
                        }
                    }

                    return dict;
                }, args).Data;
        }

        /// <summary>
        /// 获取资源信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>资源信息</returns>
        public Response<Globalization> GetResource(string id)
        {
            return this.InvokeService(
                nameof(GetResource),
                () => this.Persistence.QueryForObject<Globalization>(GlobalizationNamespace, "GetResource", id), id);
        }

        /// <summary>
        /// 获取全局视图资源信息。
        /// </summary>
        /// <param name="so">查询对象</param>
        /// <returns>视图资源列表</returns>
        public ResponseCollection<Globalization> GetGlobalResources(SearchObject so)
        {
            return this.InvokePagingService(
                nameof(GetGlobalResources),
                (out int totalRecords) =>
                this.Persistence.QueryForPaginatedList<Globalization>(
                    GlobalizationNamespace,
                    "GetGlobalResources",
                    out totalRecords,
                    so),
                so);
        }

        /// <summary>
        /// 获取本地视图资源信息。
        /// </summary>
        /// <param name="so">查询对象</param>
        /// <returns>视图资源列表</returns>
        public ResponseCollection<Globalization> GetLocalResources(GlobalizationSO so)
        {
            return this.InvokePagingService(
                nameof(GetLocalResources),
                (out int records) =>
                this.Persistence.QueryForPaginatedList<Globalization>(GlobalizationNamespace, "GetLocalResources", out records, so),
                so);
        }

        /// <summary>
        /// 添加或者编辑全局资源。
        /// </summary>
        /// <param name="key">键</param>
        /// <param name="value">值</param>
        /// <param name="remark">备注信息</param>
        public Response CreateOrUpdateGlobalResource(string key, string value, string remark)
        {
            var args = new { Key = key, Value = value, Remark = remark };

            return this.InvokeService(
                nameof(CreateOrUpdateGlobalResource),
                () =>
                {
                    this.Persistence.Create(
                        GlobalizationNamespace,
                        "CreateOrUpdateGlobalResource",
                        args);

                    this.ClearCache<Globalization>();
                }, args);
        }

        /// <summary>
        /// 添加或者编辑资源信息。
        /// </summary>
        /// <param name="globalization">资源信息</param>
        public Response CreateOrUpdateResource(Globalization globalization)
        {
            return this.InvokeService(
                nameof(CreateOrUpdateResource),
                () =>
                {
                    this.Persistence.Update(GlobalizationNamespace, "CreateOrUpdateResource", globalization);

                    this.ClearCache<Globalization>();
                },
                globalization);
        }

        /// <summary>
        /// 删除资源信息。
        /// </summary>
        /// <param name="id">资源编号</param>
        public Response Remove(string id)
        {
            return this.InvokeService(
                nameof(Remove),
                () =>
                {
                    this.Persistence.Delete(GlobalizationNamespace, "Remove", id);

                    this.ClearCache<Globalization>();
                },
                id);
        }

        #endregion
    }
}
