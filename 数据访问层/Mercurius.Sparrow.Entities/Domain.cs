﻿using System;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;
using Mercurius.Infrastructure;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Sparrow.Entities
{
    /// <summary>
    /// 领域信息基类。
    /// </summary>
    public abstract class Domain
    {
        #region 属性

        /// <summary>
        /// 获取或者设置行号。
        /// </summary>
        [Column(IsIgnore = true)]
        public virtual int RowIndex { get; set; }

        #endregion
    }
}
