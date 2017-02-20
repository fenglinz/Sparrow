using System.Diagnostics;
using System.Web;
using System.Xml;
using Autofac;
using IBatisNet.DataMapper;
using IBatisNet.DataMapper.Configuration;
using Mercurius.Kernel.WebCores.Plugins;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Dynamic;
using Mercurius.Prime.Data.IBatisNet;
using static Mercurius.Prime.Core.SystemConfiguration;

namespace Mercurius.Sparrow.Autofac
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
            builder.Register(c =>
            {
                var writer = GetMergedSqlMapper($"~/App_Data/IBatisNet/{DatabaseType}/SqlConfig-Writer.xml");

                if (Get<bool>("EnableReadWriteSeparation", false))
                {
                    var reader = GetMergedSqlMapper($"~/App_Data/IBatisNet/{DatabaseType}/SqlConfig-Reader.xml");

                    return new SqlMapperManager(writer, reader);
                }

                return new SqlMapperManager(writer);
            }).SingleInstance();

            builder.Register(c => new Persistence { SqlMapperManager = c.Resolve<SqlMapperManager>() })
                .InstancePerLifetimeScope();

            // 注册基于SQL Server的DynamicQueryProvider
            builder.Register(c => new IBatisNetMSSQLDynamicQueryProvider(c.Resolve<SqlMapperManager>()[RW.Write]))
                .As<DynamicQueryProvider>()
                .InstancePerLifetimeScope();

            // 注册DynamicQuery
            builder.Register(c => new DynamicQuery { Provider = c.Resolve<DynamicQueryProvider>() })
                .InstancePerLifetimeScope();
        }

        #region 私有方法

        /// <summary>
        /// 获取与插件SqlMap配置合并后的SqlMapper对象。
        /// </summary>
        /// <param name="sqlConfigPath">主配置文件路径</param>
        /// <returns>SqlMapper对象</returns>
        private ISqlMapper GetMergedSqlMapper(string sqlConfigPath)
        {
            var document = new XmlDocument();
            var sqlMapBuilder = new DomSqlMapBuilder();

            document.Load(HttpContext.Current.Server.MapPath(sqlConfigPath));

            var sqlMapItems = PluginManager.GetIBatisNetSqlMaps();

            if (!sqlMapItems.IsEmpty())
            {
                var navigator = document.CreateNavigator();
                var xmlNamespaceManager = new XmlNamespaceManager(document.NameTable);

                xmlNamespaceManager.AddNamespace("ns", "http://ibatis.apache.org/dataMapper");

                var sqlMaps = navigator.SelectSingleNode("//ns:sqlMaps", xmlNamespaceManager);

                foreach (var item in sqlMapItems)
                {
                    foreach (XmlNode a in item)
                    {
                        sqlMaps.AppendChild(a.OuterXml);
                    }
                }
            }

            return sqlMapBuilder.Configure(document);
        }

        #endregion
    }
}