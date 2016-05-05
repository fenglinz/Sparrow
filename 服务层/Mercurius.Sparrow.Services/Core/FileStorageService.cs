using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Entities.Core;
using Mercurius.Sparrow.Entities.Core.SO;
using Mercurius.Sparrow.Contracts.Core;
using Mercurius.Sparrow.Repositories;
using Mercurius.Sparrow.Services.Support;

namespace Mercurius.Sparrow.Services.Core
{
    /// <summary>
    /// 上传文件业务逻辑接口实现。 
    /// </summary>
    [Module("基础模块")]
    public class FileStorageService : ServiceSupport, IFileStorageService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Sparrow.Repositories.Core.FileStorage";

        #endregion

        #region IFileStorageService接口实现 

        /// <summary>
        /// 添加或者编辑上传文件
        /// </summary>
        /// <param name="fileStorage">上传文件</param>
        /// <returns>返回添加或保存结果</returns>
        public Response CreateOrUpdate(FileStorage fileStorage)
        {
            return this.InvokeService(
                nameof(CreateOrUpdate),
                () =>
                {
                    this.Persistence.Update(NS, "CreateOrUpdate", fileStorage);

                    this.ClearCache<FileStorage>();
                },
                fileStorage);
        }

        /// <summary>
        /// 根据主键删除上传文件信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回删除结果</returns>
        public Response Remove(int id)
        {
            return this.InvokeService(nameof(Remove), () =>
            {
                this.Persistence.Delete(NS, "Remove", id);

                this.ClearCache<FileStorage>();
            }, id);
        }

        /// <summary>
        /// 批量删除上传文件信息。
        /// </summary>
        /// <param name="filePaths">文件列表</param>
        /// <returns>返回删除结果</returns>
        public Response Remove(params string[] filePaths)
        {
            var args = new { FilePaths = filePaths.ToList() };

            return this.InvokeService(nameof(Remove), () =>
            {
                this.Persistence.Delete(NS, "RemovesByAccount", args);

                this.ClearCache<FileStorage>();
            }, args);
        }

        /// <summary>
        /// 根据主键获取上传文件信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回上传文件查询结果</returns>
        public Response<FileStorage> GetFileStorageById(int id)
        {
            return this.InvokeService(
                nameof(GetFileStorageById),
                () => this.Persistence.QueryForObject<FileStorage>(NS, "GetById", id),
                id);
        }

        /// <summary>
        /// 根据保存位置获取文件信息。
        /// </summary>
        /// <param name="path">文件路径</param>
        /// <returns>根据文件保存路径获取文件信息</returns>
        public Response<FileStorage> GetFileStorageByPath(string path)
        {
            return this.InvokeService(nameof(GetFileStorageByPath), () => this.Persistence.QueryForObject<FileStorage>(NS, "GetFileStorageByPath", path), path);
        }

        /// <summary>
        /// 查询并分页获取上传文件信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回上传文件的分页查询结果</returns>
        public ResponseSet<FileStorage> SearchFileStorages(FileStorageSO so)
        {
            so = so ?? new FileStorageSO();

            return this.InvokePagingService(
                nameof(SearchFileStorages),
                (out int totalRecords) => this.Persistence.QueryForPaginatedList<FileStorage>(NS, "SearchFileStorages", out totalRecords, so),
                so);
        }

        #endregion
    }
}
