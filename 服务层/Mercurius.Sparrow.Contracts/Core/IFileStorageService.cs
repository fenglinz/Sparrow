using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Mercurius.Sparrow.Entities.Core;
using Mercurius.Sparrow.Entities.Core.SO;

namespace Mercurius.Sparrow.Contracts.Core
{
    /// <summary>
    /// 上传文件业务逻辑接口。
    /// </summary>
    public interface IFileStorageService
    {
        /// <summary>
        /// 添加或者编辑上传文件
        /// </summary>
        /// <param name="fileStorages">上传文件列表信息</param>
        /// <returns>返回添加或保存结果</returns>
        Response CreateOrUpdate(params FileStorage[] fileStorages);

        /// <summary>
        /// 根据主键删除上传文件信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回删除结果</returns>
        Response Remove(int id);

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
        Response<FileStorage> GetFileStorageById(int id);

        /// <summary>
        /// 根据文件保存路径获取文件信息。
        /// </summary>
        /// <param name="path">文件路径</param>
        /// <returns>文件信息</returns>
        Response<FileStorage> GetFileStorageByPath(string path);

        /// <summary>
        /// 获取业务流水下的文件信息。
        /// </summary>
        /// <param name="category">业务分类</param>
        /// <param name="serialNumber">业务流水号</param>
        /// <returns>上传文件信息</returns>
        ResponseSet<FileStorage> GetBusinessFiles(string category, string serialNumber);

        /// <summary>
        /// 查询并分页获取上传文件信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回结果</returns>
        ResponseSet<FileStorage> SearchFileStorages(FileStorageSO so);
    }
}
