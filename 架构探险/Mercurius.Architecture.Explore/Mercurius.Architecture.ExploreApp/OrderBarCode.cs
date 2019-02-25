using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Prime.Core.Entity;

namespace Mercurius.Architecture.ExploreApp
{
    [Table("orderbarcode")]
    public class OrderBarCode
    {
        #region 属性

        /// <summary>
        /// 系统唯一标识
        /// </summary>
        [Column("Guid")]
        public string Guid { get; set; }

        /// <summary>
        /// 业务单据编号
        /// </summary>
        public string BusinessOrderGuid { get; set; }

        /// <summary>
        /// 商品名称
        /// </summary>
        public string GoodsName { get; set; }

        /// <summary>
        /// 行号
        /// </summary>
        public int RowNo { get; set; }

        /// <summary>
        /// 条码
        /// </summary>
        public string BarCode { get; set; }

        /// <summary>
        /// 状态(N未扫描；S入库扫描；R出库扫描)
        /// </summary>
        public string State { get; set; }

        /// <summary>
        /// 承运商Guid
        /// </summary>
        public string DeliverGuid { get; set; }

        /// <summary>
        /// 入库扫码人
        /// </summary>
        public string StorageScanUser { get; set; }

        /// <summary>
        /// 入库扫码时间
        /// </summary>
        public DateTime? StorageScanTime { get; set; }

        /// <summary>
        /// 出库扫码人
        /// </summary>
        public string RetrievalScanUser { get; set; }

        /// <summary>
        /// 出库扫码时间
        /// </summary>
        public DateTime? RetrievalScanTime { get; set; }

        /// <summary>
        /// 打印次数
        /// </summary>
        public int? PrintCount { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime? CreateDateTime { get; set; }

        /// <summary>
        /// 更新时间
        /// </summary>
        public DateTime? UpdateDateTime { get; set; }

        #endregion
    }
}
