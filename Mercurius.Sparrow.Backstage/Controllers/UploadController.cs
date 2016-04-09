using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Entities.Core;
using Mercurius.Sparrow.Mvc.Extensions;
using Mercurius.Sparrow.Services.Support;

namespace Mercurius.Sparrow.Backstage.Controllers
{
    /// <summary>
    /// 文件上传控制器。
    /// </summary>
    public class UploadController : BaseController
    {
        #region 常量

        private static readonly string FileUploadError = "error|上传失败";

        #endregion

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ContentResult Index()
        {
            if (this.Request.Files.Count == 0)
            {
                return Content(FileUploadError);
            }

            var client = new FileStorageClient();
            var rsp = client.Upload(WebHelper.GetLogOnAccount(), this.Request.Files[0]);

            return Content(string.IsNullOrWhiteSpace(rsp.Data) ? FileUploadError + rsp.ErrorMessage : Url.GetFileUrl(rsp.Data, CompressMode.Medium));
        }
    }
}