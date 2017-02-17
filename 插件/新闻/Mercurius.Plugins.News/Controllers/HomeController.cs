using System.Web.Mvc;
using Mercurius.News.Contracts.SearchObjects;
using Mercurius.News.Contracts.Services;

namespace Mercurius.Plugins.NewsCenter.Controllers
{
    public class HomeController : Controller
    {
        public ITidingsService TidingsService { get; set; }

        public ActionResult Index()
        {
            var news = this.TidingsService.SearchTidinies(new TidingsSO());

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