﻿using IBatisNet.DataMapper;
using Mercurius.Prime.Core.Dynamic;

namespace Mercurius.Prime.Data.IBatisNet
{
    /// <summary>
    /// 集成IBatis.Net的针对PostgreSQL数据库的动态查询对象。
    /// </summary>
    public class IBatisNetPostSQLDynamicQueryProvider : PostgreSQLDynamicQueryProvider
    {
        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="sqlMapper">数据库提供者名称</param>
        public IBatisNetPostSQLDynamicQueryProvider(ISqlMapper sqlMapper)
            : base(sqlMapper.GetProviderName(), sqlMapper.DataSource.ConnectionString)
        {
        }

        #endregion
    }
}
