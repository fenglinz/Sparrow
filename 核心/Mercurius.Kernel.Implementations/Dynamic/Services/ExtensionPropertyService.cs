using System;
using System.Collections.Generic;
using System.Reflection;
using Mercurius.Kernel.Contracts.Dynamic.Entities;
using Mercurius.Kernel.Contracts.Dynamic.SearchObjects;
using Mercurius.Kernel.Contracts.Dynamic.Services;
using Mercurius.Prime.Core.Services;
using Mercurius.Prime.Data.Support;

namespace Mercurius.Kernel.Implementations.Dynamic.Services
{
    /// <summary>
    /// 扩展属性业务逻辑接口实现。 
    /// </summary>
    [Module("动态页面")]
    public class ExtensionPropertyService : ServiceSupport, IExtensionPropertyService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Kernel.Repositories.Dynamic.ExtensionProperty";

        #endregion

        #region IExtensionPropertyService接口实现 

        /// <summary>
        /// 添加或者编辑扩展属性。
        /// </summary>
        /// <param name="extensionProperty">扩展属性</param>
        /// <returns>返回添加或保存结果</returns>
        public Response CreateOrUpdate(ExtensionProperty extensionProperty)
        {
            return this.InvokeService(
                nameof(CreateOrUpdate),
                () =>
                {
                    this.Persistence.Update(NS, "CreateOrUpdate", extensionProperty);

                    this.ClearCache<ExtensionProperty>();
                },
                extensionProperty);
        }

        /// <summary>
        /// 添加扩展属性实例值。
        /// </summary>
        /// <param name="businessSerialNumber">业务流水编号</param>
        /// <param name="instances">扩展属性实例信息</param>
        /// <returns>返回添加结果</returns>
        public Response CreateInstances(string businessSerialNumber, IEnumerable<ExtensionPropertyInstance> instances)
        {
            var args = new { BusinessSerialNumber = businessSerialNumber, Instances = instances };

            return this.InvokeService(nameof(CreateInstances), () =>
            {
                this.Persistence.Create(NS, "CreateInstances", args);

                this.ClearCache<ExtensionProperty>();
            }, args);
        }

        /// <summary>
        /// 根据主键删除扩展属性信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回删除结果</returns>
        public Response Remove(Guid id)
        {
            return this.InvokeService(nameof(Remove), () =>
            {
                this.Persistence.Delete(NS, "Remove", id);

                this.ClearCache<ExtensionProperty>();
            }, id);
        }

        /// <summary>
        /// 根据业务实体编号删除扩展实例信息。
        /// </summary>
        /// <param name="businessSerialNumber">业务流水编号</param>
        /// <returns>返回删除的结果</returns>
        public Response RemoveInstances(string businessSerialNumber)
        {
            return this.InvokeService(nameof(RemoveInstances), () =>
            {
                this.Persistence.Delete(NS, "RemoveInstances", businessSerialNumber);

                this.ClearCache<ExtensionProperty>();
            }, businessSerialNumber);
        }

        /// <summary>
        /// 获取扩展属性分类。
        /// </summary>
        /// <returns>扩展属性分类集合</returns>
        public ResponseSet<string> GetCategories()
        {
            return this.InvokeService(nameof(GetCategories), () => this.Persistence.QueryForList<string>(NS, "GetCategories"), false);
        }

        /// <summary>
        /// 获取分类下的分组。
        /// </summary>
        /// <param name="category">分类名</param>
        /// <returns>分组集合</returns>
        public ResponseSet<string> GetGroupNames(string category)
        {
            return this.InvokeService(nameof(GetGroupNames),
                () => this.Persistence.QueryForList<string>(NS, "GetGroupNames", category), category, false);
        }

        /// <summary>
        /// 根据主键获取扩展属性信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回扩展属性查询结果</returns>
        public Response<ExtensionProperty> GetExtensionPropertyById(Guid id)
        {
            return this.InvokeService(
                nameof(GetExtensionPropertyById),
                () => this.Persistence.QueryForObject<ExtensionProperty>(NS, "GetById", id),
                id);
        }

        /// <summary>
        /// 根据分类获取所有扩展属性信息。
        /// </summary>
        /// <param name="category">分类</param>
        /// <param name="businessSerialNumber">业务流水编号</param>
        /// <returns>返回结果</returns>
        public ResponseSet<ExtensionProperty> GetExtensionProperties(string category, string businessSerialNumber = null)
        {
            var args = new { Category = category, BusinessSerialNumber = businessSerialNumber };

            return this.InvokeService(nameof(GetExtensionProperties),
                () => this.Persistence.QueryForList<ExtensionProperty>(NS, "GetExtensionPropertiesByCategory", args),
                args);
        }

        /// <summary>
        /// 查询并分页获取扩展属性信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回扩展属性的分页查询结果</returns>
        public ResponseSet<ExtensionProperty> SearchExtensionProperties(ExtensionPropertySO so)
        {
            so = so ?? new ExtensionPropertySO();

            return this.InvokePagingService(
                nameof(SearchExtensionProperties),
                (out int totalRecords) => this.Persistence.QueryForPaginatedList<ExtensionProperty>(NS, "SearchExtensionProperties", out totalRecords, so),
                so);
        }

        #endregion
    }
}
