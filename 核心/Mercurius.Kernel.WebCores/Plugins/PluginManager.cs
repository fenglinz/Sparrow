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
using Mercurius.Prime.Core;

namespace Mercurius.Kernel.WebCores.Plugins
{
    /// <summary>
    /// 插件管理类。
    /// </summary>
    public static class PluginManager
    {
        #region 属性

        /// <summary>
        /// 插件集合。
        /// </summary>
        public static IList<Plugin> Plugins { get; private set; }

        #endregion

        #region 插件初始化处理

        /// <summary>
        /// 插件初始化处理。
        /// </summary>
        public static void Initialize()
        {
            var pluginsPath = $"{AppDomain.CurrentDomain.BaseDirectory}App_Data\\Plugins";

            if (!Directory.Exists(pluginsPath))
            {
                return;
            }

            // 查找插件。
            var paths = Directory.GetDirectories(pluginsPath);

            // 加载插件的程序集&注册插件为区域。
            if (paths.Length > 0)
            {
                Plugins = new List<Plugin>();

                var binPaths = "bin;";

                foreach (var item in paths)
                {
                    var binPath = Path.Combine(item, "bin");

                    if (!Directory.Exists(binPath))
                    {
                        continue;
                    }

                    binPaths += binPath + ";";

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

                            // 加载程序集。
                            // 将程序集加载到当前应用程序域。
                            var assembly = Assembly.Load(AssemblyName.GetAssemblyName(bin));

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

                // 设置私有程序集加载位置。
                AppDomain.CurrentDomain.SetData("PRIVATE_BINPATH", binPaths);
                AppDomain.CurrentDomain.SetData("BINPATH_PROBE_ONLY", binPaths);

                var m = typeof(AppDomainSetup).GetMethod("UpdateContextProperty", BindingFlags.NonPublic | BindingFlags.Static);
                var funsion = typeof(AppDomain).GetMethod("GetFusionContext", BindingFlags.NonPublic | BindingFlags.Instance);

                m.Invoke(null, new[] { funsion.Invoke(AppDomain.CurrentDomain, null), "PRIVATE_BINPATH", binPaths });
            }
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
    }
}