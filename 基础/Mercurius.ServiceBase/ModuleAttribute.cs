using System;

namespace Mercurius.ServiceBase
{
    /// <summary>
    /// 模块描述属性。
    /// </summary>
    [AttributeUsage(AttributeTargets.Class,
        AllowMultiple = false,
        Inherited = false)]
    public class ModuleAttribute : Attribute
    {
        #region 属性

        /// <summary>
        /// 模块名称。
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 模块描述。
        /// </summary>
        public string Description { get; set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="name">模块名称</param>
        public ModuleAttribute(string name)
        {
            this.Name = name;
        }

        #endregion
    }
}