using System.Configuration;

namespace Mercurius.Infrastructure.Mail
{
    /// <summary>
    /// 邮件信息配置节。
    /// </summary>
    public class MailSettingSection : ConfigurationSection
    {
        /// <summary>
        /// 获取邮件配置信息集合。
        /// </summary>
        [ConfigurationProperty("settings")]
        public MailSettingCollection MailSettings
        {
            get { return (MailSettingCollection)base["settings"]; }
        }
    }
}
