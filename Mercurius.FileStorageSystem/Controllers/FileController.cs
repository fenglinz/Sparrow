using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Text;
using System.Web.Mvc;
using Mercurius.Kernel.Contracts.Storage.Entities;
using Mercurius.Kernel.Contracts.Storage.Services;
using Mercurius.Kernel.Implementations.Storage.WebApi;
using Mercurius.Prime.Core;
using Encoder = System.Drawing.Imaging.Encoder;
using SFile = Mercurius.Kernel.Contracts.Storage.Entities.File;

namespace Mercurius.FileStorageSystem.Controllers
{
    /// <summary>
    /// 文件处理控制器。
    /// </summary>
    [AllowAnonymous]
    public class FileController : Controller
    {
        #region 静态字段

        /// <summary>
        /// 图片MIME类型。
        /// </summary>
        private static readonly IList<string> ImageMimes = new List<string> { "image/jpeg", "image/png", "image/gif", "image/bmp", "image/x-icon" };

        #endregion

        #region 属性

        /// <summary>
        /// 文件管理服务对象。
        /// </summary>
        public IFileService FileService { get; set; }

        /// <summary>
        /// 文件上传Web Api客户端对象。
        /// </summary>
        public FileStorageClient FileStorageClient { get; set; }

        #endregion

        /// <summary>
        /// 显示文件上传界面。
        /// </summary>
        /// <param name="id">文件编号</param>
        /// <returns>文件上传界面</returns>
        public ActionResult Upload(Guid? id = null)
        {
            if (id.HasValue)
            {
                var rsp = this.FileService.GetById(id.Value);

                if (rsp.IsSuccess && rsp.Data != null && this.Request.HttpMethod.ToUpper() == "POST")
                {
                    var file = this.Request.Files[0];

                    if (file != null && file.ContentLength != 0)
                    {
                        file.SaveAs(Server.MapPath(rsp.Data.SavedPath));

                        this.FileService.CreateOrUpdate(new SFile
                        {
                            Id = rsp.Data.Id,
                            Name = rsp.Data.Name,
                            ContentType = file.ContentType,
                            Size = file.ContentLength,
                            MD5 = file.InputStream.GetBase64String().MD5(),
                            SavedPath = rsp.Data.SavedPath
                        });

                        return RedirectToAction("Index", "Home");
                    }
                }

                this.ViewBag.ErrorMessage = rsp.ErrorMessage;

                return View(rsp.Data);
            }

            return View();
        }

        /// <summary>
        /// 文件下载。
        /// </summary>
        /// <param name="id">文件在数据库中的路径</param>
        /// <param name="mode">获取图片的压缩模式</param>
        /// <returns>文件</returns>
        [OutputCache(Duration = 7200, VaryByParam = "id;mode;rnd")]
        public ActionResult Index(string id, CompressMode mode = CompressMode.Small)
        {
            var bytes = id.ToCharArray();
            var base64Bytes = Convert.FromBase64CharArray(bytes, 0, bytes.Length);
            var rsp = this.FileService.GetFileByPath(Encoding.UTF8.GetString(base64Bytes));

            if (rsp.Data != null)
            {
                var filePath = Server.MapPath(rsp.Data.SavedPath);

                if (!System.IO.File.Exists(filePath))
                {
                    return View("Error", model: "文件不存在！");
                }

                if (mode != CompressMode.Original && ImageMimes.Contains(rsp.Data.ContentType))
                {
                    // 源图像的信息
                    var img = Image.FromFile(filePath);

                    // 返回调整后的图像Width与Height
                    var newSize = NewSize(mode, img.Width, img.Height);

                    if (newSize.Width >= img.Width || newSize.Height >= img.Height)
                    {
                        img.Dispose();

                        return File(filePath, rsp.Data.ContentType, rsp.Data.Name);
                    }

                    var compressionPath = this.GetCompressionImage(mode, filePath);

                    if (System.IO.File.Exists(compressionPath))
                    {
                        return File(compressionPath, rsp.Data.ContentType, rsp.Data.Name);
                    }

                    // 源图像的格式
                    var thisformat = img.RawFormat;
                    var outBmp = new Bitmap(newSize.Width, newSize.Height);

                    using (var g = Graphics.FromImage(outBmp))
                    {
                        // 设置画布的描绘质量
                        g.CompositingQuality = CompositingQuality.HighQuality;
                        g.SmoothingMode = SmoothingMode.HighQuality;
                        g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        g.DrawImage(img, new Rectangle(0, 0, newSize.Width, newSize.Height), 0, 0, img.Width, img.Height, GraphicsUnit.Pixel);
                        g.Dispose();
                    }

                    // 以下代码为保存图片时，设置压缩质量
                    var encoderParams = new EncoderParameters();
                    var quality = new long[1];
                    quality[0] = 100;

                    var encoderParam = new EncoderParameter(Encoder.Quality, quality);
                    encoderParams.Param[0] = encoderParam;

                    // 获取包含有关内置图像编码解码器的信息的ImageCodecInfo对象。
                    var arrayICI = ImageCodecInfo.GetImageEncoders();
                    ImageCodecInfo jpegICI = null;

                    for (var x = 0; x < arrayICI.Length; x++)
                    {
                        if (arrayICI[x].FormatDescription.Equals("JPEG"))
                        {
                            // 设置jpeg编码
                            jpegICI = arrayICI[x];

                            break;
                        }
                    }

                    if (jpegICI == null)
                    {
                        outBmp.Save(compressionPath, thisformat);
                    }
                    else
                    {
                        outBmp.Save(compressionPath, jpegICI, encoderParams);
                    }

                    outBmp.Dispose();
                    img.Dispose();

                    return File(compressionPath, rsp.Data.ContentType, rsp.Data.Name);
                }

                return File(filePath, rsp.Data.ContentType, rsp.Data.Name);
            }

            return View("Error", model: rsp.IsSuccess ? "文件不存在！" : rsp.ErrorMessage);
        }

        #region 私有方法

        private static Size NewSize(CompressMode mode, int width, int height)
        {
            var maxWidth = width;
            var maxHeight = height;

            switch (mode)
            {
                case CompressMode.Small:
                    maxWidth = 400;
                    maxHeight = 300;

                    break;

                case CompressMode.Medium:
                    maxWidth = 800;
                    maxHeight = 600;

                    break;

                case CompressMode.Large:
                    maxWidth = 1024;
                    maxHeight = 768;

                    break;
            }

            var w = 0.0;
            var h = 0.0;
            var sw = Convert.ToDouble(width);
            var sh = Convert.ToDouble(height);
            var mw = Convert.ToDouble(maxWidth);
            var mh = Convert.ToDouble(maxHeight);

            // 如果maxWidth和maxHeight大于源图像，则缩略图的长和高不变
            if (sw < mw && sh < mh)
            {
                w = sw;
                h = sh;
            }
            else if ((sw / sh) > (mw / mh))
            {
                w = maxWidth;
                h = (w * sh) / sw;
            }
            else
            {
                h = maxHeight;
                w = (h * sw) / sh;
            }

            return new Size(Convert.ToInt32(w), Convert.ToInt32(h));
        }

        private string GetCompressionImage(CompressMode mode, string file)
        {
            var directory = $@"{Path.GetDirectoryName(file)}\Compression";

            if (!Directory.Exists(directory))
            {
                Directory.CreateDirectory(directory);
            }

            return $@"{directory}\{mode}_{Path.GetFileName(file)}";
        }

        #endregion
    }
}