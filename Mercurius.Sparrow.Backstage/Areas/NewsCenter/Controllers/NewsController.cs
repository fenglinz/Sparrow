using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts.NewsCenter;
using Mercurius.Sparrow.Entities.NewsCenter;
using Mercurius.Sparrow.Entities.NewsCenter.SO;

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

        #endregion

        public ActionResult Index(NewsSO so)
        {
            this.ViewBag.SO = so;
            var model = this.NewsService.SearchNews(so);

            return View(model);
        }

        public ActionResult CreateOrUpdate(Guid? id = null)
        {
            if (id.HasValue)
            {
                var model = this.NewsService.GetNewsById(id.Value);

                return View(model.Data);
            }

            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult CreateOrUpdate(News news)
        {
            news.PublisherId = WebHelper.GetLogOnUserId();

            var rsp = this.NewsService.CreateOrUpdate(news);

            return RedirectToAction("Index");
        }
    }
}