using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Core.Implements.Services;
using Mercurius.Core.Interfaces.Entities;
using Mercurius.Core.Interfaces.SearchObjects;
using Mercurius.Core.Interfaces.Services;
using Mercurius.Prime.Core;
using Mercurius.Prime.Web.Filters;
using Mercurius.Prime.Web.Helpers;

namespace Mercurius.Backstage.Controllers
{
    /// <summary>
    /// 帮助控制器。
    /// </summary>
    public class HelperController : BaseController
    {
        #region 常量

        private static readonly string FileUploadError = "error|上传失败";

        #endregion

        #region 属性

        /// <summary>
        /// 用户服务接口。
        /// </summary>
        public IUserService UserService { get; set; }

        /// <summary>
        /// 文件上传Web Api客户端。
        /// </summary>
        public FileStorageClient FileStorageClient { get; set; }

        /// <summary>
        /// 组织机构服务接口。
        /// </summary>
        public IOrganizationService OrganizationService { get; set; }

        #endregion

        /// <summary>
        /// wangEdit文件上传。
        /// </summary>
        /// <returns>上传结果</returns>
        [IgnorePermissionValid]
        public ActionResult Upload()
        {
            if (this.Request.Files.Count == 0)
            {
                return Content(FileUploadError);
            }

            var rsp = this.FileStorageClient.Upload(WebHelper.GetLogOnAccount(), this.Request);

            return Content(string.IsNullOrWhiteSpace(rsp.Datas?.FirstOrDefault()) ? FileUploadError + rsp.ErrorMessage : Url.GetFileUrl(rsp.Datas.FirstOrDefault(), CompressMode.Medium));
        }

        /// <summary>
        /// 显示图标选择界面。
        /// </summary>
        /// <returns>图标显示界面</returns>
        [IgnorePermissionValid]
        public ActionResult ChooseImage()
        {
            return this.View();
        }

        #region 用户选择

        /// <summary>
        /// 选择用户界面。
        /// </summary>
        /// <param name="so">用户查询</param>
        /// <returns>显示界面</returns>
        [IgnorePermissionValid]
        public ActionResult ChooseUser(UserSO so)
        {
            so = so ?? new UserSO();
            so.PageSize = 10;

            this.ViewBag.SO = so;
            this.ViewBag.Type = this.Request.Params["type"];
            this.ViewBag.Organizations = this.OrganizationService.GetOrganizations();
            this.ViewBag.Users = this.UserService.SearchUsers(so);

            return View();
        }

        /// <summary>
        /// 获取用户信息。
        /// </summary>
        /// <param name="so">用户查询</param>
        /// <returns>显示界面</returns>
        [IgnorePermissionValid]
        public ActionResult GetUsers(UserSO so)
        {
            so.PageSize = 10;
            var rspUsers = this.UserService.SearchUsers(so);

            this.ViewBag.SO = so;
            this.ViewBag.Type = this.Request.Params["type"];

            return PartialView("_ChooseUsers", rspUsers);
        }

        #endregion
    }
}