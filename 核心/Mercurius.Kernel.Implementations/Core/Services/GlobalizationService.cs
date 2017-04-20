using System;
using System.Collections.Generic;
using System.Data;
using Mercurius.Kernel.Contracts.Core.Entities;
using Mercurius.Kernel.Contracts.Core.SearchObjects;
using Mercurius.Kernel.Contracts.Core.Services;
using Mercurius.Prime.Core.Services;
using Mercurius.Prime.Data.Support;

namespace Mercurius.Kernel.Implementations.Core.Services
{
    /// <summary>
    /// 视图资源信息服务接口实现。
    /// </summary>
    [Module("基础模块")]
    public class GlobalizationService : ServiceSupport, IGlobalizationService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Kernel.Repositories.Core.Globalization";

        #endregion

        #region IGlobalizationService接口实现

        /// <summary>
        /// 添加或者编辑全局资源。
        /// </summary>
        /// <param name="key">键</param>
        /// <param name="value">值</param>
        /// <param name="remark">备注信息</param>
        public Response CreateOrUpdateGlobalResource(string key, string value, string remark)
        {
            var args = new { Key = key, Value = value, Remark = remark };

            return this.Create(NS, "CreateOrUpdateGlobalResource", args, () => this.ClearCache<Globalization>());
        }

        /// <summary>
        /// 添加或者编辑资源信息。
        /// </summary>
        /// <param name="globalization">资源信息</param>
        public Response CreateOrUpdateResource(Globalization globalization)
        {
            return this.Update(NS, "CreateOrUpdateResource", globalization, () => this.ClearCache<Globalization>());
        }

        /// <summary>
        /// 删除资源信息。
        /// </summary>
        /// <param name="id">资源编号</param>
        public Response Remove(string id)
        {
            return this.Delete(NS, "Remove", id, () => this.ClearCache<Globalization>());
        }

        /// <summary>
        /// 获取全局视图资源。
        /// </summary>
        /// <param name="key">键</param>
        /// <returns>值</returns>
        public string GetGlobalResource(string key)
        {
            var result = this.QueryForObject<string>(NS, "GetGlobalResource", key);

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
            var dict = new Dictionary<string, string>();
            var args = new { Area = area, Controller = controller, View = view };

            var table = this.QueryForDataTable(NS, "GetResources", args);

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
        }

        /// <summary>
        /// 获取资源信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>资源信息</returns>
        public Response<Globalization> GetResource(string id)
        {
            return this.QueryForObject<Globalization>(NS, "GetResource", id);
        }

        /// <summary>
        /// 获取全局视图资源信息。
        /// </summary>
        /// <param name="so">查询对象</param>
        /// <returns>视图资源列表</returns>
        public ResponseSet<Globalization> GetGlobalResources(SearchObject so)
        {
            return this.QueryForPagedList<Globalization>(NS, "GetGlobalResources", so);
        }

        /// <summary>
        /// 获取本地视图资源信息。
        /// </summary>
        /// <param name="so">查询对象</param>
        /// <returns>视图资源列表</returns>
        public ResponseSet<Globalization> GetLocalResources(GlobalizationSO so)
        {
            return this.QueryForList<Globalization>(NS, "GetLocalResources", so);
        }

        #endregion
    }
}
