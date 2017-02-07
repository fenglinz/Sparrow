using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Mercurius.Prime.Core.Ado;
using Mercurius.Prime.Core.Dynamic;
using Mercurius.Prime.Core.Services;
using static Mercurius.WebApi.Extensions.WebApiExtrnsions;

namespace Mercurius.Sparrow.Backstage.Apis.Controllers
{
    /// <summary>
    /// 动态数据处理的Api。
    /// </summary>
    public class DynamicController : ApiController
    {
        #region 属性

        /// <summary>
        /// 动态查询对象。
        /// </summary>
        public DynamicQuery DynamicQuery { get; set; }

        #endregion

        /// <summary>
        /// 获取所有表信息。
        /// </summary>
        /// <param name="account">系统登录账号</param>
        /// <returns>表信息</returns>
        [HttpGet]
        [Route("api/Tables/{account}")]
        public ResponseSet<Table> GetTables(string account)
        {
            var user = GetUser(account);

            if (user == null)
            {
                return new ResponseSet<Table> { ErrorMessage = UserNotExists };
            }

            var tables = this.DynamicQuery.Provider.DbMetadata.GetTables();

            return new ResponseSet<Table>
            {
                Datas = tables,
                TotalRecords = tables == null ? -1 : tables.Count
            };
        }
    }
}
