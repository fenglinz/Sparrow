﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Mercurius.Sparrow.Entities.Storage;
using Mercurius.Sparrow.Entities.Storage.SO;

namespace Mercurius.Sparrow.Contracts.Storage
{
    /// <summary>
    /// 上传文件业务逻辑接口。
    /// </summary>
    public interface IFileService
    {
        /// <summary>
        /// 添加或者编辑上传文件
        /// </summary>
        /// <param name="fileUpload">文件上传信息</param>
        /// <returns>返回添加或保存结果</returns>
        Response CreateOrUpdate(File fileStorage);

        /// <summary>
        /// 检查文件是否已经存在。
        /// </summary>
        /// <param name="md5">文件md5值</param>
        /// <returns>文件保存路径</returns>
        Response<string> CheckFileExists(string md5);

        /// <summary>
        /// 上传文件。
        /// </summary>
        /// <param name="category">业务分类</param>
        /// <param name="serialNumber">业务流水号</param>
        /// <param name="businessFiles">业务文件存储对象</param>
        /// <returns>上传结果</returns>
        ResponseSet<string> UploadFiles(string category, string serialNumber, IList<BusinessFile> businessFiles);

        /// <summary>
        /// 根据主键删除上传文件信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回删除结果</returns>
        Response Remove(Guid id);

        /// <summary>
        /// 批量删除上传文件信息。
        /// </summary>
        /// <param name="filePaths">文件列表</param>
        /// <returns>返回删除结果</returns>
        Response Remove(params string[] filePaths);

        /// <summary>
        /// 根据主键获取上传文件信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回上传文件查询结果</returns>
        Response<File> GetFileById(Guid id);

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
        ResponseSet<string> GetInvalidFiles();

        /// <summary>
        /// 获取未管理的文件列表。
        /// </summary>
        /// <param name="files">本地文集列表(',以逗号分隔')</param>
        /// <returns>文件列表</returns>
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
