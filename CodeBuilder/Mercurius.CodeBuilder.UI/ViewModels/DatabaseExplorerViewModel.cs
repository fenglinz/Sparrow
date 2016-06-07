using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using Mercurius.CodeBuilder.Core;
using Mercurius.CodeBuilder.Core.Database;
using Mercurius.CodeBuilder.Core.Events;
using Mercurius.CodeBuilder.UI.Dialogs;
using Microsoft.Practices.Prism.Commands;
using Microsoft.Practices.Prism.Mvvm;
using Microsoft.Practices.Prism.PubSubEvents;
using Microsoft.Practices.Prism.Regions;
using Microsoft.Practices.ServiceLocation;

namespace Mercurius.CodeBuilder.UI.ViewModels
{
    public class DatabaseExplorerViewModel : BindableBase
    {
        #region 字段

        private readonly IRegionManager _regionManager = null;
        private readonly IEventAggregator _eventAggregator = null;

        private ConnectedDatabaseCollection _connectedDatabases = null;

        private ICommand _addServerCommand = null;
        private ICommand _openConnectedDatabaseCommand = null;
        private ICommand _deleteConnectedDatabaseCommand = null;
        private ICommand _updateConnectedDatabaseCommand = null;

        #endregion

        #region 属性

        /// <summary>
        /// 获取或者设置当前窗体。
        /// </summary>
        public Window CurrentWindow { get; set; }

        #endregion

        #region 数据绑定

        public ConnectedDatabaseCollection ConnectedDatabases
        {
            get
            {
                return this._connectedDatabases;
            }
            set
            {
                if (this._connectedDatabases != value)
                {
                    this._connectedDatabases = value;
                    this.OnPropertyChanged(() => this.ConnectedDatabases);
                }
            }
        }

        #endregion

        #region 命令

        public ICommand AddServerCommand
        {
            get
            {
                return this._addServerCommand = this._addServerCommand ?? new DelegateCommand<MenuItem>(menuItem =>
                {
                    var dialog = ServiceLocator.Current.GetInstance<LogOnServerDialog>();

                    if (dialog != null)
                    {
                        dialog.Owner = Window.GetWindow(menuItem);

                        dialog.ShowDialog();
                    }
                });
            }
        }

        public ICommand OpenConnectedDatabaseCommand
        {
            get
            {
                return this._openConnectedDatabaseCommand = this._openConnectedDatabaseCommand ?? new DelegateCommand<ConnectedDatabase>(arg =>
                {
                    if (arg != null)
                    {
                        try
                        {
                            var viewModel = ServiceLocator.Current.GetInstance<CodeBuilderViewModel>();
                            var view = ServiceLocator.Current.GetInstance<Views.CodeBuilderView>();

                            viewModel.Configuration.CurrentDatabase = arg;
                            view.DataContext = viewModel;

                            if (this._regionManager.Regions["DisplayRegion"].Views != null)
                            {
                                var views = this._regionManager.Regions["DisplayRegion"].Views;

                                foreach (var item in views)
                                {
                                    this._regionManager.Regions["DisplayRegion"].Remove(item);
                                }
                            }

                            this._regionManager.AddToRegion("DisplayRegion", view);
                        }
                        catch (Exception exp)
                        {
                            Application.Current.Dispatcher.Invoke(() =>
                            {
                                MessageBox.Show(Application.Current.MainWindow, $"出现错误，错误详情：{exp.Message}", "错误", MessageBoxButton.OK, MessageBoxImage.Error);
                            });
                        }
                    }
                });
            }
        }

        public ICommand DeleteConnectedDatabaseCommand
        {
            get
            {
                return this._deleteConnectedDatabaseCommand = this._deleteConnectedDatabaseCommand ?? new DelegateCommand<ConnectedDatabase>(arg =>
                {
                    if (arg != null)
                    {
                        if (MessageBox.Show(Application.Current.MainWindow, $"是否要确实删除数据库连接：“{arg.Name}”", "提示", MessageBoxButton.YesNo, MessageBoxImage.Information, MessageBoxResult.Yes) == MessageBoxResult.Yes)
                        {
                            ConnectedDatabaseManager.Remove(arg.Type, arg.Name);

                            var refreshEvent = this._eventAggregator.GetEvent<RefreshConnectedDatabaseEvent>();

                            refreshEvent?.Publish(string.Empty);
                        }
                    }
                });
            }
        }

        public ICommand UpdateConnectedDatabaseCommand
        {
            get
            {
                return this._updateConnectedDatabaseCommand = this._updateConnectedDatabaseCommand ?? new DelegateCommand<ConnectedDatabase>(arg =>
                {
                    if (arg != null)
                    {
                        var dialog = ServiceLocator.Current.GetInstance<LogOnServerDialog>();

                        if (dialog != null)
                        {
                            var vm = dialog.DataContext as LogonServerViewModel;

                            if (vm != null)
                            {
                                vm.Database = arg.Type;
                                vm.ServerUri = arg.ServerUri;
                                vm.Account = arg.Account;
                                vm.Password = arg.Password;
                                vm.SelectedDatabase = arg.Name;
                                vm.UpdateDababaseType = arg.Type;
                                vm.UpdateName = arg.Name;
                            }

                            dialog.ShowDialog();
                        }
                    }
                });
            }
        }

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="regionManager">区域管理器</param>
        /// <param name="eventAggregator">事件管理器</param>
        public DatabaseExplorerViewModel(IRegionManager regionManager, IEventAggregator eventAggregator)
        {
            this._regionManager = regionManager;
            this._eventAggregator = eventAggregator;
            var refreshEvent = this._eventAggregator.GetEvent<RefreshConnectedDatabaseEvent>();

            if (refreshEvent != null)
            {
                refreshEvent.Subscribe(args =>
                {
                    this.ConnectedDatabases = ConnectedDatabaseManager.GetConnectedDatabases();
                });
            }

            this.ConnectedDatabases = ConnectedDatabaseManager.GetConnectedDatabases();
        }

        #endregion
    }
}
