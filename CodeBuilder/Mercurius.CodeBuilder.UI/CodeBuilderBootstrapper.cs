using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using Mercurius.CodeBuilder.Core;
using Mercurius.CodeBuilder.Core.Database;
using Mercurius.CodeBuilder.CSharp;
using Mercurius.CodeBuilder.DbMetadata.MSSQL;
using Mercurius.CodeBuilder.DbMetadata.Oracle;
using Microsoft.Practices.Unity;
using Prism.Modularity;
using Prism.Unity;

namespace Mercurius.CodeBuilder.UI
{
    /// <summary>
    /// Prism启动器。
    /// </summary>
    public class CodeBuilderBootstrapper : UnityBootstrapper
    {
        /// <summary>
        /// 创建Shell.
        /// </summary>
        /// <returns>Shell对象</returns>
        protected override DependencyObject CreateShell()
        {
            return this.Container.Resolve<Shell>();
        }

        protected override void InitializeShell()
        {
            Application.Current.MainWindow = this.Shell as Window;
            Application.Current.MainWindow.Show();
        }

        protected override void ConfigureContainer()
        {
            base.ConfigureContainer();

            this.Container.RegisterType<Metadata, MSSQLMetadata>("MSSQL");
            this.Container.RegisterType<Metadata, OracleMetadata>("Oracle");
            this.Container.RegisterType<DbTypeMapping, MSSQLDbTypeMapping>("MSSQL");
            this.Container.RegisterType<DbTypeMapping, OracleDbTypeMapping>("Oracle");
            this.Container.RegisterType<AbstractCodeCreator, CSharpCodeCreator>("C#");
        }

        protected override void ConfigureModuleCatalog()
        {
            this.ModuleCatalog.AddModule(new ModuleInfo
            {
                ModuleName = "CodeBuilder",
                ModuleType = typeof(Module).AssemblyQualifiedName
            });
        }
    }
}
