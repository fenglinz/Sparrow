using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Autofac;
using Autofac.Core;
using IBatisNet.DataMapper;
using IBatisNet.DataMapper.Configuration;
using Mercurius.Infrastructure.Dynamic;
using Mercurius.Sparrow.Repositories;

namespace Mercurius.Sparrow.Autofac
{
    /// <summary>
    /// IBatisNet注册模块。
    /// </summary>
    public class IBatisNetModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            // 注册IBatisNet。
            builder.Register(c =>
                {
                    var sqlMapBuilder = new DomSqlMapBuilder();

                    return sqlMapBuilder.Configure(HttpContext.Current.Server.MapPath("~/App_Data/IBatisNet/MSSQL/SqlConfig-Reader.xml"));
                })
                .As<ISqlMapper>()
                .SingleInstance();

            builder.Register(c => new SqlMapperManager(c.Resolve<ISqlMapper>()))
                .SingleInstance();
            
            builder.Register(c => new Persistence { SqlMapperManager = c.Resolve<SqlMapperManager>() })
                .InstancePerLifetimeScope()
                .OnActivated(p =>
                {
                    var sqlMapper = p.Instance.SqlMapperManager[RWDecision.Write];

                    if (sqlMapper.LocalSession != null && !sqlMapper.LocalSession.IsTransactionStart)
                    {
                        sqlMapper.BeginTransaction();
                    }
                })
                .OnRelease(p =>
                {
                    var sqlMapper = p.SqlMapperManager[RWDecision.Write];

                    if (sqlMapper.LocalSession!=null && sqlMapper.LocalSession.IsTransactionStart)
                    {
                        sqlMapper.CommitTransaction();
                    }
                });

            // 注册基于SQL Server的DynamicQueryProvider
            builder.Register(c => new IBatisNetMSSQLDynamicQueryProvider(c.Resolve<ISqlMapper>()))
                .As<DynamicQueryProvider>()
                .InstancePerLifetimeScope();

            // 注册DynamicQuery
            builder.Register(c => new DynamicQuery { Provider = c.Resolve<DynamicQueryProvider>() })
                .InstancePerLifetimeScope();
        }
    }
}