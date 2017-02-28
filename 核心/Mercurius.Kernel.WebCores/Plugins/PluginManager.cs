using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Compilation;
using System.Web.Mvc;
using System.Web.Routing;
using System.Xml;
using Mercurius.Kernel.WebCores.Plugins;
using Mercurius.Prime.Core;
using System.Configuration;
using System.Diagnostics;

// 初始化插件。
[assembly: PreApplicationStartMethod(typeof(PluginManager), "Initialize")]
namespace Mercurius.Kernel.WebCores.Plugins
{
    /// <summary>
    /// 插件管理类。
    /// </summary>
    public static class PluginManager
    {
        #region 字段

        private static readonly string _pluginBins;
        private static readonly FileSystemWatcher _fileSystemWatcher;

        #endregion

        #region 属性

        /// <summary>
        /// 插件存放目录。
        /// </summary>
        public static string PluginsDirectory { get; private set; }

        /// <summary>
        /// 插件dll临时存放目录。
        /// </summary>
        public static string PluginBinsTemporaryDirectory { get; private set; }

        /// <summary>
        /// 插件集合。
        /// </summary>
        public static IList<Plugin> Plugins { get; private set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 静态构造方法。
        /// </summary>
        static PluginManager()
        {
            var plugins = ConfigurationManager.AppSettings["Plugins"]?.Replace("/", "\\") ?? "App_Data\\Plugins";

            _pluginBins = ConfigurationManager.AppSettings["PluginBins"]?.Replace("/", "\\") ?? "plugins";

            PluginsDirectory = $"{AppDomain.CurrentDomain.BaseDirectory}{plugins}";
            PluginBinsTemporaryDirectory = $"{AppDomain.CurrentDomain.BaseDirectory}{_pluginBins}";

            if (!Directory.Exists(PluginBinsTemporaryDirectory))
            {
                Directory.CreateDirectory(PluginBinsTemporaryDirectory);
            }

            if (File.Exists(PluginsDirectory))
            {
                _fileSystemWatcher = new FileSystemWatcher(PluginsDirectory, "*.dll")
                {
                    IncludeSubdirectories = true,
                    NotifyFilter = NotifyFilters.DirectoryName | NotifyFilters.FileName | NotifyFilters.Security | NotifyFilters.Size | NotifyFilters.CreationTime | NotifyFilters.Attributes,
                    EnableRaisingEvents = true,
                };

                _fileSystemWatcher.Created += (sender, e) => Initialize();
                _fileSystemWatcher.Changed += (sender, e) => Initialize();
                _fileSystemWatcher.Changed += (sender, e) => Initialize();
                _fileSystemWatcher.Deleted += (sender, e) => Initialize();
            }
        }

        #endregion

        #region 插件初始化处理

        /// <summary>
        /// 插件初始化处理。
        /// </summary>
        public static void Initialize()
        {
            if (!Directory.Exists(PluginsDirectory))
            {
                return;
            }

            // 清理失效的插件。
            ClearExpiredPlugins();

            // 查找插件。
            var paths = Directory.GetDirectories(PluginsDirectory);

            // 加载插件的程序集&注册插件为区域。
            if (paths.Length > 0)
            {
                Plugins = new List<Plugin>();

                foreach (var item in paths)
                {
                    var binPath = Path.Combine(item, "bin");

                    if (!Directory.Exists(binPath))
                    {
                        continue;
                    }

                    var plugin = new Plugin();
                    var bins = Directory.GetFiles(binPath, "*.dll");

                    plugin.PluginName = item.Split('\\').Last();

                    if (bins.Length > 0)
                    {
                        var assemblies = AppDomain.CurrentDomain.GetAssemblies();

                        foreach (var bin in bins)
                        {
                            if (assemblies.Any(a => a.GetName().Name == Path.GetFileNameWithoutExtension(bin)))
                            {
                                File.Delete(bin);

                                continue;
                            }

                            var pluginDllPath = Path.Combine(PluginBinsTemporaryDirectory, Path.GetFileName(bin));

                            try
                            {
                                File.Copy(bin, pluginDllPath, true);
                            }
                            catch (Exception exception)
                            {
                                Debug.WriteLine($"复制失败，请重启IIS后再重试！");
                            }

                            // 加载程序集。
                            // 将程序集加载到当前应用程序域。
                            var assembly = Assembly.Load(AssemblyName.GetAssemblyName(pluginDllPath));

                            BuildManager.AddReferencedAssembly(assembly);

                            plugin.Assembly = assembly;

                            // 扫描程序集中的控制器。
                            if (assembly.GetTypes().Any(t => t.IsSubclassOf(typeof(Controller))))
                            {
                                var controllers = assembly.GetTypes().Where(t => t.IsSubclassOf(typeof(Controller)));

                                foreach (var controller in controllers)
                                {
                                    plugin.AddItem(new PluginItem
                                    {
                                        Controller = controller
                                    });
                                }
                            }

                            // 扫描插件中的IBatisNet配置。
                            var sqlMapPath = Path.Combine(item, "App_Data\\SqlMaps.xml");

                            if (File.Exists(sqlMapPath))
                            {
                                plugin.IBatisNetSqlMapConfigPath = sqlMapPath;
                            }
                        }
                    }

                    Plugins.Add(plugin);
                }
            }

            var privateBinPath = $"bin;{_pluginBins}";

            // 设置私有程序集加载位置。
            AppDomain.CurrentDomain.SetData("PRIVATE_BINPATH", privateBinPath);
            AppDomain.CurrentDomain.SetData("BINPATH_PROBE_ONLY", privateBinPath);

            var m = typeof(AppDomainSetup).GetMethod("UpdateContextProperty", BindingFlags.NonPublic | BindingFlags.Static);
            var funsion = typeof(AppDomain).GetMethod("GetFusionContext", BindingFlags.NonPublic | BindingFlags.Instance);

            m.Invoke(null, new object[] { funsion.Invoke(AppDomain.CurrentDomain, null), "PRIVATE_BINPATH", privateBinPath });

            // 插件注册。
            RegisterPluginAreas();
        }

        #endregion

        #region 插件注册

        /// <summary>
        /// 将插件注册为区域。
        /// </summary>
        public static void RegisterPluginAreas()
        {
            if (!Plugins.IsEmpty())
            {
                foreach (var plugin in Plugins)
                {
                    // 将插件注册为Asp.Net MVC区域。
                    var route = RouteTable.Routes.MapRoute(
                        $"{plugin.PluginName}_Plugin",
                        plugin.PluginName + "/{controller}/{action}/{id}",
                        new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                        plugin.Namespaces.ToArray()
                    );

                    route.DataTokens["area"] = plugin.PluginName;
                }

                // 采用自定义的Razor视图引擎。
                ViewEngines.Engines.Clear();
                ViewEngines.Engines.Add(new PluginRazorViewEngine());
            }
        }

        #endregion

        #region 插件中的IBatis配置

        /// <summary>
        /// 获取IBaitsNet SqlMaps配置信息。
        /// </summary>
        /// <returns>SqlMaps配置集合</returns>
        public static IList<XmlNodeList> GetIBatisNetSqlMaps()
        {
            var result = new List<XmlNodeList>();

            if (!Plugins.IsEmpty())
            {
                foreach (var item in Plugins)
                {
                    if (File.Exists(item.IBatisNetSqlMapConfigPath))
                    {
                        var document = new XmlDocument();

                        document.Load(item.IBatisNetSqlMapConfigPath);

                        result.Add(document.DocumentElement.ChildNodes);
                    }
                }
            }

            return result;
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 清理失效的插件dll。
        /// </summary>
        private static void ClearExpiredPlugins()
        {
            var sourceBins = from f in Directory.GetFiles(PluginsDirectory, "*.dll", SearchOption.AllDirectories) select Path.GetFileNameWithoutExtension(f);
            var tempBins = from f in Directory.GetFiles(PluginBinsTemporaryDirectory, "*.dll", SearchOption.AllDirectories) select Path.GetFileNameWithoutExtension(f);

            if (tempBins != null)
            {
                var bins = tempBins as string[] ?? tempBins.ToArray();

                for (var i = 0; i < bins.Length; i++)
                {
                    var bin = bins[i];

                    if (!sourceBins.Contains(bin))
                    {
                        try
                        {
                            File.Delete(bin);
                        }
                        catch (Exception exception)
                        {
                            Debug.WriteLine($"文件{bin}删除失败，原因：{exception.Message}");
                        }
                    }
                }
            }
        }

        #endregion
    }
}