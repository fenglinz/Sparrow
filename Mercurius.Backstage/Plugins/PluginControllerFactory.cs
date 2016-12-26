using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Mercurius.Backstage.Extensions
{
    public class PluginControllerFactory: DefaultControllerFactory
    {
        protected override Type GetControllerType(RequestContext requestContext, string controllerName)
        {
            string pluginName = string.Empty;
            Type controllerType = null;

            if (requestContext.RouteData.Values.ContainsKey("pluginName"))
            {
                pluginName = requestContext.RouteData.GetRequiredString("pluginName");
                controllerType = this.GetControllerType(pluginName, controllerName);
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
        /// <param name="controllerName">控制器名称。</param>
        /// <returns>控制器类型。</returns>
        private Type GetControllerType(string pluginName, string controllerName)
        {
            var plugin = AppDomain.CurrentDomain.GetAssemblies().FirstOrDefault(a => a.GetName().Name == pluginName);
            var controlName = controllerName + "Controller";
            var control = plugin.GetTypes().FirstOrDefault(p => p.Name == controlName); ;

            if (control != null)
            {
                return control;
            }

            return null;
        }
    }
}