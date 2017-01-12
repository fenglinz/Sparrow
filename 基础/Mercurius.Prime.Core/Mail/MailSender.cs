using System;
using System.Collections.Generic;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace Mercurius.Prime.Core.Mail
{
    /// <summary>
    /// 电子邮件发送器。
    /// </summary>
    [Serializable]
    public class MailSender
    {
        #region 字段

        private static MailSettingCollection _mailSettings = null;

        #endregion

        #region 属性

        /// <summary>
        /// 邮件发送者。
        /// </summary>
        public string From { get; set; }

        /// <summary>
        /// 邮件接收者。
        /// </summary>
        public string To { get; set; }

        /// <summary>
        /// 邮件抄送者。
        /// </summary>
        public string CC { get; set; }

        /// <summary>
        /// 邮件密送者。
        /// </summary>
        public string Bcc { get; set; }

        /// <summary>
        /// 邮件标题。
        /// </summary>
        public string Subject { get; set; }

        /// <summary>
        /// 邮件正文。
        /// </summary>
        public string Body { get; set; }

        /// <summary>
        /// 邮件附件列表。
        /// </summary>
        public IList<Attachment> Attachments { get; set; }

        #endregion

        #region 构造方法

        /// <summary>
        /// 静态构造方法。
        /// </summary>
        static MailSender()
        {
            var section = ConfigurationManager.GetSection("mail") as MailSettingSection;

            if (section != null)
            {
                _mailSettings = section.MailSettings;
            }
        }

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="from">邮件发送者</param>
        /// <param name="to">邮件接收者</param>
        public MailSender(string from, string to)
        {
            this.From = from;
            this.To = to;

            this.Attachments = new List<Attachment>();
        }

        #endregion

        #region 隐式转换

        /// <summary>
        /// 将电子邮件信息实体隐式转换为System.Net.Mail.MailMessage类型的对象。
        /// </summary>
        /// <param name="sender">电子邮件信息</param>
        /// <returns>System.Net.Mail.MailMessage类型的对象</returns>
        public static explicit operator MailMessage(MailSender sender)
        {
            if (sender == null)
            {
                throw new ArgumentNullException("sender");
            }

            var mailMessage = new MailMessage
            {
                From = new MailAddress(sender.From),
                Subject = sender.Subject,
                Body = sender.Body,
                IsBodyHtml = true,
                Priority = MailPriority.High,
                SubjectEncoding = Encoding.UTF8,
                BodyEncoding = Encoding.UTF8,
            };

            mailMessage.To.Add(sender.To);

            if (!string.IsNullOrWhiteSpace(sender.CC))
            {
                mailMessage.CC.Add(sender.CC);
            }

            if (!string.IsNullOrWhiteSpace(sender.Bcc))
            {
                mailMessage.Bcc.Add(sender.Bcc);
            }

            foreach (var attachment in sender.Attachments)
            {
                mailMessage.Attachments.Add(attachment);
            }

            return mailMessage;
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 发送邮件。
        /// </summary>
        public void SendMail()
        {
            if (_mailSettings == null)
            {
                return;
            }

            var key = this.From.Split('@')[1];
            var mailSetting = _mailSettings[key];

            if (mailSetting == null)
            {
                return;
            }

            var mailMessage = (MailMessage)this;

            var smtp = new SmtpClient
            {
                Host = mailSetting.Host
            };

            if (!mailSetting.IsInnerEmail)
            {
                smtp.Port = mailSetting.Port;
                smtp.Credentials = new NetworkCredential(mailSetting.Account, mailSetting.Password);
            }

            try
            {
                smtp.SendAsync(mailMessage, null);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        #endregion
    }
}
