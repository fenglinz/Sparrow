using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Mercurius.Kernel.Contracts.Dynamic.Entities;

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
        /// 列名称。
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 列属性名称。
        /// </summary>
        public string PropertyName { get; set; }

        /// <summary>
        /// 列描述信息。
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// 是否为主键。
        /// </summary>
        public bool IsPrimaryKey { get; set; }

        /// <summary>
        /// 是否为自动增长列。
        /// </summary>
        public bool IsIdentity { get; set; }

        /// <summary>
        /// 是否为可空。
        /// </summary>
        public bool IsNullable { get; set; }

        /// <summary>
        /// 列长度。
        /// </summary>
        public long? DataLength { get; set; }

        #endregion
    }
}