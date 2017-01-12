using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Prime.Core.Entities
{
    /// <summary>
    /// 表字段特性。
    /// </summary>
    [AttributeUsage(AttributeTargets.Property,
        AllowMultiple = false, Inherited = true)]
    public class ColumnAttribute : Attribute
    {
        #region 属性

        /// <summary>
        /// 是否忽略属性的映射。
        /// </summary>
        public bool IsIgnore { get; set; }

        /// <summary>
        /// 字段名称。
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 字段描述信息。
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// 该字段是否允许为空。
        /// </summary>
        public bool IsNullable { get; set; }

        /// <summary>
        /// 是否为主键。
        /// </summary>
        public bool IsPrimaryKey { get; set; }

        /// <summary>
        /// 是否为标识列。
        /// </summary>
        public bool IsIdentity { get; set; }

        /// <summary>
        /// 是否为只读字段。
        /// </summary>
        public bool IsReadOnly { get; set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        public ColumnAttribute()
        {
        }

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="name">字段名称</param>
        /// <param name="isReadOnly">是否为只读</param>
        public ColumnAttribute(string name, bool isReadOnly = false)
        {
            this.Name = name;
            this.IsReadOnly = isReadOnly;
        }

        #endregion
    }
}
