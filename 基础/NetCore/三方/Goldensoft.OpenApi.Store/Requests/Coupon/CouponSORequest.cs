using System;
using System.Collections.Generic;
using System.Text;
using Mercurius.Prime.Core.Entity;

namespace Goldensoft.OpenApi.Store.Requests.Coupon
{
    /// <summary>
    /// 票券查询实体
    /// </summary>
    public class CouponSORequest : SearchObject
    {
        #region Properties

        /// <summary>
        /// vpn编码。
        /// </summary>
        public string VpnCode { get; set; }

        /// <summary>
        /// 是否为票券。
        /// </summary>
        public string IsPiaoQuan { get; set; } = "是";

        #endregion
    }
}
