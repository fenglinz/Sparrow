using System.Web.Http;
using Mercurius.Prime.Core.Ado;
using Mercurius.Prime.Core.Dynamic;
using Mercurius.Prime.Core.Services;
using Mercurius.Sparrow.Backstage.Apis.Models.Dynamic;
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

        #region 获取数据库信息

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

        /// <summary>
        /// 获取表信息。
        /// </summary>
        /// <param name="account">账号</param>
        /// <param name="tableName">表名称</param>
        /// <returns></returns>
        [HttpGet]
        [Route("api/Table/{account}/{tableName}")]
        public Response<Table> GetTable(string account, string tableName)
        {
            var user = GetUser(account);

            if (user == null)
            {
                return new Response<Table> { ErrorMessage = UserNotExists };
            }

            var table = this.DynamicQuery.Provider.DbMetadata.GetTable(tableName);

            return new Response<Table> { Data = table };
        }

        /// <summary>
        /// 获取表的列信息。
        /// </summary>
        /// <param name="account">用户账户</param>
        /// <param name="tableName">表名称</param>
        /// <returns>表的列信息</returns>
        [HttpGet]
        [Route("api/Columns/{account}/{tableName}")]
        public ResponseSet<Column> GetColumns(string account, string tableName)
        {
            var user = GetUser(account);

            if (user == null)
            {
                return new ResponseSet<Column> { ErrorMessage = UserNotExists };
            }

            var columns = this.DynamicQuery.Provider.DbMetadata.GetColumns(tableName);

            return new ResponseSet<Column>
            {
                Datas = columns,
                TotalRecords = columns == null ? -1 : columns.Count
            };
        }

        #endregion

        /// <summary>
        /// 获取表数据。
        /// </summary>
        /// <param name="account">账号</param>
        /// <param name="tableName">表名称</param>
        /// <param name="pageIndex">页序号</param>
        /// <param name="pageSize">每页显示数据大小</param>
        /// <returns>表数据</returns>
        [HttpGet]
        [Route("api/Datas/{account}/{tableName}/{pageIndex}")]
        public ResponseDataTable GetDatas(string account, string tableName, int pageIndex = 1, int pageSize = 20)
        {
            var user = GetUser(account);

            if (user == null)
            {
                return new ResponseDataTable { ErrorMessage = UserNotExists };
            }

            var totalRecords = -1;
            var data = this.DynamicQuery.PagedList(tableName, pageIndex, pageSize, out totalRecords);

            return new ResponseDataTable { Datas = data, TotalRecords = totalRecords };
        }

        /// <summary>
        /// 查找数据。
        /// </summary>
        /// <param name="account">账号</param>
        /// <param name="tableName">表名称</param>
        /// <param name="so">查询条件</param>
        /// <returns>查询结果</returns>
        [HttpPost]
        [Route("api/Search/{account}/{tableName}")]
        public ResponseDataTable SearchDatas(string account, string tableName, [FromBody] SearchCriteria so)
        {
            var user = GetUser(account);

            if (user == null)
            {
                return new ResponseDataTable { ErrorMessage = UserNotExists };
            }

            so = so ?? new SearchCriteria();

            if (so.Criteria != null)
            {
                so.Criteria.DynamicQuery = this.DynamicQuery;
            }

            var totalRecords = -1;
            var data = this.DynamicQuery.PagedList(tableName, so.PageIndex, so.PageSize, out totalRecords, so.Criteria);

            return new ResponseDataTable { Datas = data, TotalRecords = totalRecords };
        }
    }
}
