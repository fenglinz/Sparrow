using System;
using Mercurius.Kernel.Contracts.Core.Entities;
using Mercurius.Kernel.Contracts.Core.Services;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Services;
using Mercurius.Prime.Data.Support;

namespace Mercurius.Kernel.Implementations.Core.Services
{
    /// <summary>
    /// 字典服务接口实现
    /// </summary>
    [Module("基础模块")]
    public class DictionaryService : ServiceSupport, IDictionaryService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Kernel.Repositories.Core.Dictionary";

        #endregion

        #region IDictionaryService接口实现

        /// <summary>
        /// 获取字典信息。
        /// </summary>
        /// <param name="id">字典Id</param>
        /// <returns>字典信息</returns>
        public Response<Dictionary> GetDictionary(string id)
        {
            return this.QueryForObject<Dictionary>(NS, "GetDictionary", id);
        }

        /// <summary>
        /// 获取字典信息。
        /// </summary>
        /// <returns>字典信息集合</returns>
        public ResponseSet<Dictionary> GetDictionaries()
        {
            return this.QueryForList<Dictionary>(NS, "GetDictionaries");
        }

        /// <summary>
        /// 获取所有字典的类别。
        /// </summary>
        /// <returns>字典类别</returns>
        public ResponseSet<Dictionary> GetCategories()
        {
            return this.QueryForList<Dictionary>(NS, "GetCategories");
        }

        /// <summary>
        /// 获取字典类别。
        /// </summary>
        /// <param name="parentKey">父类别Key</param>
        /// <returns>字典分类信息</returns>
        public ResponseSet<Dictionary> GetCategories(string parentKey)
        {
            return this.QueryForList<Dictionary>(NS, "GetCategoriesByParentKey", parentKey);
        }

        /// <summary>
        /// 获取字典信息。
        /// </summary>
        /// <param name="category">字典分类Key值</param>
        /// <returns>字典分类信息集合</returns>
        public ResponseSet<Dictionary> GetCategoryItems(string category)
        {
            return this.QueryForList<Dictionary>(NS, "GetCategoryItems", category);
        }

        /// <summary>
        /// 添加或更新字典信息。
        /// </summary>
        /// <param name="dictionary">字典信息</param>
        /// <returns>操作结果</returns>
        public Response CreateOrUpdate(Dictionary dictionary)
        {
            var args = new { Id = dictionary.Id, ParentId = dictionary.ParentId, Key = dictionary.Key };

            return this.Create(NS, "CreateOrUpdate", dictionary,
                rs => this.Persistence.QueryForObject<int>(NS, "CheckDictionaryExists", args) == 0,
                rs => rs.ErrorMessage = $"已存在键为{dictionary.Key}的字典信息！");
        }

        /// <summary>
        /// 添加或者更新字典分类信息。
        /// </summary>
        /// <param name="dictionary">字典分类信息</param>
        /// <returns>操作结果</returns>
        public Response CreateOrUpdateCategory(Dictionary dictionary)
        {
            return this.Create(NS, "CreateOrUpdate", dictionary,
                    rs => this.Persistence.QueryForObject<int>(NS, "CheckCategoryExists", new { Id = dictionary.Id, Category = dictionary.Key }) == 0,
                    rs => rs.ErrorMessage = $"已存在名为{dictionary.Key}的字典分类！");
        }

        /// <summary>
        /// 更改字典状态。
        /// </summary>
        /// <param name="id">字典编号</param>
        /// <param name="status">状态值</param>
        /// <returns>操作结果</returns>
        public Response ChangeStatus(string id, int status)
        {
            return this.Update<Dictionary>(NS, "ChangeStatus", new { Id = id, Status = status });
        }

        /// <summary>
        /// 删除字典信息。
        /// </summary>
        /// <param name="id">字典Id</param>
        public Response Remove(string id)
        {
            return this.Delete<Dictionary>(NS, "Remove", id);
        }

        #endregion
    }
}
