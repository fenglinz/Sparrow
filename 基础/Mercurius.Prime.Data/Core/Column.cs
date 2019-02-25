using Newtonsoft.Json;

namespace Mercurius.Prime.Data
{
    /// <summary>
    /// 数据库字段元数据信息。
    /// </summary>
    public class Column
    {
        #region 属性

        /// <summary>
        /// 字段名称。
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 属性名称。
        /// </summary>
        public string PropertyName { get; set; }

		/// <summary>
		/// 字段类型。
		/// </summary>
		public string DataType { get; set; }

        /// <summary>
        /// 字段长度。
        /// </summary>
        public long? DataLength { get; set; }

        /// <summary>
        /// 字段描述信息。
        /// </summary>
        [JsonIgnore]
        public string Description { get; set; }

        /// <summary>
        /// 排序号。
        /// </summary>
        public int Sort { get; set; }

        /// <summary>
        /// 该字段是否允许为空。
        /// </summary>
        [JsonIgnore]
        public bool IsNullable { get; set; } = true;

        /// <summary>
        /// 是否为主键。
        /// </summary>
        [JsonIgnore]
        public bool IsPrimaryKey { get; set; }

        /// <summary>
        /// 是否为标识列。
        /// </summary>
        [JsonIgnore]
        public bool IsIdentity { get; set; }

        /// <summary>
        /// 是否为只读字段。
        /// </summary>
        [JsonIgnore]
        public bool IsReadOnly { get; set; }

        #endregion
    }
}
