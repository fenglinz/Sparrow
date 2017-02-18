namespace Mercurius.Prime.Core.Entities
{
    /// <summary>
    /// 领域信息基类。
    /// </summary>
    public abstract class EntityBase
    {
        #region 属性

        /// <summary>
        /// 行号。
        /// </summary>
        [Column(IsIgnore = true)]
        public virtual int RowIndex { get; set; }

        #endregion
    }
}
