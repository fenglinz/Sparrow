using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Mercurius.Backstage.Plugins
{
    /// <summary>
    /// 基于插件开发的控制器创建工厂类。
    /// </summary>
    public class PluginControllerFactory : DefaultControllerFactory
    {
        /// <summary>
        /// 获取控制器类型。
        /// </summary>
        /// <param name="requestContext">Http请求上下文</param>
        /// <param name="controllerName">控制器名称</param>
        /// <returns>控制器类型信息</returns>
        protected override Type GetControllerType(RequestContext requestContext, string controllerName)
        {
            Type controllerType = null;

            if (requestContext.RouteData.Values.ContainsKey("namespaces"))
            {
                var namespaces = requestContext.RouteData.Values["namespaces"] as string[];

                controllerType = this.GetControllerType(namespaces, controllerName);
            }

            return controllerType ?? (controllerType = base.GetControllerType(requestContext, controllerName));
        }

        #region 私有方法

        /// <summary>
        /// 根据控制器名称获得控制器类型。
        /// </summary>
        /// <param name="namespaces">命名空间集合</param>
        /// <param name="controllerName">控制器名称</param>
        /// <returns>控制器类型</returns>
        private Type GetControllerType(string[] namespaces, string controllerName)
        {
            var plugin = PluginManager.Plugins.FirstOrDefault(p => p.InNamespaces(namespaces));

            return plugin?.Items.FirstOrDefault(i => i.Controller.Name == controllerName + "Controller")?.Controller ??
                       Type.GetType($"{namespaces[0]}.{controllerName}Controller");
        }

        #endregion
    }
}