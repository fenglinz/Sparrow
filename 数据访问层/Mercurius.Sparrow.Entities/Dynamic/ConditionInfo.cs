using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Infrastructure.Ado;
using Mercurius.Infrastructure.Dynamic;

namespace Mercurius.Siskin.Entities.Dynamic
{
    /// <summary>
    /// 查询条件信息。
    /// </summary>
    [Table("Dynamic.Condition")]
    public class ConditionInfo
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
        /// 获取或者设置查询列名称。
        /// </summary>
        public string Column { get; set; }

        /// <summary>
        /// 获取或者设置查询操作。
        /// </summary>
        public int Op { get; set; }

        /// <summary>
        /// 获取或者设置字典键。
        /// </summary>
        public string DictionaryKey { get; set; }

        /// <summary>
        /// 获取或者设置验证规则。
        /// </summary>
        public string ValidateRule { get; set; }

        #endregion

        #region 业务属性

        /// <summary>
        /// 获取或者设置值。
        /// </summary>
        [Column(IsIgnore = true)]
        public string Value { get; set; }

        #endregion

        #region 转换重载

        /// <summary>
        /// 将查询条件实体信息隐式转换为查询条件信息。
        /// </summary>
        /// <param name="info">查询条件实体信息</param>
        public static explicit operator Condition(ConditionInfo info)
        {
            if (info == null)
            {
                return null;
            }

            return new Condition
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
