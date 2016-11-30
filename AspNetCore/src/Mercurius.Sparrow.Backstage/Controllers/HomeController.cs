using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Mercurius.Sparrow.Backstage.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace Mercurius.Sparrow.Backstage.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            var user = new User
            {
                Name = "张枫林",
                Sex = "男",
                Birthdate = new DateTime(1983, 4, 26)
            };

            return View(user);
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Error()
        {
            return View();
        }
    }
}
