﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using Mercurius.FileStorageSystem.Extensions;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Contracts.Storage;
using Mercurius.Sparrow.Entities.Storage;
using static Mercurius.FileStorageSystem.Apis.WebApiUtil;
using static Mercurius.FileStorageSystem.Extensions.FileManager;

namespace Mercurius.FileStorageSystem.Apis.Core.Controllers
{
    /// <summary>
    /// 文件管理控制器。
    /// </summary>
    [Authorize]
    public class FileController : ApiController
    {
        #region 属性

        /// <summary>
        /// 获取或者设置文件管理服务。
        /// </summary>
        public IFileService FileService { get; set; }

        #endregion

        #region 文件上传

        /// <summary>
        /// 基于base64字符串上传文件。
        /// </summary>
        /// <param name="account">上传者</param>
        /// <param name="fileUpload">文件上传信息</param>
        /// <returns>文件上传后的访问路径</returns>
        [HttpPost]
        [Route("api/File/Upload/{account}")]
        public async Task<ResponseSet<string>> Upload(string account, FileUpload fileUpload)
        {
            if (fileUpload == null || fileUpload.Items == null)
            {
                return new ResponseSet<string> { ErrorMessage = "无上传文件信息！" };
            }

            var user = GetUser(account);

            if (user == null)
            {
                return new ResponseSet<string> { ErrorMessage = UserNotExists };
            }

            var savedFiles = this.FileService.GetBusinessFiles(fileUpload.BusinessCategory, fileUpload.BusinessSerialNumber);

            if (!savedFiles.IsSuccess)
            {
                return new ResponseSet<string> { ErrorMessage = savedFiles.ErrorMessage };
            }

            var removeFiles = from f in savedFiles.Datas
                              where
                                fileUpload.Items.IsEmpty() || fileUpload.Items.All(i => i.FileSavedPath != f.SavedPath)
                              select f.SavedPath;

            if (!removeFiles.IsEmpty())
            {
                FileManager.Remove(removeFiles);
            }

            var businessFile = (BusinessFile)fileUpload;

            businessFile.UploadUserId = user.Id;

            for (var i = 0; i < fileUpload.Items.Count; i++)
            {
                var item = fileUpload.Items[i];
                var file = businessFile.Files[i];

                if (!string.IsNullOrWhiteSpace(item.FileData))
                {
                    var existsFilePath = this.FileService.CheckFileExists(file.MD5).Data;

                    if (!string.IsNullOrWhiteSpace(existsFilePath))
                    {
                        file.SavedPath = existsFilePath;

                        continue;
                    }

                    var buffers = Convert.FromBase64String(item.FileData);
                    var fileInfo = string.IsNullOrWhiteSpace(item.FileSavedPath) ?
                        new FileInfo(this.GetSaveAsFileName(item.FileName)) :
                        new FileInfo(UploadFileSavedDirectory + item.FileSavedPath.Substring(UploadFileSavedPath.Length).Replace('/', '\\'));

                    using (var stream = fileInfo.OpenWrite())
                    {
                        await stream.WriteAsync(buffers, 0, buffers.Length);
                    }

                    file.Size = buffers.Length;
                    file.SavedPath = fileInfo.FullName.ConvertToWebSitePath();
                }
                else
                {
                    file.ContentType = null;
                }
            }

            var rsp = this.FileService.UploadFiles(businessFile);

            if (!rsp.IsSuccess)
            {
                FileManager.Remove(businessFile.Files.Select(f => f.SavedPath));
            }

            return rsp;
        }

        #endregion

        #region 文件删除

        /// <summary>
        /// 删除文件。
        /// </summary>
        /// <param name="account">账号</param>
        /// <param name="category">业务分类</param>
        /// <param name="serialNumber">业务流水号</param>
        /// <returns></returns>
        [HttpPost]
        [Route("api/File/Remove/{account}/{category}/{serialNumber}")]
        public Response Remove(string account, string category, string serialNumber)
        {
            var user = GetUser(account);

            if (user == null)
            {
                return new Response { ErrorMessage = UserNotExists };
            }

            var savedFiles = this.FileService.GetBusinessFiles(category, serialNumber, true);

            if (savedFiles.IsSuccess)
            {
                FileManager.Remove(savedFiles.Datas.Select(f => f.SavedPath));

                return new Response();
            }

            return new Response { ErrorMessage = savedFiles.ErrorMessage }; ;
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 获取文件保存目录。
        /// </summary>
        /// <returns>文件保存目录</returns>
        private string GetSavedDirectory()
        {
            var monthDirectory = DateTime.Now.ToString("yyyyMM");
            var result = Path.Combine(UploadFileSavedDirectory, monthDirectory);

            if (!Directory.Exists(result))
            {
                Directory.CreateDirectory(result);
            }

            return result;
        }

        private string GetSaveAsFileName(string uploadFileName)
        {
            return $@"{this.GetSavedDirectory()}\{Guid.NewGuid()}{Path.GetExtension(uploadFileName)}";
        }

        #endregion
    }
}