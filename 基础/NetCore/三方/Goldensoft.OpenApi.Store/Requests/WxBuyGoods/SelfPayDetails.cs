using System;
using System.Collections.Generic;
using System.Text;

namespace Goldensoft.OpenApi.Store.Requests.WxBuyGoods
{
    /// <summary>
    /// 支付明细
    /// </summary>
    public class SelfPayDetails
    {
        #region Properties

        public string MethodCode { get; set; }

        public decimal? PayAmount { get; set; }

        public decimal? Numbercount { get; set; }

        public string InterfaceUuid { get; set; }

        public string ThirdReponseCode { get; set; }

        #endregion
    }
}
