using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Prime.Core.Configuration
{
    /// <summary>
    /// 
    /// </summary>
    [ConfigurationCollection(typeof(SettingElement), AddItemName = "add")]
    public class SettingElements : ConfigurationElementCollection
    {
        protected override ConfigurationElement CreateNewElement() => new SettingElement();

        protected override object GetElementKey(ConfigurationElement element)
        {
            if (element is SettingElement setting)
            {
                return setting.Key;
            }

            return string.Empty;
        }

        public override string ToString()
        {
            var builder = new StringBuilder();

            if (!this.IsEmpty())
            {
                builder.Append("  设置项列表：\n");

                foreach (var item in this)
                {
                    var setting = item as SettingElement;

                    builder.AppendFormat("    Key：{0}，值：{1}，描述：{2}\n", setting.Key, setting.Value, setting.Description);
                }
            }

            return builder.ToString();
        }
    }

    /// <summary>
    /// 自定义设置项
    /// </summary>
    public class SettingElement : ConfigurationElement
    {
        #region 属性

        /// <summary>
        /// 键
        /// </summary>
        [ConfigurationProperty("key", IsKey = true, IsRequired = true)]
        public string Key { get => base["key"]?.ToString(); set => base["key"] = value; }

        /// <summary>
        /// 值
        /// </summary>
        [ConfigurationProperty("value")]
        public string Value { get => base["value"]?.ToString(); set => base["value"] = value; }

        /// <summary>
        /// 描述
        /// </summary>
        [ConfigurationProperty("description")]
        public string Description { get => base["description"]?.ToString(); set => base["description"] = value; }

        #endregion
    }
}
