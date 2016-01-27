﻿using System;

namespace Mercurius.Siskin.Entities.RBAC.SO
{
    /// <summary>
    /// 回收站信息查询对象。
    /// </summary>
    public class RecyclebinSO : SearchObject
    {
        #region 字段

        private DateTime? _endDate;

        #endregion

        #region 属性

        /// <summary>
        /// 获取或者设置删除用户编号。
        /// </summary>
        public string UserId { get; set; }

        /// <summary>
        /// 获取或者设置回收站分类名称。
        /// </summary>
        public string Category { get; set; }

        /// <summary>
        /// 获取或者设置查询回收站信息的开始日期。
        /// </summary>
        public DateTime? StartDate { get; set; }

        /// <summary>
        /// 获取或者设置查询回收站信息的结束日期。
        /// </summary>
        public DateTime? EndDate
        {
            get
            {
                return this._endDate;
            }

            set
            {
                if (value.HasValue)
                {
                    this._endDate = value.Value.AddDays(1);
                }
            }
        }

        #endregion
    }
}
