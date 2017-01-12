using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using Autofac;
using IBatisNet.DataMapper;
using IBatisNet.DataMapper.Configuration;
using Mercurius.Backstage.Plugins;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Dynamic;
using Mercurius.Prime.Data.IBatisNet;

namespace Mercurius.Backstage.Autofac
{
    /// <summary>
    /// IBatisNet注册模块。
    /// </summary>
    public class IBatisNetModule : Module
    {
        /// <summary>
        /// 模块加载处理。
        /// </summary>
        /// <param name="builder">Autofac容器</param>
        protected override void Load(ContainerBuilder builder)
        {
            // 注册IBatisNet。
            builder.Register(c =>
            {
                var sqlMapBuilder = new DomSqlMapBuilder();
                var sqlMapConfigPath = HttpContext.Current.Server.MapPath("~/App_Data/IBatisNet/MSSQL/SqlConfig-Reader.xml");

                var document = new XmlDocument();

                document.Load(sqlMapConfigPath);

                var result = PluginManager.GetIBatisNetSqlMaps();

                // 整合插件中的IBatisNet SqlMaps配置。
                if (!result.IsEmpty())
                {
                    var navigator = document.CreateNavigator();
                    var xmlNamespaceManager = new XmlNamespaceManager(document.NameTable);

                    xmlNamespaceManager.AddNamespace("ns", "http://ibatis.apache.org/dataMapper");

                    var sqlMaps = navigator.SelectSingleNode("//ns:sqlMaps", xmlNamespaceManager);

                    foreach (var item in result)
                    {
                        foreach (XmlNode a in item)
                        {
                            sqlMaps.AppendChild(a.OuterXml);
                        }
                    }
                }

                return sqlMapBuilder.Configure(document);
            }).As<ISqlMapper>().SingleInstance();

            builder.Register(c => new SqlMapperManager(c.Resolve<ISqlMapper>())).SingleInstance();
            builder.Register(c => new Persistence { SqlMapperManager = c.Resolve<SqlMapperManager>() }).InstancePerLifetimeScope();

            // 注册基于SQL Server的DynamicQueryProvider
            builder.Register(c => new IBatisNetMSSQLDynamicQueryProvider(c.Resolve<ISqlMapper>())).As<DynamicQueryProvider>().InstancePerLifetimeScope();

            // 注册DynamicQuery
            builder.Register(c => new DynamicQuery { Provider = c.Resolve<DynamicQueryProvider>() }).InstancePerLifetimeScope();
        }
    }
}