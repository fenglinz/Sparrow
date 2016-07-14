using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Contracts.Core;
using Mercurius.Sparrow.Entities.Core;
using Mercurius.Sparrow.Entities.Core.SO;

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
        public IFileStorageService FileStorageService { get; set; }

        #endregion

        #region 首页&搜索

        /// <summary>
        /// 显示首页。
        /// </summary>
        /// <param name="so">搜索条件</param>
        /// <returns>显示结果</returns>
        public ActionResult Index(FileStorageSO so)
        {
            this.ViewBag.SO = so;

            var model = this.FileStorageService.SearchFileStorages(so);

            return View(model);
        }

        /// <summary>
        /// 搜索文件。
        /// </summary>
        /// <param name="so">搜索条件</param>
        /// <returns>显示搜索结果</returns>
        [HttpPost]
        public ActionResult SearchFileStorages(FileStorageSO so)
        {
            this.ViewBag.SO = so;

            var model = this.FileStorageService.SearchFileStorages(so);

            return PartialView("_FileStorages", model);
        }

        #endregion

        #region 文件上传

        /// <summary>
        /// 显示文件上传界面。
        /// </summary>
        /// <param name="id">文件编号</param>
        /// <returns>显示文件上传界面</returns>
        public ActionResult Upload(int? id = null)
        {
            if (id.HasValue)
            {
                var rsp = this.FileStorageService.GetFileStorageById(id.Value);

                return View(rsp.Data);
            }

            return View();
        }

        /// <summary>
        /// 上传文件。
        /// </summary>
        /// <param name="id">文件编号</param>
        /// <param name="saveAsPath">保存路径</param>
        /// <param name="description">文件描述</param>
        /// <returns>上传结果</returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Upload(int? id, string saveAsPath, string description)
        {
            var file = this.Request.Files["file"];

            if (string.IsNullOrWhiteSpace(file?.FileName))
            {
                if (id.HasValue)
                {
                    var rsp = this.FileStorageService.GetFileStorageById(id.Value);

                    if (rsp.Data != null)
                    {
                        rsp.Data.Description = description;

                        this.FileStorageService.CreateOrUpdate(rsp.Data);
                        this.RemoveCompressionImage(this.Server.MapPath(rsp.Data.SaveAsPath));
                    }
                }
            }
            else
            {
                if (!string.IsNullOrWhiteSpace(saveAsPath))
                {
                    var dir = Path.GetDirectoryName(this.Server.MapPath(saveAsPath));

                    if (!Directory.Exists(dir))
                    {
                        Directory.CreateDirectory(dir);
                    }
                }

                saveAsPath = string.IsNullOrWhiteSpace(saveAsPath) ? $"{this.GetSavedDirectory()}/{Guid.NewGuid()}{Path.GetExtension(file.FileName)}" : saveAsPath;

                file.SaveAs(this.Server.MapPath(saveAsPath));

                this.FileStorageService.CreateOrUpdate(new FileStorage
                {
                    Id = id ?? -1,
                    FileName = file.FileName,
                    FileSize = file.ContentLength,
                    ContentType = file.ContentType,
                    SaveAsPath = saveAsPath,
                    Description = description,
                    UploadUserId = WebHelper.GetLogOnUserId()
                });
            }

            return RedirectToAction("Index", "Home");
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

        #region 删除文件

        /// <summary>
        /// 删除文件。
        /// </summary>
        /// <param name="id">文件编号</param>
        /// <returns>删除结果</returns>
        [HttpPost]
        public ActionResult Remove(int id)
        {
            var rsp = this.FileStorageService.GetFileStorageById(id);

            if (rsp.Data != null)
            {
                var filePath = this.Server.MapPath(rsp.Data.SaveAsPath);

                if (System.IO.File.Exists(filePath))
                {
                    System.IO.File.Delete(filePath);
                    this.RemoveCompressionImage(filePath);
                }

                var temp = this.FileStorageService.Remove(id);

                return Json(temp);
            }
            else if (!rsp.IsSuccess)
            {
                return Json(rsp);
            }

            return Json(new Response { ErrorMessage = "文件不存在！" });
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