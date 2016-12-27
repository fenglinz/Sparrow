using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.WebPages.Razor;
using static Mercurius.Backstage.PluginManager;

namespace Mercurius.Backstage.Plugins
{
    /// <summary>
    /// Razar视图引擎扩展类。
    /// </summary>
    public class PluginRazorViewEngine : RazorViewEngine
    {
        #region 字段

        private string[] _areaViewLocationFormats = {
                "~/App_Data/Plugins/{2}/Views/{1}/{0}.cshtml",
                "~/App_Data/Plugins/{2}/Views/{1}/{0}.vbhtml",
                "~/App_Data/Plugins/{2}/Views/Shared/{0}.cshtml",
                "~/App_Data/Plugins/{2}/Views/Shared/{0}.vbhtml"
            };

        private string[] _pluginViewLocationFormats = {
                "~/App_Data/Plugins/{2}/Views/{1}/{0}.cshtml",
                "~/App_Data/Plugins/{2}/Views/{1}/{0}.vbhtml",
                "~/App_Data/Plugins/{2}/Views/Shared/{0}.cshtml",
                "~/App_Data/Plugins/{2}/Views/Shared/{0}.vbhtml",
                "~/Views/Shared/{0}.cshtml",
                "~/Views/Shared/{0}.vbhtml"
            };

        private string[] _viewLocationFormats = {
                "~/Views/{1}/{0}.cshtml",
                "~/Views/{1}/{0}.vbhtml",
                "~/Views/Shared/{0}.cshtml",
                "~/Views/Shared/{0}.vbhtml"
            };

        #endregion

        #region 构造方法

        /// <summary>Initializes a new instance of the 
        /// <see cref="T:System.Web.Mvc.RazorViewEngine" /> class.</summary>
        public PluginRazorViewEngine()
            : this(null)
        {
        }

        /// <summary>Initializes a new instance of the 
        /// <see cref="T:System.Web.Mvc.RazorViewEngine" />
        /// class using the view page activator.</summary>
        /// <param name="viewPageActivator">The view page activator.</param>
        public PluginRazorViewEngine(IViewPageActivator viewPageActivator)
            : base(viewPageActivator)
        {
            base.AreaViewLocationFormats = _areaViewLocationFormats;
            base.AreaMasterLocationFormats = _areaViewLocationFormats;
            base.AreaPartialViewLocationFormats = _areaViewLocationFormats;

            base.ViewLocationFormats = _viewLocationFormats;
            base.MasterLocationFormats = _viewLocationFormats;
            base.PartialViewLocationFormats = _viewLocationFormats;

            base.FileExtensions = new[] { "cshtml", "vbhtml" };
        }

        #endregion

        /// <summary>
        /// 搜索部分视图页。
        /// </summary>
        /// <param name="controllerContext"></param>
        /// <param name="partialViewName"></param>
        /// <param name="useCache"></param>
        /// <returns></returns>
        public override ViewEngineResult FindPartialView(ControllerContext controllerContext, string partialViewName, bool useCache)
        {
            var areaName = GetAreaName(controllerContext.RouteData);
            //   UpdatePath(areaName);
            UpdateRouteData(areaName, controllerContext);

            if (areaName != null)
            {
                this.CodeGeneration(controllerContext.Controller.GetType());
            }

            return base.FindPartialView(controllerContext, partialViewName, useCache);
        }

        public override ViewEngineResult FindView(ControllerContext controllerContext, string viewName, string masterName, bool useCache)
        {
            var areaName = GetAreaName(controllerContext.RouteData);
            //    UpdatePath(areaName);
            UpdateRouteData(areaName, controllerContext);

            if (areaName != null)
            {
                this.CodeGeneration(controllerContext.Controller.GetType());
            }

            return base.FindView(controllerContext, viewName, masterName, useCache);
        }

        protected virtual string GetAreaName(RouteData routeData)
        {
            if (routeData.Values.ContainsKey("area"))
            {
                var pluginName = routeData.GetRequiredString("area");

                return pluginName;
            }

            object obj2;

            if (routeData.DataTokens.TryGetValue("area", out obj2))
            {
                return (obj2 as string);
            }

            return GetAreaName(routeData.Route);
        }

        protected virtual string GetAreaName(RouteBase route)
        {
            var area = route as IRouteWithArea;

            if (area != null)
            {
                return area.Area;
            }

            var route2 = route as Route;

            if ((route2 != null) && (route2.DataTokens != null) && (route2.DataTokens.ContainsKey("area")))
            {
                return (route2.DataTokens["area"] as string);
            }

            return null;
        }

        #region 私有方法

        private void UpdateRouteData(string areaName, ControllerContext controllerContext)
        {
            var pluginName = string.Empty;
            var routeData = controllerContext.RouteData;

            if (routeData.Values.ContainsKey("area"))
            {
                pluginName = routeData.GetRequiredString("area");
            }

            var route = controllerContext.RouteData.Route as Route;

            if (route.DataTokens["area"] != null)
            {
                route.DataTokens["area"] = route.DataTokens["area"];
            }
            else if (pluginName != string.Empty)
            {
                route.DataTokens["area"] = pluginName;
            }
            else
            {
                route.DataTokens["area"] = null;
            }
        }

        /// <summary>
        /// 给运行时编译的页面加了引用程序集。
        /// </summary>
        /// <param name="controllerType"></param>
        private void CodeGeneration(Type controllerType)
        {
            RazorBuildProvider.CodeGenerationStarted += (sender, e) =>
            {
                var provider = (RazorBuildProvider)sender;
                var plugin = PluginManager.Plugins.FirstOrDefault(p => p.Items.Any(c => c.Controller == controllerType));

                if (plugin != null)
                {
                    provider.AssemblyBuilder.AddAssemblyReference(plugin.Assembly);

                    if (plugin.Assembly.GetReferencedAssemblies() != null)
                    {
                        foreach (var assem in plugin.Assembly.GetReferencedAssemblies())
                        {
                            provider.AssemblyBuilder.AddAssemblyReference(Assembly.Load(assem));
                        }
                    }
                }
            };
        }

        /// <summary>
        /// 更新路径中的插件名称参数。
        /// </summary>
        /// <param name="moduleName"></param>
        private void UpdatePath(string moduleName)
        {
            if (moduleName != null)
            {
                var pluginViewLocationFormats = new string[this._pluginViewLocationFormats.Length];

                if (pluginViewLocationFormats != null)
                {
                    for (var index = 0; index < pluginViewLocationFormats.Length; index++)
                    {
                        pluginViewLocationFormats[index] = this._pluginViewLocationFormats[index].Replace("{area}", moduleName);
                    }

                }
                base.ViewLocationFormats = pluginViewLocationFormats;
                base.MasterLocationFormats = pluginViewLocationFormats;
                base.PartialViewLocationFormats = pluginViewLocationFormats;
            }
            else
            {
                base.ViewLocationFormats = _viewLocationFormats;
                base.MasterLocationFormats = _viewLocationFormats;
                base.PartialViewLocationFormats = _viewLocationFormats;
            }
        }

        #endregion
    }
}