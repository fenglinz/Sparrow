using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Mercurius.Sparrow.Entities.Dynamic;
using Mercurius.Sparrow.Entities.Dynamic.SO;

namespace Mercurius.Sparrow.Contracts.Dynamic
{
    /// <summary>
    /// 扩展属性业务逻辑接口。
    /// </summary>
    public interface IExtensionPropertyService
    {
        /// <summary>
        /// 添加或者编辑扩展属性
        /// </summary>
        /// <param name="extensionProperty">扩展属性</param>
        /// <returns>返回添加或保存结果</returns>
        Response CreateOrUpdate(ExtensionProperty extensionProperty);

        /// <summary>
        /// 添加扩展属性实例值。
        /// </summary>
        /// <param name="businessSerialNumber">业务流水编号</param>
        /// <param name="instances">扩展属性实例信息</param>
        /// <returns>返回添加结果</returns>
        Response CreateInstances(string businessSerialNumber, IEnumerable<ExtensionPropertyInstance> instances);

        /// <summary>
        /// 根据主键删除扩展属性信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回删除结果</returns>
        Response Remove(Guid id);

        /// <summary>
        /// 根据业务流水编号删除扩展实例信息。
        /// </summary>
        /// <param name="businessSerialNumber">业务流水编号</param>
        /// <returns>返回删除的结果</returns>
        Response RemoveInstances(string businessSerialNumber);

        /// <summary>
        /// 获取扩展属性分类。
        /// </summary>
        /// <returns>扩展属性分类集合</returns>
        ResponseSet<string> GetCategories();

        /// <summary>
        /// 获取分类下的分组。
        /// </summary>
        /// <param name="category">分类名</param>
        /// <returns>分组集合</returns>
        ResponseSet<string> GetGroupNames(string category);

        /// <summary>
        /// 根据主键获取扩展属性信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回扩展属性查询结果</returns>
        Response<ExtensionProperty> GetExtensionPropertyById(Guid id);

        /// <summary>
        /// 根据分类获取所有扩展属性信息。
        /// </summary>
        /// <param name="category">分类</param>
        /// <param name="businessSerialNumber">业务流水编号</param>
        /// <returns>返回结果</returns>
        ResponseSet<ExtensionProperty> GetExtensionProperties(string category, string businessSerialNumber = null);

        /// <summary>
        /// 查询并分页获取扩展属性信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回结果</returns>
        ResponseSet<ExtensionProperty> SearchExtensionProperties(ExtensionPropertySO so);
    }
}
