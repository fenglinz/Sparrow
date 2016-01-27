using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mercurius.Infrastructure.Dynamic
{
    /// <summary>
    /// 数据库查询条件。
    /// </summary>
    public class Condition
    {
        #region 属性

        /// <summary>
        /// 获取或者设置查询属性名称。
        /// </summary>
        public string PropertyName { get; set; }

        /// <summary>
        /// 获取或者设置查询比较方式。
        /// </summary>
        public Op Op { get; set; }

        /// <summary>
        /// 获取或者设置查询值。
        /// </summary>
        public object Value { get; set; }

        /// <summary>
        /// 获取或者设置条件结合方式。
        /// </summary>
        public string JoinType { get; set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        public Condition()
        {
            this.Op = Op.Eq;
            this.JoinType = "AND";
        }

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="column">属性</param>
        /// <param name="op">操作</param>
        /// <param name="value">值</param>
        internal Condition(string column, Op op, object value)
        {
            this.Op = op;
            this.Value = value;
            this.JoinType = "AND";
            this.PropertyName = column;
        }
        
        #endregion
    }
}
