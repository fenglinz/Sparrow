﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mercurius.CodeBuilder.Core.Database
{
    public class ConnectedDatabase
    {
        #region 属性

        /// <summary>
        /// 获取或者设置数据库名称。
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 获取或者设置数据库类型。
        /// </summary>
        public DatabaseType Type { get; set; }

        /// <summary>
        /// 获取或者设置数据库连接地址。
        /// </summary>
        public string ServerUri { get; set; }

        /// <summary>
        /// 获取或者设置帐户。
        /// </summary>
        public string Account { get; set; }

        /// <summary>
        /// 获取或者设置密码。
        /// </summary>
        public string Password { get; set; }

        #endregion
    }
}
