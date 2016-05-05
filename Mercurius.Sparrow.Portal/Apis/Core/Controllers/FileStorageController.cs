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
using Mercurius.Sparrow.Entities.Core;
using Mercurius.Sparrow.Portal.Apis.Extensions;

namespace Mercurius.Sparrow.Portal.Apis.Core.Controllers
{
    /// <summary>
    /// 文件管理控制器。
    /// </summary>
    [Authorize]
    public class FileStorageController : BaseController
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
        /// 上传文件。
        /// </summary>
        /// <param name="account">用户账号</param>
        /// <returns>上传结果</returns>
        [HttpPost]
        [Route("api/FileStorage/Upload/{account}")]
        public async Task<ResponseSet<string>> Upload(string account)
        {
            var user = this.GetUser(account);

            if (user == null)
            {
                return new ResponseSet<string> { ErrorMessage = UserNotExists };
            }

            var files = new List<string>();
            var result = new ResponseSet<string> { Datas = files };
            var provider = new CustomMultipartFormDataStreamProvider(GetSavedDirectory());
            var bodyParts = await this.Request.Content.ReadAsMultipartAsync(provider);

            foreach (var item in bodyParts.FileData)
            {
                var fileStorage = new FileStorage
                {
                    FileName = item.Headers.ContentDisposition.FileName.Replace("\"", ""),
                    FileSize = item.Headers.ContentDisposition.Size,
                    ContentType = item.Headers.ContentType.MediaType,
                    SaveAsPath = this.ConvertToWebSitePath(item.LocalFileName),
                    UploadUserId = user.Id
                };

                var rsp = this.FileStorageService.CreateOrUpdate(fileStorage);

                if (rsp.IsSuccess)
                {
                    files.Add(fileStorage.SaveAsPath);
                }
                else
                {
                    result.ErrorMessage = rsp.ErrorMessage;

                    File.Delete(item.LocalFileName);
                }
            }

            return result;
        }

        /// <summary>
        /// 基于base64字符串上传文件。
        /// </summary>
        /// <param name="account">上传者</param>
        /// <param name="items">上传文件信息</param>
        /// <returns>文件上传后的访问路径</returns>
        [HttpPost]
        [Route("api/FileStorage/Upload/Base64/{account}")]
        public async Task<ResponseSet<string>> Upload(string account, IList<UploadItem> items)
        {
            var user = this.GetUser(account);

            if (user == null)
            {
                return new ResponseSet<string> { ErrorMessage = UserNotExists };
            }

            if (items.IsEmpty())
            {
                return new ResponseSet<string> { ErrorMessage = "无上传文件信息！" };
            }

            var files = new List<string>();
            var result = new ResponseSet<string> { Datas = files };

            foreach (var item in items)
            {
                var buffers = Convert.FromBase64String(item.FileData);
                var fileInfo = new FileInfo(this.GetSaveAsFileName(item.FileName));

                using (var stream = fileInfo.OpenWrite())
                {
                    await stream.WriteAsync(buffers, 0, buffers.Length);
                }

                var fileStorage = new FileStorage
                {
                    FileName = item.FileName,
                    FileSize = buffers.Length,
                    ContentType = item.ContentType,
                    Description = item.Description,
                    SaveAsPath = this.ConvertToWebSitePath(fileInfo.FullName),
                    UploadUserId = user.Id
                };

                var rsp = this.FileStorageService.CreateOrUpdate(fileStorage);

                if (rsp.IsSuccess)
                {
                    files.Add(fileStorage.SaveAsPath);
                }
                else
                {
                    rsp.ErrorMessage = rsp.ErrorMessage;

                    fileInfo.Delete();
                }
            }

            return result;
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

        #endregion
    }
}