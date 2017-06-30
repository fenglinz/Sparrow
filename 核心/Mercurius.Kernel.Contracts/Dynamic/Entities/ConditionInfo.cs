using Mercurius.Prime.Core.Dynamic;
using Mercurius.Prime.Core.Entities;

namespace Mercurius.Kernel.Contracts.Dynamic.Entities
{
    /// <summary>
    /// 查询条件信息。
    /// </summary>
    [Table("Dynamic.Condition")]
    public class ConditionInfo
    {
        #region 属性

        /// <summary>
        /// 编号。
        /// </summary>
        [Column(IsPrimaryKey = true, IsIdentity = true)]
        public int Id { get; set; }

        /// <summary>
        /// 表名称。
        /// </summary>
        public string TableName { get; set; }

        /// <summary>
        /// 查询列名称。
        /// </summary>
        public string Column { get; set; }

        /// <summary>
        /// 查询操作。
        /// </summary>
        public int Op { get; set; }

        /// <summary>
        /// 字典键。
        /// </summary>
        public string DictionaryKey { get; set; }

        /// <summary>
        /// 验证规则。
        /// </summary>
        public string ValidateRule { get; set; }

        #endregion

        #region 业务属性

        /// <summary>
        /// 值。
        /// </summary>
        [Column(IsIgnore = true)]
        public string Value { get; set; }

        #endregion

        #region 转换重载

        /// <summary>
        /// 将查询条件实体信息隐式转换为查询条件信息。
        /// </summary>
        /// <param name="info">查询条件实体信息</param>
        public static explicit operator Restriction(ConditionInfo info)
        {
            if (info == null)
            {
                return null;
            }

            return new Restriction
            {
                PropertyName = info.Column,
                Op = (Op)info.Op,
                Value = info.Value,
                JoinType = "AND"
            };
        }

        #endregion
    }
}
