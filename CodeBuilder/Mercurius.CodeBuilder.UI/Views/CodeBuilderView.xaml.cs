using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Mercurius.CodeBuilder.Core.Events;
using Microsoft.Practices.Prism.PubSubEvents;

namespace Mercurius.CodeBuilder.UI.Views
{
    /// <summary>
    /// CodeBuilderView.xaml 的交互逻辑
    /// </summary>
    public partial class CodeBuilderView : UserControl
    {
        #region 字段

        private readonly EventAggregator _eventAggregator;

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="eventAggregator">时间决策器</param>
        public CodeBuilderView(EventAggregator eventAggregator)
        {
            InitializeComponent();

            this._eventAggregator = eventAggregator;

            var loadedEvent = this._eventAggregator.GetEvent<LoadedTablesCompletedEvent>();

            loadedEvent.Subscribe(
                arg => Application.Current.Dispatcher.BeginInvoke(new Action(() => this.loadingAn.Visibility = Visibility.Collapsed)),
                ThreadOption.BackgroundThread,
                false);
        }

        #endregion
    }
}
