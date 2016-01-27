using System.Configuration;

namespace Mercurius.Infrastructure.Mail
{
    /// <summary>
    /// 邮件配置项集合。
    /// </summary>
    public class MailSettingCollection : ConfigurationElementCollection
    {
        #region 索引

        /// <summary>
        /// 邮件配置信息索引。
        /// </summary>
        /// <param name="index">索引</param>
        /// <returns>邮件配置信息</returns>
        public MailSettingElement this[int index]
        {
            get
            {
                return (MailSettingElement)this.BaseGet(index);
            }

            set
            {
                if (this.BaseGet(index) != null)
                {
                    this.BaseRemoveAt(index);
                }

                this.BaseAdd(index, value);
            }
        }

        /// <summary>
        /// 根据Key获取邮件配置信息。
        /// </summary>
        /// <param name="key">Key值</param>
        /// <returns>邮件配置信息</returns>
        public new MailSettingElement this[string key]
        {
            get { return (MailSettingElement)this.BaseGet(key); }
        }

        #endregion

        #region MailSettingCollection重写

        /// <summary>
        /// 创建新的邮件配置项。
        /// </summary>
        /// <returns>邮件配置项</returns>
        protected override ConfigurationElement CreateNewElement()
        {
            return new MailSettingElement();
        }

        /// <summary>
        /// 获取元素主键。
        /// </summary>
        /// <param name="element">元素</param>
        /// <returns>主键</returns>
        protected override object GetElementKey(ConfigurationElement element)
        {
            return ((MailSettingElement)element).Key;
        }

        #endregion
    }
}
