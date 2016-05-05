using Mercurius.Sparrow.Entities.Core;

namespace Mercurius.Sparrow.Contracts.Core
{
    /// <summary>
    /// 字典服务接口。
    /// </summary>
    public interface IDictionaryService
    {
        /// <summary>
        /// 获取字典信息。
        /// </summary>
        /// <param name="id">字典Id</param>
        /// <returns>字典信息</returns>
        Response<Dictionary> GetDictionary(string id);

        /// <summary>
        /// 获取字典信息。
        /// </summary>
        /// <returns>字典信息集合</returns>
        ResponseSet<Dictionary> GetDictionaries();

        /// <summary>
        /// 获取所有字典的类别。
        /// </summary>
        /// <returns>字典类别</returns>
        ResponseSet<Dictionary> GetCategories();

        /// <summary>
        /// 获取字典类别。
        /// </summary>
        /// <param name="parentKey">父类别Key</param>
        /// <returns>字典分类信息</returns>
        ResponseSet<Dictionary> GetCategories(string parentKey);

        /// <summary>
        /// 获取字典信息。
        /// </summary>
        /// <param name="category">字典分类Key值</param>
        /// <returns>字典分类信息集合</returns>
        ResponseSet<Dictionary> GetCategoryItems(string category);

        /// <summary>
        /// 添加或者更新字典信息。
        /// </summary>
        /// <param name="dictionary">字典信息</param>
        /// <returns>操作结果</returns>
        Response CreateOrUpdate(Dictionary dictionary);

        /// <summary>
        /// 添加或者更新字典分类信息。
        /// </summary>
        /// <param name="dictionary">字典分类信息</param>
        /// <returns>操作结果</returns>
        Response CreateOrUpdateCategory(Dictionary dictionary);

        /// <summary>
        /// 更改字典状态。
        /// </summary>
        /// <param name="id">字典编号</param>
        /// <param name="status">状态值</param>
        /// <returns>操作结果</returns>
        Response ChangeStatus(string id, int status);

        /// <summary>
        /// 删除字典信息。
        /// </summary>
        /// <param name="id">字典Id</param>
        Response Remove(string id);
    }
}
