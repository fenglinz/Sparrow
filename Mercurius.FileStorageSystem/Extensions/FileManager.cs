using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using Autofac;
using Mercurius.Kernel.Contracts.Storage.Entities;
using Mercurius.Kernel.Contracts.Storage.Services;
using Mercurius.Prime.Core;
using Mercurius.Sparrow.Autofac;
using IOFile = System.IO.File;

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
        private static readonly IFileService _fileStorageService;

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
                _fileStorageService = context.Resolve<IFileService>();
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

            if (IOFile.Exists(string.Format(format, CompressMode.Small)))
            {
                IOFile.Delete(string.Format(format, CompressMode.Small));
            }

            if (IOFile.Exists(string.Format(format, CompressMode.Medium)))
            {
                IOFile.Delete(string.Format(format, CompressMode.Medium));
            }

            if (IOFile.Exists(string.Format(format, CompressMode.Large)))
            {
                IOFile.Delete(string.Format(format, CompressMode.Large));
            }
        }

        #endregion
    }
}