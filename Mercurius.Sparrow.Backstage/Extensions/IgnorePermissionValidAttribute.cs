using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mercurius.Sparrow.Mvc.Extensions
{
    /// <summary>
    /// 忽略权限认证的标记。
    /// </summary>
    [Serializable]
    [AttributeUsage(AttributeTargets.Method, Inherited = false)]
    public class IgnorePermissionValidAttribute : Attribute
    {
    }
}