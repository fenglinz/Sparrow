using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using Mercurius.CodeBuilder.Core.Events;
using Prism.Events;

namespace Mercurius.CodeBuilder.UI.Views
{
    /// <summary>
    /// CodeBuilderView.xaml 的交互逻辑
    /// </summary>
    public partial class CodeBuilderView2 : UserControl
    {
        #region 字段

        private readonly EventAggregator _eventAggregator;

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="eventAggregator">时间决策器</param>
        public CodeBuilderView2(EventAggregator eventAggregator)
        {
            InitializeComponent();

            this.buildNotify.Visibility = Visibility.Collapsed;

            ReMoveNotify();

            this.SizeChanged += (s, e) => ReMoveNotify();
            this._eventAggregator = eventAggregator;

            var buildEvent = this._eventAggregator.GetEvent<BuildEvent>();

            buildEvent.Subscribe(arg => Application.Current.Dispatcher.BeginInvoke(new Action(() =>
            {
                switch (arg.Status)
                {
                    case Status.Begin:
                        this.txtSearch.IsEnabled = false;
                        this.buildNotify.Visibility = Visibility.Visible;

                        break;

                    case Status.Success:
                    case Status.Failure:
                        this.txtSearch.IsEnabled = true;
                        this.buildNotify.Visibility = Visibility.Collapsed;

                        break;
                }

                if (!string.IsNullOrWhiteSpace(arg.Message))
                {
                    this.buildMessage.Text = arg.Message;
                }
            })), ThreadOption.BackgroundThread, false);
        }

        #endregion

        #region 私有方法

        private void ReMoveNotify()
        {
            var left = this.busyPath.Margin.Left;
            var top = (Application.Current.MainWindow.ActualHeight - 220) / 2;
            var right = this.busyPath.Margin.Right;
            var bottom = this.busyPath.Margin.Bottom;

            this.busyPath.Margin = new Thickness(left, top, right, bottom);
        }

        #endregion
    }
}
