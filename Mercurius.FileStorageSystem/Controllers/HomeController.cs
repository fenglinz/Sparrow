using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Contracts.Storage;
using Mercurius.Sparrow.Entities.Storage;
using Mercurius.Sparrow.Entities.Storage.SO;

namespace Mercurius.FileStorageSystem.Controllers
{
    /// <summary>
    /// 首页控制器。
    /// </summary>
    public class HomeController : Controller
    {
        #region 静态方法

        /// <summary>
        /// 上传文件保存目录。
        /// </summary>
        private static readonly string UploadFileSavedDirectory = ConfigurationManager.AppSettings["UploadFileSavedDirectory"];

        #endregion

        #region 属性

        /// <summary>
        /// 文件管理服务对象。
        /// </summary>
        public IFileService FileService { get; set; }

        #endregion

        #region 首页&搜索

        /// <summary>
        /// 显示首页。
        /// </summary>
        /// <param name="so">搜索条件</param>
        /// <returns>显示结果</returns>
        public ActionResult Index(FileSO so)
        {
            this.ViewBag.SO = so;

            var model = this.FileService.SearchFiles(so);

            return View(model);
        }

        /// <summary>
        /// 搜索文件。
        /// </summary>
        /// <param name="so">搜索条件</param>
        /// <returns>显示搜索结果</returns>
        [HttpPost]
        public ActionResult SearchFileStorages(FileSO so)
        {
            this.ViewBag.SO = so;

            var model = this.FileService.SearchFiles(so);

            return PartialView("_FileStorages", model);
        }

        #endregion

        #region 垃圾文件清理

        /// <summary>
        /// 清理文件垃圾。
        /// </summary>
        /// <returns>显示文件垃圾界面</returns>
        public ActionResult ClearRubbish()
        {
            return View();
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 获取文件保存目录。
        /// </summary>
        /// <returns>文件保存目录</returns>
        private string GetSavedDirectory()
        {
            var saveAsDirectory = $"{UploadFileSavedDirectory}/{DateTime.Now.ToString("yyyyMM")}";
            var realDirectory = this.Request.MapPath(saveAsDirectory);

            if (!Directory.Exists(realDirectory))
            {
                Directory.CreateDirectory(realDirectory);
            }

            return saveAsDirectory;
        }

        /// <summary>
        /// 删除压缩文件。
        /// </summary>
        /// <param name="file">文件名</param>
        private void RemoveCompressionImage(string file)
        {
            var directory = $@"{Path.GetDirectoryName(file)}\Compression";

            var format = $@"{directory}\{"{0}"}_{Path.GetFileName(file)}";

            if (System.IO.File.Exists(string.Format(format, CompressMode.Small)))
            {
                System.IO.File.Delete(string.Format(format, CompressMode.Small));
            }

            if (System.IO.File.Exists(string.Format(format, CompressMode.Medium)))
            {
                System.IO.File.Delete(string.Format(format, CompressMode.Medium));
            }

            if (System.IO.File.Exists(string.Format(format, CompressMode.Large)))
            {
                System.IO.File.Delete(string.Format(format, CompressMode.Large));
            }
        }

        #endregion
    }
}