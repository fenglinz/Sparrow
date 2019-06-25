using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace Goldensoft.OpenApi.Store.Responses.Coupon
{
    /// <summary>
    /// 票券数据模型.
    /// </summary>
    public class CouponResponse
    {
        #region Properties

        /// <summary>
        /// 支付方式编号.
        /// </summary>
        public string MethodCode { get; set; }

        /// <summary>
        /// 支付方式名称.
        /// </summary>
        public string MethodName { get; set; }

        /// <summary>
        /// 备注.
        /// </summary>
        public string Remark { get; set; }

        /// <summary>
        /// 助记名.
        /// </summary>
        public string HelpName { get; set; }

        /// <summary>
        /// 是否为票券.
        /// </summary>
        public string IsPiaoQuan { get; set; }

        /// <summary>
        /// 票卷金额.
        /// </summary>
        public Decimal? DefaultMoney { get; set; }

        /// <summary>
        /// 排序.
        /// </summary>
        public Decimal? SortBy { get; set; }

        /// <summary>
        /// 所属大厅.
        /// </summary>
        public string ParlorCode { get; set; }

        /// <summary>
        /// 汇率.
        /// </summary>
        public Decimal? ChangeRate { get; set; }

        /// <summary>
        /// 是否需要付款确认.
        /// </summary>
        public string IsMakeSure { get; set; }

        /// <summary>
        /// 无用.
        /// </summary>
        public int? TransferPos { get; set; }

        /// <summary>
        /// 佣金(票券).
        /// </summary>
        public Decimal? Commision { get; set; }

        /// <summary>
        /// 付款备注.
        /// </summary>
        public string PayRemark { get; set; }

        /// <summary>
        /// 特业提成.
        /// </summary>
        public Decimal? SpecialPer { get; set; }

        /// <summary>
        /// 是否参与押金.
        /// </summary>
        public string IsPrepay { get; set; }

        /// <summary>
        /// 自助餐对应编号.
        /// </summary>
        public string TaoCanSort { get; set; }

        /// <summary>
        /// 无用.
        /// </summary>
        public Decimal? MinConsumePrice { get; set; }

        /// <summary>
        /// 快捷键.
        /// </summary>
        public string ShortCut { get; set; }

        /// <summary>
        /// 是否团购.
        /// </summary>
        public string IsTuanGou { get; set; }

        /// <summary>
        /// 团购人数.
        /// </summary>
        public Decimal? TuanGouPerson { get; set; }

        /// <summary>
        /// 是否叠加使用.
        /// </summary>
        public string IsOverLayTicket { get; set; }

        /// <summary>
        /// 满足一定金额才能使用票券.
        /// </summary>
        public Decimal? TicketContitionMoney { get; set; }

        /// <summary>
        /// 票券打印模板名称.
        /// </summary>
        public string PrintTempName { get; set; }

        /// <summary>
        /// 票券前缀.
        /// </summary>
        public string TicketPre { get; set; }

        /// <summary>
        /// 是否接口使用.
        /// </summary>
        public string IsInterface { get; set; }

        /// <summary>
        /// 关联套票.
        /// </summary>
        public string TaoPiaoId { get; set; }

        /// <summary>
        /// 分组编号.
        /// </summary>
        public int? GroupId { get; set; }

        /// <summary>
        /// vpn编码.
        /// </summary>
        public string VpnCode { get; set; }

        /// <summary>
        /// 是否已选择
        /// </summary>
        [JsonProperty("checked")]
        public bool Checked { get; set; }

        #endregion
    }
}
