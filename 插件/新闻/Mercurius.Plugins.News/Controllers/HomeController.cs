using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.News.Interfaces.SearchObjects;
using Mercurius.News.Interfaces.Services;

namespace Mercurius.Plugins.NewsCenter.Controllers
{
    public class HomeController : Controller
    {
        public INewsService NewsService { get; set; }

        public ActionResult Index()
        {
            var news = this.NewsService.SearchNews(new NewsSO());

            return View(news);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}