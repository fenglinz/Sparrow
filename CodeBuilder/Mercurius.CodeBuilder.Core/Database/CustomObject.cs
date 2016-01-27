using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.CodeBuilder.Core.Database
{
    /// <summary>
    /// 数据库自定义对象(表/视图/过程)。
    /// </summary>
    public class CustomObject
    {
        #region 属性

        /// <summary>
        /// 名称。
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 架构。
        /// </summary>
        public string Schema { get; set; }

        /// <summary>
        /// 表说明。
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// 类型。
        /// </summary>
        public CustomObjectType Type { get; set; } = CustomObjectType.Table;

        #endregion
    }

    /// <summary>
    /// 自定义对象类型枚举。
    /// </summary>
    public enum CustomObjectType
    {
        /// <summary>
        /// 表
        /// </summary>
        Table,

        /// <summary>
        /// 视图
        /// </summary>
        View,

        /// <summary>
        /// 过程
        /// </summary>
        Procedure
    }
}
