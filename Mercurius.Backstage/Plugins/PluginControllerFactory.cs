using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Mercurius.Backstage.Extensions
{
    public class PluginControllerFactory : DefaultControllerFactory
    {
        protected override Type GetControllerType(RequestContext requestContext, string controllerName)
        {
            Type controllerType = null;

            if (requestContext.RouteData.DataTokens.ContainsKey("Namespaces"))
            {
                var namespaces = requestContext.RouteData.DataTokens["Namespaces"] as string[];

                controllerType = this.GetControllerType(namespaces, controllerName);
            }

            if (controllerType == null)
            {
                controllerType = base.GetControllerType(requestContext, controllerName);
            }

            return controllerType;
        }

        /// <summary>
        /// 根据控制器名称获得控制器类型。
        /// </summary>
        /// <param name="namespaces">控制器名称。</param>
        /// <returns>控制器类型。</returns>
        private Type GetControllerType(string[] namespaces, string controllerName)
        {
            var plugin = PluginManager.Plugins.FirstOrDefault(p => p.InNamespaces(namespaces));

            return plugin?.Items.FirstOrDefault(i => i.Controller.Name == controllerName + "Controller")?.Controller;
        }
    }
}