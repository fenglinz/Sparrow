using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Goldensoft.WX.Repository.SearchObjects;
using Goldensoft.WX.Service.Services;
using Goldensoft.WX.Service.Services.Responses;
using Mercurius.Prime.Data.Dapper;
using Mercurius.Prime.Data.Service;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Goldensoft.WX.WebApp.Apis.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ValuesController : ControllerBase
    {
        public Persistence Persistence { get; set; }

        public SysParameterService SysParameterService { get; set; }

        // GET api/values
        [HttpGet, Authorize]
        [Route("search/{pageIndex}")]
        public ActionResult<ResponseSet<SysParameterResponse>> Search(int pageIndex = 1)
        {
            var per = this.User;

            var datas = this.SysParameterService.SearchSysParameters(new SysParameterSO { PageIndex = pageIndex });

            return datas;
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
