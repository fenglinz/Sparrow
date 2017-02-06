using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using Mercurius.Prime.Core;

namespace Mercurius.Kernel.WebCores.Plugins
{
    /// <summary>
    /// 插件信息。
    /// </summary>
    public class Plugin
    {
        #region 属性

        /// <summary>
        /// 插件所在的程序集。
        /// </summary>
        public Assembly Assembly { get; set; }

        /// <summary>
        /// 名称。
        /// </summary>
        public string PluginName { get; set; }

        /// <summary>
        /// 描述信息。
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// IBatisNet SqlMap配置文件地址。
        /// </summary>
        public string IBatisNetSqlMapConfigPath { get; set; }

        /// <summary>
        /// 插件项集合信息。
        /// </summary>
        public IList<PluginItem> Items { get; set; }

        /// <summary>
        /// 插件的命名空间集合。
        /// </summary>
        public IList<string> Namespaces { get; set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        public Plugin()
        {
            this.Items = new List<PluginItem>();
            this.Namespaces = new List<string>();
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 添加插件项信息。
        /// </summary>
        /// <param name="item">插件项信息</param>
        public void AddItem(PluginItem item)
        {
            this.Items.Add(item);

            if (item.Controller != null)
            {
                if (!this.Namespaces.Contains(item.Controller.Namespace))
                {
                    this.Namespaces.Add(item.Controller.Namespace);
                }
            }
        }

        /// <summary>
        /// 命名空间是否已存在。
        /// </summary>
        /// <param name="items">命名空间</param>
        /// <returns>是否已存在</returns>
        public bool InNamespaces(IEnumerable<string> items)
        {
            if (this.Namespaces.IsEmpty())
            {
                return false;
            }

            foreach (var ns in this.Namespaces)
            {
                foreach (var item in items)
                {
                    var rs = ns == item;

                    if (rs)
                    {
                        return true;
                    }
                }
            }

            return false;
        }

        #endregion
    }
}