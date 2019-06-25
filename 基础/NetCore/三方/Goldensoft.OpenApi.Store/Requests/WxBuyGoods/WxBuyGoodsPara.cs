using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace Goldensoft.OpenApi.Store.Requests.WxBuyGoods
{
    /// <summary>
    /// 购买商品信息
    /// </summary>
    public class WxBuyGoodsPara
    {
        #region Properties

        public string OrderId { get; set; }

        public string MemberGuid { get; set; }

        [JsonProperty("lstPayMethod")]
        public IList<SelfPayDetails> SelfPayDetails { get; set; }

        [JsonProperty("lstTicketId")]
        public IList<string> TicketIds { get; set; }

        [JsonProperty("lstorderdetails")]
        public IList<OrderDetail> OrderDetails { get; set; }

        [JsonProperty("lstmainid")]
        public IList<string> MainIds { get; set; }

        [JsonProperty("SnPreRoom_AddPara")]
        public object SnPreRoomAddPara { get; set; }

        [JsonProperty("Api_Order")]
        public Order Order { get; set; }

        [JsonProperty("checkoutmemberpara")]
        public object CheckOutMemberPara { get; set; }

        public bool IsOnlyCheck { get; set; }

        [JsonProperty("lstIntegal")]
        public object IntegalPara { get; set; }

        public string OperatorId { get; set; }

        public string OperatorName { get; set; }

        public string PassWord { get; set; }

        public string DepartmentName { get; set; }

        public string MachineId { get; set; }

        public string ReturnValue { get; set; }

        public string Batai { get; set; }

        [JsonProperty("ErrorMsg")]
        public string ErrorMessage { get; set; }

        public string EmployCardId { get; set; }

        #endregion
    }
}