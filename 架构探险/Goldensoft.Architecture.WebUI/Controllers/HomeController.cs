using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Goldensoft.Architecture.WebUI.Models;
using Mercurius.Prime.Data.Dapper;
using Microsoft.Extensions.Logging;

namespace Goldensoft.Architecture.WebUI.Controllers
{
    public class HomeController : Controller
    {
        public Persistence Persistence { get; set; }

        public ILogger<HomeController> Logger { get; set; }

        public IActionResult Index()
        {
            this.Logger.LogDebug("测试开始...");

            var total = 0;
            var datas = this.Persistence.QueryForPagedList<MfStaff>(out total);

            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
