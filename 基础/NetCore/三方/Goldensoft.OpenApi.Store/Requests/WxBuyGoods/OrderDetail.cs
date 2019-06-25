using System;
using System.Collections.Generic;
using System.Text;

namespace Goldensoft.OpenApi.Store.Requests.WxBuyGoods
{
    /// <summary>
    /// 订单明细信息
    /// </summary>
    public class OrderDetail
    {
        #region Properties

        public string DetailId { get; set; }

        public string OrderId { get; set; }

        public string GoodsCatalogId { get; set; }

        public string GoodsCatalogName { get; set; }

        public string GoodsCode { get; set; }

        public string GoodsName { get; set; }

        public int? GoodsNum { get; set; }

        public decimal? UnitPrice { get; set; }

        public decimal? Discount { get; set; }

        public decimal? Amount { get; set; }

        public decimal? RealMoney { get; set; }

        public int? UseNum { get; set; }

        public DateTime? UseTime { get; set; }

        public string VpnCode { get; set; }

        public string GoodsRemark { get; set; }

        public string ConsumeWaternum { get; set; }

        public DateTime? ValidStart { get; set; }

        public DateTime? ValidEnd { get; set; }

        public int? UsePerson { get; set; }

        public string TimesCardDefaultId { get; set; }

        public byte? TypeMode { get; set; }

        public string ConsumerCode { get; set; }

        public State State { get; set; }

        public bool IsLog { get; set; }

        #endregion
    }
}
