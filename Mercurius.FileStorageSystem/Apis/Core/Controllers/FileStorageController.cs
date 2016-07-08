using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Contracts.Core;
using Mercurius.FileStorageSystem.Apis.Extensions;
using Mercurius.Sparrow.Entities.Core;
using static Mercurius.Sparrow.Entities.Core.FileStorage;
using static Mercurius.FileStorageSystem.Apis.WebApiUtil;

namespace Mercurius.FileStorageSystem.Apis.Core.Controllers
{
    /// <summary>
    /// 文件管理控制器。
    /// </summary>
    [Authorize]
    public class FileStorageController : ApiController
    {
        #region 字段

        private static readonly string AppSettingPath;
        private static readonly string UploadFileSavedDirectory;

        #endregion

        #region 属性

        /// <summary>
        /// 获取或者设置文件管理服务。
        /// </summary>
        public IFileStorageService FileStorageService { get; set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 静态构造方法。
        /// </summary>
        static FileStorageController()
        {
            AppSettingPath = ConfigurationManager.AppSettings["UploadFileSavedDirectory"];
            UploadFileSavedDirectory = HttpContext.Current.Server.MapPath(AppSettingPath);
        }

        #endregion

        #region 文件上传

        /// <summary>
        /// 基于base64字符串上传文件。
        /// </summary>
        /// <param name="account">上传者</param>
        /// <param name="fileUpload">文件上传信息</param>
        /// <returns>文件上传后的访问路径</returns>
        [HttpPost]
        [Route("api/FileStorage/Upload/{account}")]
        public async Task<ResponseSet<string>> Upload(string account, FileUpload fileUpload)
        {
            var user = GetUser(account);

            if (user == null)
            {
                return new ResponseSet<string> { ErrorMessage = UserNotExists };
            }

            if (fileUpload == null || fileUpload.Items.IsEmpty())
            {
                return new ResponseSet<string> { ErrorMessage = "无上传文件信息！" };
            }

            var savedFiles = this.FileStorageService.GetBusinessFiles(fileUpload.BusinessCategory, fileUpload.BusinessSerialNumber);

            if (!savedFiles.IsSuccess)
            {
                return new ResponseSet<string> { ErrorMessage = savedFiles.ErrorMessage };
            }

            var files = new List<string>();
            var result = new ResponseSet<string> { Datas = files };

            var removeFiles = from f in fileUpload.Items
                              where
                                savedFiles.Datas.All(d => d.SaveAsPath != f.SavedAsFilePath)
                              select f.SavedAsFilePath;

            if (!removeFiles.IsEmpty())
            {
                this.Remove(removeFiles);
            }

            var fileStorages = new List<FileStorage>();

            foreach (var item in fileUpload.Items)
            {
                var fileStorage = (FileStorage)item;

                fileStorage.UploadUserId = Convert.ToString(user.Id);

                if (!string.IsNullOrWhiteSpace(item.FileData))
                {
                    var buffers = Convert.FromBase64String(item.FileData);
                    var fileInfo = string.IsNullOrWhiteSpace(item.SavedAsFilePath) ?
                        new FileInfo(this.GetSaveAsFileName(item.FileName)) :
                        new FileInfo(UploadFileSavedDirectory + item.SavedAsFilePath.Substring(AppSettingPath.Length).Replace('/', '\\'));

                    using (var stream = fileInfo.OpenWrite())
                    {
                        await stream.WriteAsync(buffers, 0, buffers.Length);
                    }

                    fileStorage.FileSize = buffers.Length;
                    fileStorage.ContentType = item.ContentType;
                    fileStorage.SaveAsPath = this.ConvertToWebSitePath(fileInfo.FullName);
                }

                fileStorages.Add(fileStorage);
            }

            var rsp = this.FileStorageService.CreateOrUpdate(fileStorages.ToArray());

            if (rsp.IsSuccess)
            {
                files.AddRange(fileStorages.Select(f => f.SaveAsPath));
            }
            else
            {
                rsp.ErrorMessage = rsp.ErrorMessage;

                this.Remove(fileStorages.Select(f => f.SaveAsPath));
            }

            return result;
        }

        /// <summary>
        /// 删除文件资源。
        /// </summary>
        /// <param name="filePaths">文件路径</param>
        [HttpPost]
        [Route("api/FileStorage/Remove")]
        public Response Remove(IEnumerable<string> filePaths)
        {
            if (filePaths.IsEmpty())
            {
                return new Response { ErrorMessage = "无删除文件！" };
            }

            var rsp = this.FileStorageService.Remove(filePaths.ToArray());

            if (rsp.IsSuccess)
            {
                foreach (var file in filePaths)
                {
                    var fileInfo = new FileInfo(HttpContext.Current.Server.MapPath(file));

                    if (fileInfo.Exists)
                    {
                        fileInfo.Delete();
                        this.RemoveCompressionImage(fileInfo.FullName);
                    }
                }
            }
            else
            {
                return rsp;
            }

            return new Response();
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

        /// <summary>
        /// 获取文件本地路径转换为基于站点的路径。
        /// </summary>
        /// <param name="localFileName">本地文件名</param>
        /// <returns>相对路径</returns>
        private string ConvertToWebSitePath(string localFileName)
        {
            return AppSettingPath + localFileName.Replace(UploadFileSavedDirectory, "").Replace("\\", "/");
        }

        private void RemoveCompressionImage(string file)
        {
            var directory = $@"{Path.GetDirectoryName(file)}\Compression";

            var format = $@"{directory}\{"{0}"}_{Path.GetFileName(file)}";

            if (File.Exists(string.Format(format, CompressMode.Small)))
            {
                File.Delete(string.Format(format, CompressMode.Small));
            }

            if (File.Exists(string.Format(format, CompressMode.Medium)))
            {
                File.Delete(string.Format(format, CompressMode.Medium));
            }

            if (File.Exists(string.Format(format, CompressMode.Large)))
            {
                File.Delete(string.Format(format, CompressMode.Large));
            }
        }

        #endregion
    }
}