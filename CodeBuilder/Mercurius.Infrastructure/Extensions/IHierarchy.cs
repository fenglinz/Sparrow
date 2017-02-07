﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Infrastructure
{
    /// <summary>
    /// 拥有父子关系的数据接口。
    /// </summary>
    public interface IHierarchy<T>
    {
        #region 属性

        /// <summary>
        /// 编号。
        /// </summary>
        T Id { get; set; }

        /// <summary>
        /// 父编号。
        /// </summary>
        T ParentId { get; set; }

        /// <summary>
        /// 排序号。
        /// </summary>
        int? Sort { get; set; }

        #endregion
    }
}