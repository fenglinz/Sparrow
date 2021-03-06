﻿using Mercurius.Prime.Core.Services;

namespace Mercurius.Kernel.Contracts.RBAC.SearchObjects
{
    /// <summary>
    /// 组织机构查询对象。
    /// </summary>
    public class OrganizationSO : SearchObject
    {
        #region 属性

        /// <summary>
        /// 组织机构编号。
        /// </summary>
        public virtual string OrganizationId { get; set; }

        /// <summary>
        /// 查询分类。
        /// </summary>
        public virtual string SearchCategory { get; set; }

        /// <summary>
        /// 查询值。
        /// </summary>
        public virtual string SearchValue { get; set; }

        #endregion
    }
}
