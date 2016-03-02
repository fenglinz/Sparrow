using System;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Contracts.Core;
using Mercurius.Sparrow.Entities;
using Mercurius.Sparrow.Entities.Core;
using Mercurius.Sparrow.Services.Support;
using static Mercurius.Sparrow.Repositories.StatementNamespaces.Core;

namespace Mercurius.Sparrow.Services.Core
{
    /// <summary>
    /// 字典服务接口实现
    /// </summary>
    [Module("基础模块")]
    public class DictionaryService : ServiceSupport, IDictionaryService
    {
        #region IDictionaryService接口实现

        /// <summary>
        /// 获取字典信息。
        /// </summary>
        /// <param name="id">字典Id</param>
        /// <returns>字典信息</returns>
        public Response<Dictionary> GetDictionary(string id)
        {
            return this.InvokeService(
                nameof(GetDictionary),
                () => this.Persistence.QueryForObject<Dictionary>(DictionaryNamespace, "GetDictionary", id),
                args: id);
        }

        /// <summary>
        /// 获取字典信息。
        /// </summary>
        /// <returns>字典信息集合</returns>
        public ResponseCollection<Dictionary> GetDictionaries()
        {
            return this.InvokeService(
                nameof(GetDictionaries),
                () => this.Persistence.QueryForList<Dictionary>(DictionaryNamespace, "GetDictionaries"));
        }

        /// <summary>
        /// 获取所有字典的类别。
        /// </summary>
        /// <returns>字典类别</returns>
        public ResponseCollection<Dictionary> GetCategories()
        {
            return this.InvokeService(
                nameof(GetCategories),
                () => this.Persistence.QueryForList<Dictionary>(DictionaryNamespace, "GetCategories"));
        }

        /// <summary>
        /// 获取字典类别。
        /// </summary>
        /// <param name="parentKey">父类别Key</param>
        /// <returns>字典分类信息</returns>
        public ResponseCollection<Dictionary> GetCategories(string parentKey)
        {
            return this.InvokeService(
                nameof(GetCategories),
                () => this.Persistence.QueryForList<Dictionary>(DictionaryNamespace, "GetCategoriesByParentKey", parentKey)
                , args: parentKey);
        }

        /// <summary>
        /// 获取字典信息。
        /// </summary>
        /// <param name="category">字典分类Key值</param>
        /// <returns>字典分类信息集合</returns>
        public ResponseCollection<Dictionary> GetCategoryItems(string category)
        {
            return this.InvokeService(
                nameof(GetCategoryItems),
                () => this.Persistence.QueryForList<Dictionary>(DictionaryNamespace, "GetCategoryItems", category),
                args: category);
        }

        /// <summary>
        /// 添加或更新字典信息。
        /// </summary>
        /// <param name="dictionary">字典信息</param>
        /// <returns>操作结果</returns>
        public Response CreateOrUpdate(Dictionary dictionary)
        {
            return this.InvokeService(
                nameof(CreateOrUpdate),
                () =>
                {
                    var checkResult = this.Persistence.QueryForObject<int>(
						DictionaryNamespace,
                        "CheckDictionaryExists",
                        new { Id = dictionary.Id, ParentId = dictionary.ParentId, Key = dictionary.Key });

                    if (checkResult == 0)
                    {
                        this.Persistence.Create(DictionaryNamespace, "CreateOrUpdate", dictionary);

                        this.ClearCache<Dictionary>();
                    }
                    else
                    {
                        throw new Exception($"已存在键为{dictionary.Key}的字典信息！");
                    }
                },
                dictionary);
        }

        /// <summary>
        /// 添加或者更新字典分类信息。
        /// </summary>
        /// <param name="dictionary">字典分类信息</param>
        /// <returns>操作结果</returns>
        public Response CreateOrUpdateCategory(Dictionary dictionary)
        {
            return this.InvokeService(
                nameof(CreateOrUpdateCategory),
                () =>
                {
                    var checkResult = this.Persistence.QueryForObject<int>(DictionaryNamespace, "CheckCategoryExists", new { Id = dictionary.Id, Category = dictionary.Key });

                    if (checkResult == 0)
                    {
                        this.Persistence.Create(DictionaryNamespace, "CreateOrUpdate", dictionary);

                        this.ClearCache<Dictionary>();
                    }
                    else
                    {
                        throw new Exception($"已存在名为{dictionary.Key}的字典分类！");
                    }
                });
        }

        /// <summary>
        /// 更改字典状态。
        /// </summary>
        /// <param name="id">字典编号</param>
        /// <param name="status">状态值</param>
        /// <returns>操作结果</returns>
        public Response ChangeStatus(string id, int status)
        {
            return this.InvokeService(
                nameof(ChangeStatus),
                () =>
                {
                    this.Persistence.Update(DictionaryNamespace, "ChangeStatus", new { Id = id, Status = status });
                    this.ClearCache<Dictionary>();
                });
        }

        /// <summary>
        /// 删除字典信息。
        /// </summary>
        /// <param name="id">字典Id</param>
        public Response Remove(string id)
        {
            return this.InvokeService(
                nameof(Remove),
                () =>
                {
                    this.Persistence.Delete(DictionaryNamespace, "Remove", id);

                    this.ClearCache<Dictionary>();
                },
                id);
        }

        #endregion
    }
}
