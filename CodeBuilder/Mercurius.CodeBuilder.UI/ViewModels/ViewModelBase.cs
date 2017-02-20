using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using Mercurius.CodeBuilder.Core.Events;
using Mercurius.Prime.Core;
using Prism.Mvvm;

namespace Mercurius.CodeBuilder.UI.ViewModels
{
    /// <summary>
    /// 视图-视图模型基类。
    /// </summary>
    public abstract class ViewModelBase : BindableBase
    {
        #region 字段

        private readonly BuildEvent _buildEvent;

        #endregion

        #region 受保护方法

        /// <summary>
        /// 显示消息对话框。
        /// </summary>
        /// <param name="message">消息内容</param>
        /// <param name="icon">提示图标</param>
        /// <param name="caption">消息对话框的标题</param>
        protected void ShowMessage(string message,
            MessageBoxImage icon = MessageBoxImage.Information, string caption = null)
        {
            if (caption.IsNullOrWhiteSpace())
            {
                switch (icon)
                {
                    case MessageBoxImage.Information:
                        caption = "提示";

                        break;

                    case MessageBoxImage.Warning:
                        caption = "警告";

                        break;

                    case MessageBoxImage.Question:
                        caption = "询问";

                        break;

                    case MessageBoxImage.Error:
                        caption = "错误";

                        break;
                }
            }

            MessageBox.Show(Application.Current.MainWindow, message, caption, MessageBoxButton.OK, icon);
        }

        /// <summary>
        /// 确认对话框。
        /// </summary>
        /// <param name="message">消息内容</param>
        /// <param name="caption">对话框标题</param>
        /// <returns>选择结果</returns>
        protected MessageBoxResult Confirm(string message, string caption)
        {
            return MessageBox.Show(Application.Current.MainWindow, message, caption, MessageBoxButton.OKCancel, MessageBoxImage.Question);
        }

        #endregion
    }
}
