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
using Mercurius.Backstage.Plugins;

namespace Mercurius.Backstage
{
    /// <summary>
    /// 插件管理类。
    /// </summary>
    public class PluginManager
    {
        public static void Initialize()
        {
            var pluginsPath = $"{AppDomain.CurrentDomain.BaseDirectory}App_Data\\Plugins";

            if (!Directory.Exists(pluginsPath))
            {
                return;
            }

            // 查找插件。
            var plugins = Directory.GetDirectories(pluginsPath);

            // 加载插件的程序集&注册插件为区域。
            if (plugins != null && plugins.Length > 0)
            {
                foreach (var item in plugins)
                {
                    var binPath = Path.Combine(item, "bin");
                    var bins = Directory.GetFiles(binPath, "*.dll");

                    if (bins != null && bins.Length > 0)
                    {
                        var assemblies = AppDomain.CurrentDomain.GetAssemblies();

                        foreach (var bin in bins)
                        {
                            if (assemblies.Any(a => a.GetName().Name == Path.GetFileNameWithoutExtension(bin)))
                            {
                                File.Delete(bin);

                                continue;
                            }

                            // 在Autofac容器中注册。
                            var assembly = Assembly.LoadFile(bin);

                            AppDomain.CurrentDomain.Load(AssemblyName.GetAssemblyName(bin));
                            // BuildManager.AddReferencedAssembly(assembly);
                        }
                    }
                }
            }
        }

        #region 插件注册

        /// <summary>
        /// 将插件注册为区域。
        /// </summary>
        public static void RegisterPluginAreas()
        {
            // 插件所在的目录。
            var pluginsPath = $"{AppDomain.CurrentDomain.BaseDirectory}App_Data\\Plugins";

            if (!Directory.Exists(pluginsPath))
            {
                return;
            }

            // 查找插件。
            var plugins = Directory.GetDirectories(pluginsPath);

            // 加载插件的程序集&注册插件为区域。
            if (plugins != null && plugins.Length > 0)
            {
                foreach (var item in plugins)
                {
                    var pluginArea = item.Split('\\').Last();

                    var binPath = Path.Combine(item, "bin");
                    var bins = Directory.GetFiles(binPath, "*.dll");

                    if (bins != null && bins.Length > 0)
                    {
                        var pluginNamespaces = string.Empty;

                        foreach (var bin in bins)
                        {
                            var assembleName = Path.GetFileNameWithoutExtension(bin);

                            // 解决控制器命名冲突的问题。
                            if (bin.EndsWith($"Plugins.{pluginArea}.dll"))
                            {
                                pluginNamespaces = assembleName;
                            }
                        }

                        // 将插件注册为Asp.Net MVC区域。
                        var route = RouteTable.Routes.MapRoute(
                            $"{pluginArea}_Plugin",
                            pluginArea + "/{controller}/{action}/{id}",
                            new { controller = "Home", action = "Index", id = UrlParameter.Optional, pluginName = pluginNamespaces },
                            new[] { $"{pluginNamespaces}.Controllers" }
                        );

                        route.DataTokens["area"] = pluginArea;
                    }
                }

                // 采用自定义的Razor视图引擎。
                ViewEngines.Engines.Clear();
                ViewEngines.Engines.Add(new PluginRazorViewEngine());
            }
        }

        #endregion

        #region 插件中的IBatis配置

        /// <summary>
        /// 获取IBaitsNetSqlMaps配置信息。
        /// </summary>
        /// <returns></returns>
        public static IList<XmlNodeList> GetIBatisNetSqlMaps()
        {
            var result = new List<XmlNodeList>();

            // 插件所在的目录。
            var pluginsPath = $"{AppDomain.CurrentDomain.BaseDirectory}\\App_Data\\Plugins";

            if (!Directory.Exists(pluginsPath))
            {
                return result;
            }

            // 查找插件。
            var plugins = Directory.GetDirectories(pluginsPath);

            // 加载插件的程序集&注册插件为区域。
            if (plugins != null && plugins.Length > 0)
            {
                foreach (var item in plugins)
                {
                    var sqlMapPath = Path.Combine(item, "App_Data\\SqlMaps.xml");

                    if (File.Exists(sqlMapPath))
                    {
                        var document = new XmlDocument();

                        document.Load(sqlMapPath);

                        result.Add(document.DocumentElement.ChildNodes);
                    }
                }
            }

            return result;
        }

        #endregion
    }
}