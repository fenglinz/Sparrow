// <copyright file="CorporationSO.cs" company="武汉链享医药供应链管理有限公司">
// 版权所有 © 武汉链享医药供应链管理有限公司, 保留所有权利.
// </copyright>
// <author>fenglinz</author>
// <create>2019-04-08</create>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Mercurius.Prime.Core.Entity;

namespace CSBR.SPD.Order.Repository.SearchObjects
{
    /// <summary>
    /// 公司组织资料查询条件。
    /// </summary>
    public class CorporationSO : SearchObject
    {
        #region 属性
        
        /// <summary>
        /// 所属租户Guid。
        /// </summary>
        public string TenantGuid { get; set; }
        
        /// <summary>
        /// 助记码。
        /// </summary>
        public string HelpCode { get; set; }
        
        /// <summary>
        /// 省份。
        /// </summary>
        public string Province { get; set; }
        
        /// <summary>
        /// 城市。
        /// </summary>
        public string City { get; set; }
        
        /// <summary>
        /// 区/县/乡。
        /// </summary>
        public string District { get; set; }
        
        /// <summary>
        /// 注册资本(万)。
        /// </summary>
        public string RegisteredCapital { get; set; }
        
        #endregion
    }
}
    