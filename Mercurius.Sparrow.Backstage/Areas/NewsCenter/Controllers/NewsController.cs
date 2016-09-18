using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts.NewsCenter;
using Mercurius.Sparrow.Entities.NewsCenter;
using Mercurius.Sparrow.Entities.NewsCenter.SO;
using Mercurius.Sparrow.Services.Storage;

namespace Mercurius.Sparrow.Backstage.Areas.NewsCenter.Controllers
{
    /// <summary>
    /// 新闻管理控制。
    /// </summary>
    public class NewsController : BaseController
    {
        #region 属性

        /// <summary>
        /// 新闻业务逻辑对象。
        /// </summary>
        public INewsService NewsService { get; set; }

        /// <summary>
        /// 文件上传Web Api客户端。
        /// </summary>
        public FileStorageClient FileStorageClient { get; set; }

        #endregion

        /// <summary>
        /// 显示新闻列表。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>显示界面</returns>
        public ActionResult Index(NewsSO so)
        {
            this.ViewBag.SO = so;
            var model = this.NewsService.SearchNews(so);

            return View(model);
        }

        /// <summary>
        /// 显示添加或编辑新闻信息界面。
        /// </summary>
        /// <param name="id">新闻编号</param>
        /// <returns>显示界面</returns>
        public ActionResult CreateOrUpdate(Guid? id = null)
        {
            this.ViewBag.BusinessSerialNumber = id.HasValue ? id : Guid.NewGuid();

            if (id.HasValue)
            {
                var model = this.NewsService.GetNewsById(id.Value);

                return View(model.Data);
            }

            return View();
        }

        /// <summary>
        /// 保存新闻信息。
        /// </summary>
        /// <param name="news">新闻信息</param>
        /// <returns>跳转到首页</returns>
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult CreateOrUpdate(News news)
        {
            var rspFile = this.FileStorageClient.Upload(WebHelper.GetLogOnAccount(), this.Request);

            if (rspFile.IsSuccess)
            {
                news.PublisherId = WebHelper.GetLogOnUserId();

                var rsp = this.NewsService.CreateOrUpdate(news);
            }

            return RedirectToAction("Index");
        }

        /// <summary>
        /// 删除新闻信息。
        /// </summary>
        /// <param name="id">新闻编号</param>
        /// <returns>删除结果</returns>
        [HttpPost]
        public ActionResult Remove(Guid id)
        {
            var rsp = this.FileStorageClient.Remove(WebHelper.GetLogOnAccount(), "新闻管理", id.ToString());

            if (rsp.IsSuccess)
            {
                rsp = this.NewsService.Remove(id);
            }

            return Json(rsp);
        }

        /// <summary>
        /// 显示预览。
        /// </summary>
        /// <param name="id">新闻编号</param>
        /// <returns>预览界面</returns>
        [AllowAnonymous]
        public ActionResult ShowPreview(Guid id)
        {
            var rsp = this.NewsService.GetNewsById(id);

            return View(rsp);
        }
    }
}