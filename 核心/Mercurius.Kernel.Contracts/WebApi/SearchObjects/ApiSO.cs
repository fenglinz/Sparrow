using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Mercurius.Prime.Core.Services;

namespace Mercurius.Kernel.Contracts.WebApi.SearchObjects
{
    /// <summary>
    /// Web API信息查询条件。
    /// </summary>
    public class ApiSO : SearchObject
    {
        #region 属性

        /// <summary>
        /// Http路由。
        /// </summary>
        public virtual string Route { get; set; }

        /// <summary>
        /// Http谓词。
        /// </summary>
        public virtual string HttpVerb { get; set; }

        #endregion
    }
}
