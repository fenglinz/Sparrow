﻿using System;

namespace Mercurius.Kernel.WebCores.Filters
{
    /// <summary>
    /// 忽略权限认证的标记。
    /// </summary>
    [AttributeUsage(AttributeTargets.Method, Inherited = false)]
    public class IgnorePermissionValidAttribute : Attribute
    {
    }
}