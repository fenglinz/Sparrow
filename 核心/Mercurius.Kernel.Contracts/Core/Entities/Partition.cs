namespace Mercurius.Kernel.Contracts.Core.Entities
{
    /// <summary>
    /// 分区信息实体。
    /// </summary>
    public class Partition
    {
        #region 属性

        /// <summary>
        /// 表的分区名称。
        /// </summary>
        public virtual string Name { get; set; }

        /// <summary>
        /// 分区的最大值。
        /// </summary>
        public virtual string HightValue { get; set; }

        #endregion
    }
}
