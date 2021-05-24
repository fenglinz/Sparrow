using System.Windows;
using Mercurius.CodeBuilder.Core;
using Mercurius.CodeBuilder.Core.Database;
using Mercurius.CodeBuilder.CSharp;
using Mercurius.CodeBuilder.DbMetadata.MSSQL;
using Mercurius.CodeBuilder.DbMetadata.Oracle;
using Microsoft.Practices.ServiceLocation;
using Prism.Modularity;
using Prism.Unity;
using Mercurius.CodeBuilder.DbMetadata.MySQL;
using Mercurius.CodeBuilder.Java;
using Prism.Ioc;

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

        protected override void InitializeShell(DependencyObject shell)
        {
            Application.Current.MainWindow = shell as Shell;
            Application.Current.MainWindow.Show();
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
}
