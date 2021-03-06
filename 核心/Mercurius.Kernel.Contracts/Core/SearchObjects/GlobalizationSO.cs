﻿using Mercurius.Prime.Core.Services;

namespace Mercurius.Kernel.Contracts.Core.SearchObjects
{
    /// <summary>
    /// 本地化信息查询对象。
    /// </summary>
    public class GlobalizationSO : SearchObject
    {
        #region 属性

        /// <summary>
        /// 区域。
        /// </summary>
        public string AreaName { get; set; }

        /// <summary>
        /// 控制器。
        /// </summary>
        public string ControllerName { get; set; }

        /// <summary>
        /// 视图。
        /// </summary>
        public string View { get; set; }

        /// <summary>
        /// 键。
        /// </summary>
        public string Key { get; set; }

        #endregion
    }
}
