using System;
using System.IO;
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

            m.Invoke(null, new[] { funsion.Invoke(AppDomain.CurrentDomain, null), "PRIVATE_BINPATH", PrivateBinPath });
        }

        protected override void OnStartup(StartupEventArgs e)
        {
            // 检查配置文件。
            CheckEnvironment();

            // 设置固定程序配置文件名称。
            var configFile = "app.config";

            AppDomain.CurrentDomain.SetData("APP_CONFIG_FILE", configFile);

            base.OnStartup(e);

            var bootstrapper = new CodeBuilderBootstrapper();

            bootstrapper.Run();
        }

        private void CheckEnvironment()
        {
            var configFile = $"{AppDomain.CurrentDomain.BaseDirectory}app.config";

            if (!File.Exists(configFile))
            {
                MessageBox.Show("警告：App.config文件不存在！", "警告", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
    }
}
