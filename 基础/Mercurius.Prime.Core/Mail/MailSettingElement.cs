using System.Configuration;

namespace Mercurius.Prime.Core.Mail
{
    /// <summary>
    /// 邮件配置项。
    /// </summary>
    public class MailSettingElement : ConfigurationElement
    {
        #region 属性

        /// <summary>
        /// 邮件设置主键。
        /// </summary>
        [ConfigurationProperty("key", IsRequired = true, IsKey = true)]
        public string Key
        {
            get { return (string)base["key"]; }
            set { base["key"] = value; }
        }

        /// <summary>
        /// 邮件服务器地址。
        /// </summary>
        [ConfigurationProperty("host", IsRequired = true)]
        public string Host
        {
            get { return (string)base["host"]; }
            set { base["host"] = value; }
        }

        /// <summary>
        /// SMTP事务端口。
        /// </summary>
        [ConfigurationProperty("port", DefaultValue = 25)]
        public int Port
        {
            get { return (int)base["port"]; }
            set { base["port"] = value; }
        }

        /// <summary>
        /// 发件人身份凭据账户。
        /// </summary>
        [ConfigurationProperty("account")]
        public string Account
        {
            get { return (string)base["account"]; }
            set { base["account"] = value; }
        }

        /// <summary>
        /// 发件人身份凭据密码。
        /// </summary>
        [ConfigurationProperty("password")]
        public string Password
        {
            get { return (string)base["password"]; }
            set { base["password"] = value; }
        }

        /// <summary>
        /// 是否为外部邮箱。
        /// </summary>
        [ConfigurationProperty("isInnerEmail", DefaultValue = false)]
        public bool IsInnerEmail
        {
            get { return (bool)base["isInnerEmail"]; }
            set { base["isInnerEmail"] = value; }
        }

        #endregion
    }
}
