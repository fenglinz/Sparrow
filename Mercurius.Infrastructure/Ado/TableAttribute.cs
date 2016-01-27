﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Infrastructure.Ado
{
    /// <summary>
    /// 数据库表特性。
    /// </summary>
    [AttributeUsage(AttributeTargets.Class,
        AllowMultiple = false, Inherited = true)]
    public class TableAttribute : Attribute
    {
        #region 属性

        /// <summary>
        /// 获取或者设置表名称。
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 是否为视图。
        /// </summary>
        public bool IsView { get; set; } = false;

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="name">表名称</param>
        public TableAttribute(string name)
        {
            this.Name = name;
        }

        #endregion
    }
}
