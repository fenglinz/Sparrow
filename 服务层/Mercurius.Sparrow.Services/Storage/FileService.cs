using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Entities.Storage;
using Mercurius.Sparrow.Entities.Storage.SO;
using Mercurius.Sparrow.Contracts.Storage;
using Mercurius.Sparrow.Repositories;
using Mercurius.Sparrow.Services.Support;

namespace Mercurius.Sparrow.Services.Storage
{
    /// <summary>
    /// 上传文件业务逻辑接口实现。 
    /// </summary>
    [Module("文件存储")]
    public class FileService : ServiceSupport, IFileService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Sparrow.Repositories.Storage.File";

        #endregion

        #region IFileStorageService接口实现 

        /// <summary>
        /// 添加或者编辑上传文件
        /// </summary>
        /// <param name="fileStorage">上传文件信息</param>
        /// <returns>返回添加或保存结果</returns>
        public Response CreateOrUpdate(File fileStorage)
        {
            return this.InvokeService(
                nameof(CreateOrUpdate),
                () =>
                {
                    this.Persistence.Update(NS, "CreateOrUpdate", fileStorage);

                    this.ClearCache<File>();
                }, fileStorage);
        }

        /// <summary>
        /// 检查文件是否已经存在。
        /// </summary>
        /// <param name="md5">文件md5值</param>
        /// <returns>文件保存路径</returns>
        public Response<string> CheckFileExists(string md5)
        {
            return this.InvokeService(nameof(CheckFileExists),
                () => this.Persistence.QueryForObject<string>(NS, "CheckFileExists", md5), md5, false);
        }

        /// <summary>
        /// 上传文件。
        /// </summary>
        /// <param name="businessFile">业务文件存储对象</param>
        /// <returns>上传结果</returns>
        public ResponseSet<string> UploadFiles(BusinessFile businessFile)
        {
            return this.InvokeService(nameof(UploadFiles), () =>
            {
                var rs = this.Persistence.QueryForList<string>(NS, "UploadFiles", businessFile);

                this.ClearCache<File>();

                return rs;
            }, businessFile, false);
        }

        /// <summary>
        /// 根据主键删除上传文件信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回删除结果</returns>
        public Response Remove(Guid id)
        {
            return this.InvokeService(nameof(Remove), () =>
            {
                this.Persistence.Delete(NS, "Remove", id);

                this.ClearCache<File>();
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
                this.Persistence.Delete(NS, "RemovesByFilePaths", args);

                this.ClearCache<File>();
            }, args);
        }

        /// <summary>
        /// 根据主键获取上传文件信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回上传文件查询结果</returns>
        public Response<File> GetFileById(Guid id)
        {
            return this.InvokeService(
                nameof(GetFileById),
                () => this.Persistence.QueryForObject<File>(NS, "GetById", id),
                id);
        }

        /// <summary>
        /// 根据保存位置获取文件信息。
        /// </summary>
        /// <param name="path">文件路径</param>
        /// <returns>根据文件保存路径获取文件信息</returns>
        public Response<File> GetFileByPath(string path)
        {
            return this.InvokeService(nameof(GetFileByPath), () => this.Persistence.QueryForObject<File>(NS, "GetFileByPath", path), path);
        }

        /// <summary>
        /// 获取无效的文件列表。
        /// </summary>
        /// <returns>文件列表</returns>
        public ResponseSet<string> GetInvalidFiles()
        {
            return this.InvokeService(nameof(GetInvalidFiles),
                () =>
                {
                    var datas = this.Persistence.QueryForList<string>(NS, "GetInvalidFiles");

                    this.ClearCache<File>();

                    return datas;
                }, cacheable: false);
        }

        /// <summary>
        /// 获取未管理的文件列表。
        /// </summary>
        /// <param name="files">本地文集列表(',以逗号分隔')</param>
        /// <returns>文件列表</returns>
        public ResponseSet<string> GetUnmanagedFiles(string files)
        {
            return this.InvokeService(nameof(GetUnmanagedFiles),
                () => this.Persistence.QueryForList<string>(NS, "GetUnmanagedFiles", files), files, false);
        }

        /// <summary>
        /// 查询并分页获取上传文件信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回上传文件的分页查询结果</returns>
        public ResponseSet<File> SearchFiles(FileSO so)
        {
            so = so ?? new FileSO();

            return this.InvokePagingService(
                nameof(SearchFiles),
                (out int totalRecords) => this.Persistence.QueryForPaginatedList<File>(NS, "SearchFiles", out totalRecords, so),
                so);
        }

        /// <summary>
        /// 获取业务流水下的文件信息。
        /// </summary>
        /// <param name="category">业务分类</param>
        /// <param name="serialNumber">业务流水号</param>
        /// <param name="includeFromRichEditor">包含富文本编辑器上传文件</param>
        /// <returns>上传文件信息</returns>
        public ResponseSet<File> GetBusinessFiles(string category, string serialNumber, bool includeFromRichEditor = false)
        {
            var args = new { Category = category, SerialNumber = serialNumber, IncludeFromRichEditor = includeFromRichEditor };

            return this.InvokeService(nameof(GetBusinessFiles),
                () => this.Persistence.QueryForList<File>(NS, "GetBusinessFiles", args), args);
        }

        #endregion
    }
}
