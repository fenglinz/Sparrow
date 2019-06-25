using System;
using System.Collections.Generic;
using System.Text;

namespace Goldensoft.OpenApi.Store.Requests.WxBuyGoods
{
    public class Order
    {
        public string OrderId { get; set; }

        public string VpnCode { get; set; }

        public string OrderNo { get; set; }

        public byte? OrderType { get; set; }

        public int? OrderIntegral { get; set; }

        public byte? OrderStatus { get; set; }

        public string OrderRemark { get; set; }

        public decimal? OldMoney { get; set; }

        public decimal? FactMoney { get; set; }

        public decimal? ExpressFee { get; set; }

        public decimal? ActAmount { get; set; }

        public DateTime? OverdueTime { get; set; }

        public byte? PayType { get; set; }

        public DateTime? PayTime { get; set; }

        public string TransactionId { get; set; }

        public string OpenId { get; set; }

        public string CustomerId { get; set; }

        public string MobilePhone { get; set; }

        public string MemberGuid { get; set; }

        public string CardTypeId { get; set; }

        public string MemberId { get; set; }

        public DateTime? CreateTime { get; set; }

        public string OperateId { get; set; }

        public DateTime? OperateTime { get; set; }

        public string BillId { get; set; }

        public string CardRemark { get; set; }

        public string BookPersonName { get; set; }

        public string GuestRemark { get; set; }

        public DateTime? CheckTime { get; set; }

        public DateTime? LeaveTime { get; set; }

        public State State { get; set; }

        public bool IsLog { get; set; }
    }
}
