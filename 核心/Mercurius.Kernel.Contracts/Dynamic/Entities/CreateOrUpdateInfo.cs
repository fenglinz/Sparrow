using Mercurius.Prime.Core.Entities;

namespace Mercurius.Kernel.Contracts.Dynamic.Entities
{
    /// <summary>
    /// 添加/修改配置实体信息。
    /// </summary>
    [Table("Dynamic.CreateOrUpdate")]
    public class CreateOrUpdateInfo
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
        /// 显示列名。
        /// </summary>
        public string Column { get; set; }

        /// <summary>
        /// 列标签。
        /// </summary>
        public string ColumnLabel { get; set; }

        /// <summary>
        /// 默认值。
        /// </summary>
        public string DefaultValue { get; set; }

        /// <summary>
        /// 该列是否显示。
        /// </summary>
        public bool? Visible { get; set; }

        /// <summary>
        /// 字典Key。
        /// </summary>
        public string DictionaryKey { get; set; }

        /// <summary>
        /// 验证规则。
        /// </summary>
        public string ValidateRule { get; set; }

        /// <summary>
        /// 排序号。
        /// </summary>
        public int? Sort { get; set; }

        #endregion

        #region 业务属性

        /// <summary>
        /// 字段类型。
        /// </summary>
        [Column(IsIgnore = true)]
        public string DataType { get; set; }

        #endregion
    }
}
