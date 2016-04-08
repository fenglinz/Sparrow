using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Sparrow.Contracts.Core;
using Mercurius.Sparrow.Entities.Core.SO;

namespace Mercurius.Sparrow.Backstage.Controllers
{
    /// <summary>
    /// 操作记录控制器。
    /// </summary>
    public class OperationRecordController : BaseController
    {
        #region 属性

        /// <summary>
        /// 操作记录服务对象。
        /// </summary>
        public IOperationRecordService OperationRecordService { get; set; }

        #endregion

        /// <summary>
        /// 操作记录首页。
        /// </summary>
        /// <returns></returns>
        public ActionResult Index(OperationRecordSO so)
        {
            var rsp = this.OperationRecordService.SearchOperationRecords(so);

            return View(rsp);
        }
    }
}