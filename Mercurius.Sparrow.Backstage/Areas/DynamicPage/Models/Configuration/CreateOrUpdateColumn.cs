﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Mercurius.Sparrow.Entities.Dynamic;

namespace Mercurius.Sparrow.Backstage.Areas.DynamicPage.Models.Configuration
{
    /// <summary>
    /// 添加/编辑列配置信息。
    /// </summary>
    [Serializable]
    public class CreateOrUpdateColumn : CreateOrUpdateInfo
    {
        #region 属性

        /// <summary>
        /// 获取或者设置列名称。
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 获取或者设置列属性名称。
        /// </summary>
        public string PropertyName { get; set; }

        /// <summary>
        /// 获取或者设置列描述信息。
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// 获取或者设置是否为主键。
        /// </summary>
        public bool IsPrimaryKey { get; set; }

        /// <summary>
        /// 获取或者设置是否为自动增长列。
        /// </summary>
        public bool IsIdentity { get; set; }

        /// <summary>
        /// 获取或者设置是否为可空。
        /// </summary>
        public bool IsNullable { get; set; }

        /// <summary>
        /// 获取或者设置列长度。
        /// </summary>
        public int DataLength { get; set; }

        #endregion
    }
}