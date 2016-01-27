using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Siskin.Entities.Dynamic
{
    /// <summary>
    /// 添加/修改配置实体信息。
    /// </summary>
    [Table("Dynamic.CreateOrUpdate")]
    public class CreateOrUpdateInfo
    {
        #region 属性

        /// <summary>
        /// 获取或者设置编号。
        /// </summary>
        [Column(IsPrimaryKey = true, IsIdentity = true)]
        public int Id { get; set; }

        /// <summary>
        /// 获取或者设置表名称。
        /// </summary>
        public string TableName { get; set; }

        /// <summary>
        /// 获取或者设置显示列名。
        /// </summary>
        public string Column { get; set; }

        /// <summary>
        /// 获取或者设置列标签。
        /// </summary>
        public string ColumnLabel { get; set; }

        /// <summary>
        /// 获取或者设置默认值。
        /// </summary>
        public string DefaultValue { get; set; }

        /// <summary>
        /// 获取或者设置该列是否显示。
        /// </summary>
        public bool? Visible { get; set; }

        /// <summary>
        /// 获取或者设置字典Key。
        /// </summary>
        public string DictionaryKey { get; set; }

        /// <summary>
        /// 获取或者设置验证规则。
        /// </summary>
        public string ValidateRule { get; set; }

        /// <summary>
        /// 获取或者设置排序号。
        /// </summary>
        public int? Sort { get; set; }

        #endregion
    }
}
