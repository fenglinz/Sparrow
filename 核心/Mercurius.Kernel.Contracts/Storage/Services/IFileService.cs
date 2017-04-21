using System;
using System.Collections.Generic;
using Mercurius.Kernel.Contracts.Storage.Entities;
using Mercurius.Kernel.Contracts.Storage.SearchObjects;
using Mercurius.Prime.Core.Cache;
using Mercurius.Prime.Core.Services;

namespace Mercurius.Kernel.Contracts.Storage.Services
{
    /// <summary>
    /// 上传文件业务逻辑接口。
    /// </summary>
    public interface IFileService
    {
        /// <summary>
        /// 添加或者编辑上传文件
        /// </summary>
        /// <param name="fileStorage">文件上传信息</param>
        /// <returns>返回添加或保存结果</returns>
        Response CreateOrUpdate(File fileStorage);

        /// <summary>
        /// 检查文件是否已经存在。
        /// </summary>
        /// <param name="md5">文件md5值</param>
        /// <returns>文件保存路径</returns>
        [NonCache]
        Response<string> CheckFileExists(string md5);

        /// <summary>
        /// 上传文件。
        /// </summary>
        /// <param name="category">业务分类</param>
        /// <param name="serialNumber">业务流水号</param>
        /// <param name="businessFiles">业务文件存储对象</param>
        /// <returns>上传结果</returns>
        [NonCache]
        ResponseSet<string> UploadFiles(string category, string serialNumber, IList<BusinessFile> businessFiles);

        /// <summary>
        /// 删除上传文件信息。
        /// </summary>
        /// <param name="category">业务分类</param>
        /// <param name="serialNumber">业务流水号</param>
        /// <returns>返回删除结果</returns>
        Response Remove(string category, string serialNumber);

        /// <summary>
        /// 根据文件编号获取文件信息。
        /// </summary>
        /// <param name="id">文件编号</param>
        /// <returns>文件信息</returns>
        Response<File> GetById(Guid id);

        /// <summary>
        /// 根据文件保存路径获取文件信息。
        /// </summary>
        /// <param name="path">文件路径</param>
        /// <returns>文件信息</returns>
        Response<File> GetFileByPath(string path);

        /// <summary>
        /// 获取无效的文件列表。
        /// </summary>
        /// <returns>文件列表</returns>
        [NonCache]
        ResponseSet<string> GetInvalidFiles();

        /// <summary>
        /// 获取未管理的文件列表。
        /// </summary>
        /// <param name="files">本地文集列表(',以逗号分隔')</param>
        /// <returns>文件列表</returns>
        [NonCache]
        ResponseSet<string> GetUnmanagedFiles(string files);

        /// <summary>
        /// 查询并分页获取上传文件信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回结果</returns>
        ResponseSet<File> SearchFiles(FileSO so);

        /// <summary>
        /// 获取业务流水下的文件信息。
        /// </summary>
        /// <param name="category">业务分类</param>
        /// <param name="serialNumber">业务流水号</param>
        /// <param name="includeFromRichEditor">包含富文本编辑器上传文件</param>
        /// <returns>上传文件信息</returns>
        ResponseSet<BusinessFile> GetBusinessFiles(string category, string serialNumber, bool includeFromRichEditor = false);
    }
}
