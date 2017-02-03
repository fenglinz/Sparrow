using System;
using System.Linq;
using System.Reflection;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.WebPages.Razor;

namespace Mercurius.Backstage.Plugins
{
    /// <summary>
    /// Razar视图引擎扩展类。
    /// </summary>
    public class PluginRazorViewEngine : RazorViewEngine
    {
        #region 字段

        /// <summary>
        /// 区域视图位置格式化字符串集合。
        /// </summary>
        private string[] _areaViewLocationFormats = {
                "~/App_Data/Plugins/{2}/Views/{1}/{0}.cshtml",
                "~/App_Data/Plugins/{2}/Views/{1}/{0}.vbhtml",
                "~/App_Data/Plugins/{2}/Views/Shared/{0}.cshtml",
                "~/App_Data/Plugins/{2}/Views/Shared/{0}.vbhtml",
                "~/Areas/{2}/Views/{1}/{0}.cshtml",
                "~/Areas/{2}/Views/{1}/{0}.vbhtml",
                "~/Areas/{2}/Views/Shared/{0}.cshtml",
                "~/Areas/{2}/Views/Shared/{0}.vbhtml",
                "~/Views/Shared/{0}.cshtml",
                "~/Views/Shared/{0}.vbhtml"
            };

        /// <summary>
        /// 非区域视图位置格式化字符串集合。
        /// </summary>
        private string[] _viewLocationFormats = {
                "~/Views/{1}/{0}.cshtml",
                "~/Views/{1}/{0}.vbhtml",
                "~/Views/Shared/{0}.cshtml",
                "~/Views/Shared/{0}.vbhtml"
            };

        #endregion

        #region 构造方法

        /// <summary>初始化Razor引擎，参照
        /// <see cref="T:System.Web.Mvc.RazorViewEngine" /> 类。
        /// </summary>
        public PluginRazorViewEngine()
            : this(null)
        {
        }

        /// <summary> 
        /// <see cref="T:System.Web.Mvc.RazorViewEngine" />
        /// 构造方法：使用视图创建器初始化。
        /// </summary>
        /// <param name="viewPageActivator">视图创建器</param>
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

        #region 重写基类方法

        /// <summary>
        /// 查找视图页。
        /// </summary>
        /// <param name="controllerContext">控制器上下文</param>
        /// <param name="viewName">视图名称</param>
        /// <param name="masterName">母版视图名称</param>
        /// <param name="useCache">是否使用缓存</param>
        /// <returns>视图引擎结果</returns>
        public override ViewEngineResult FindView(
            ControllerContext controllerContext, string viewName, string masterName, bool useCache)
        {
            var areaName = GetAreaName(controllerContext.RouteData);

            if (areaName != null)
            {
                this.CodeGeneration(controllerContext.Controller.GetType());
            }

            return base.FindView(controllerContext, viewName, masterName, useCache);
        }

        /// <summary>
        /// 查找部分视图页。
        /// </summary>
        /// <param name="controllerContext">控制器上下文</param>
        /// <param name="partialViewName">部分视图名称</param>
        /// <param name="useCache">是否使用缓存</param>
        /// <returns>视图引擎结果</returns>
        public override ViewEngineResult FindPartialView(
            ControllerContext controllerContext, string partialViewName, bool useCache)
        {
            var areaName = GetAreaName(controllerContext.RouteData);

            if (areaName != null)
            {
                this.CodeGeneration(controllerContext.Controller.GetType());
            }

            return base.FindPartialView(controllerContext, partialViewName, useCache);
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 获取区域名称。
        /// </summary>
        /// <param name="routeData">路由信息</param>
        /// <returns>区域名称</returns>
        private string GetAreaName(RouteData routeData)
        {
            if (routeData.DataTokens.ContainsKey("area"))
            {
                return routeData.DataTokens["area"] as string;
            }

            return null;
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

        #endregion
    }
}