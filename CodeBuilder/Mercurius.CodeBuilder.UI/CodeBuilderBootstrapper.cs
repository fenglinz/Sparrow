using System;
using System.Collections.Generic;
using System.Windows;
using CommonServiceLocator;
using Mercurius.CodeBuilder.Core;
using Mercurius.CodeBuilder.Core.Database;
using Mercurius.CodeBuilder.CSharp;
using Mercurius.CodeBuilder.DbMetadata.MSSQL;
using Mercurius.CodeBuilder.DbMetadata.MySQL;
using Mercurius.CodeBuilder.DbMetadata.Oracle;
using Mercurius.CodeBuilder.Java;
using Prism.Ioc;
using Prism.Modularity;
using Prism.Unity;

namespace Mercurius.CodeBuilder.UI
{
    /// <summary>
    /// Prism启动器。
    /// </summary>
    public class CodeBuilderBootstrapper : PrismBootstrapper
    {
        /// <summary>
        /// 创建Shell.
        /// </summary>
        /// <returns>Shell对象</returns>
        protected override DependencyObject CreateShell()
        {
            return this.Container.Resolve<Shell>();
        }

        //protected override void InitializeShell(DependencyObject shell)
        //{
        //    Application.Current.MainWindow = shell as Shell;
        //    Application.Current.MainWindow.Show();
        //}

        protected override void OnInitialized()
        {
            base.OnInitialized();

            ServiceLocator.SetLocatorProvider(() => new ServiceLocatorAdapter(Container));
        }

        protected override void RegisterTypes(IContainerRegistry containerRegistry)
        {
            containerRegistry.Register<Metadata, MSSQLMetadata>("MSSQL");
            containerRegistry.Register<Metadata, MySQLMetadata>("MySQL");
            containerRegistry.Register<Metadata, OracleMetadata>("Oracle");
            containerRegistry.Register<DbTypeMapping, MSSQLDbTypeMapping>("MSSQL");
            containerRegistry.Register<DbTypeMapping, MySQLDbTypeMapping>("MySQL");
            containerRegistry.Register<DbTypeMapping, OracleDbTypeMapping>("Oracle");
            containerRegistry.Register<AbstractCodeCreator, CSharpCodeCreator>("C#");
            containerRegistry.Register<AbstractCodeCreator, JavaCodeCreator>("Java");
        }

        protected override void ConfigureModuleCatalog(IModuleCatalog moduleCatalog)
        {
            moduleCatalog.AddModule<Module>();
        }
    }

    public class ServiceLocatorAdapter : ServiceLocatorImplBase
    {
        private readonly IContainerProvider container;

        public ServiceLocatorAdapter(IContainerProvider container)
        {
            this.container = container;
        }

        protected override IEnumerable<object> DoGetAllInstances(Type serviceType)
        {
            yield return this.container.Resolve(serviceType);
        }

        protected override object DoGetInstance(Type serviceType, string key)
        {
            if (!string.IsNullOrWhiteSpace(key))
            {
                return this.container.Resolve(serviceType, key);
            }

            return this.container.Resolve(serviceType);
        }
    }
}
