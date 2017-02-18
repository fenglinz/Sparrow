using System;
using System.Reflection;
using System.Windows;

namespace Mercurius.CodeBuilder.UI
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        #region 常量

        private const string PrivateBinPath = "Bins;Modules;Core;UI;";

        #endregion

        static App()
        {
            // 设置私有程序集加载位置。
            AppDomain.CurrentDomain.SetData("PRIVATE_BINPATH", PrivateBinPath);
            AppDomain.CurrentDomain.SetData("BINPATH_PROBE_ONLY", PrivateBinPath);

            var m = typeof(AppDomainSetup).GetMethod("UpdateContextProperty", BindingFlags.NonPublic | BindingFlags.Static);
            var funsion = typeof(AppDomain).GetMethod("GetFusionContext", BindingFlags.NonPublic | BindingFlags.Instance);

            m.Invoke(null, new object[] { funsion.Invoke(AppDomain.CurrentDomain, null), "PRIVATE_BINPATH", PrivateBinPath });

            // 设置固定程序配置文件名称。
            var configFile = "app.config";

            m.Invoke(null, new object[] { funsion.Invoke(AppDomain.CurrentDomain, null), "APP_CONFIG_FILE", configFile });
        }

        protected override void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);

            var bootstrapper = new CodeBuilderBootstrapper();

            bootstrapper.Run();
        }
    }
}
