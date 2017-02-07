using System;
using System.Collections.Generic;

namespace Mercurius.Infrastructure.Ado
{
    /// <summary>
    /// 数据库表或视图元数据信息。
    /// </summary>
    [Serializable]
    public class Table
    {
        #region 属性

        /// <summary>
        /// 表名称。
        /// </summary>
        public virtual string Name { get; set; }

        /// <summary>
        /// 所属架构。
        /// </summary>
        public virtual string Schema { get; set; }

        /// <summary>
		/// 是否为视图。
		/// </summary>
		public virtual bool IsView { get; set; }

        /// <summary>
        /// 包含自动增长列。
        /// </summary>
        public virtual bool? HasIdentityColumn { get; set; }

        /// <summary>
        /// 表说明信息。
        /// </summary>
        public virtual string Comments { get; set; }

        #endregion

        #region 业务属性

        /// <summary>
        /// 表包含的列定义。
        /// </summary>
        public IList<Column> Columns { get; set; }

        #endregion

        #region 公开方法

        /// <summary>
        /// 获取完整表名称。
        /// </summary>
        /// <returns>完整表名称</returns>
        public string GetFullTable()
        {
            return string.IsNullOrWhiteSpace(this.Schema) ? this.Name : $"{this.Schema}.{this.Name}";
        }

        #endregion
    }
}
