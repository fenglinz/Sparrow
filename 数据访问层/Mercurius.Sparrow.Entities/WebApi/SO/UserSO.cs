﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mercurius.Sparrow.Entities.WebApi.SO
{
    /// <summary>
    /// WebApi用户查询条件。
    /// </summary>
    public class UserSO : SearchObject
    {
        #region 属性

        /// <summary>
        /// 账号。
        /// </summary>
        public virtual string Account { get; set; }

        /// <summary>
        /// 使用者描述。
        /// </summary>
        public virtual string Description { get; set; }

        /// <summary>
        /// 状态。
        /// </summary>
        public virtual int? Status { get; set; }

        #endregion
    }
}
