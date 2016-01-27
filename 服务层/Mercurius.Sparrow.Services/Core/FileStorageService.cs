﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Mercurius.Siskin.Contracts;
using Mercurius.Siskin.Entities.Core;
using Mercurius.Siskin.Entities.Core.SO;
using Mercurius.Siskin.Contracts.Core;
using Mercurius.Siskin.Repositories;
using Mercurius.Siskin.Services.Support;

namespace Mercurius.Siskin.Services.Core
{
    /// <summary>
    /// 上传文件业务逻辑接口实现。 
    /// </summary>
    public class FileStorageService : ServiceSupport, IFileStorageService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Siskin.Repositories.Core.FileStorage";

        #endregion

        #region IFileStorageService接口实现 

        /// <summary>
        /// 添加上传文件。
        /// </summary>
        /// <param name="fileStorage">上传文件</param>
        /// <returns>返回结果</returns>
        public Response Create(FileStorage fileStorage)
        {
            return this.InvokeService(
                "Create",
                () =>
                {
                    this.Persistence.Create(NS, "Create", fileStorage);

                    this.ClearCache<FileStorage>();
                },
                fileStorage);
        }

        /// <summary>
        /// 编辑上传文件。
        /// </summary>
        /// <param name="fileStorage">上传文件</param>
        /// <returns>返回结果</returns>
        public Response Update(FileStorage fileStorage)
        {
            return this.InvokeService(
                "Update",
                () =>
                {
                    this.Persistence.Update(NS, "Update", fileStorage);

                    this.ClearCache<FileStorage>();
                },
                fileStorage);
        }

        /// <summary>
        /// 添加或者编辑上传文件
        /// </summary>
        /// <param name="fileStorage">上传文件</param>
        /// <returns>返回添加或保存结果</returns>
        public Response CreateOrUpdate(FileStorage fileStorage)
        {
            return this.InvokeService(
                "CreateOrUpdate",
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
            return this.InvokeService("Remove", () =>
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

            return this.InvokeService("Remove", () =>
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
                "GetFileStorageById",
                () => this.Persistence.QueryForObject<FileStorage>(NS, "GetById", id),
                args: id);
        }


        /// <summary>
        /// 根据保存位置获取文件信息。
        /// </summary>
        /// <param name="path">文件路径</param>
        /// <returns>根据文件保存路径获取文件信息</returns>
        public Response<FileStorage> GetFileStorageByPath(string path)
        {
            return this.InvokeService("GetFileStorageByPath", () => this.Persistence.QueryForObject<FileStorage>(NS, "GetFileStorageByPath", path), args: path);
        }

        /// <summary>
        /// 查询并分页获取上传文件信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回上传文件的分页查询结果</returns>
        public ResponseCollection<FileStorage> SearchFileStorages(FileStorageSO so)
        {
            so = so ?? new FileStorageSO();

            return this.InvokePagingService(
                "SearchFileStorages",
                (out int totalRecords) => this.Persistence.QueryForPaginatedList<FileStorage>(NS, "SearchFileStorages", out totalRecords, so),
                args: so);
        }

        #endregion

        #region 重写基类方法

        protected override string GetModelName()
        {
            return "基础模块";
        }

        #endregion

    }
}
