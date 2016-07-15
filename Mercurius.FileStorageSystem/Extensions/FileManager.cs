using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.IO;
using Autofac;
using Mercurius.Sparrow.Entities.Core;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts.Core;
using Mercurius.Sparrow.Autofac;

namespace Mercurius.FileStorageSystem.Extensions
{
    /// <summary>
    /// 文件管理类。
    /// </summary>
    public static class FileManager
    {
        #region 字段

        /// <summary>
        /// 上传文件业务对象。
        /// </summary>
        private static readonly IFileStorageService _fileStorageService;

        /// <summary>
        /// 上传文件的保存路径。
        /// </summary>
        public static readonly string UploadFileSavedPath;

        /// <summary>
        /// 上传文件在服务器上的保存路径。
        /// </summary>
        public static readonly string UploadFileSavedDirectory;

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        static FileManager()
        {
            UploadFileSavedPath = ConfigurationManager.AppSettings["UploadFileSavedDirectory"];
            UploadFileSavedDirectory = HttpContext.Current.Server.MapPath(UploadFileSavedPath);

            using (var context = AutofacConfig.Container.BeginLifetimeScope())
            {
                _fileStorageService = context.Resolve<IFileStorageService>();
            }
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 删除文件资源。
        /// </summary>
        /// <param name="filePaths">文件路径</param>
        public static void Remove(IEnumerable<string> filePaths)
        {
            if (filePaths.IsEmpty())
            {
                return;
            }

            var rsp = _fileStorageService.Remove(filePaths.ToArray());

            if (rsp.IsSuccess)
            {
                foreach (var file in filePaths)
                {
                    var fileInfo = new FileInfo(HttpContext.Current.Server.MapPath(file));

                    if (fileInfo.Exists)
                    {
                        fileInfo.Delete();
                        RemoveCompressionImage(fileInfo.FullName);
                    }
                }
            }
        }

        /// <summary>
        /// 获取文件本地路径转换为基于站点的路径。
        /// </summary>
        /// <param name="localFileName">本地文件名</param>
        /// <returns>相对路径</returns>
        public static string ConvertToWebSitePath(this string localFileName)
        {
            return UploadFileSavedPath + localFileName.Replace(UploadFileSavedDirectory, "").Replace("\\", "/");
        }

        #endregion

        #region 私有方法

        private static void RemoveCompressionImage(string file)
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