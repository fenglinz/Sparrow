using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Input;
using Mercurius.CodeBuilder.Core;
using Mercurius.CodeBuilder.Core.Database;
using Mercurius.CodeBuilder.Core.Events;
using Microsoft.Practices.Prism.Commands;
using Microsoft.Practices.Prism.Mvvm;
using Microsoft.Practices.Prism.PubSubEvents;
using Microsoft.Practices.Prism.Regions;
using Microsoft.Practices.ServiceLocation;

namespace Mercurius.CodeBuilder.UI.ViewModels
{
    /// <summary>
    /// <para>
    /// 连接数据库服务器视图-模型。
    /// </para>
    /// 
    /// <para>
    /// 作者：Fenglinz
    /// 日期：2011-11-10
    /// </para>
    /// </summary>
    public class LogonServerViewModel : BindableBase
    {
        #region 字段

        private DatabaseType _database = default(DatabaseType);
        private string _serverUri = string.Empty;
        private string _account = string.Empty;
        private string _password = string.Empty;

        private ICommand _confirmCommand = null;
        private ICommand _cancleCommand = null;
        private ICommand _selectDatabaseCommand = null;

        private IRegionManager _regionManager = null;
        private IEventAggregator _eventAggregator = null;

        #endregion

        #region 属性

        /// <summary>
        /// 获取或者设置当前窗体。
        /// </summary>
        public Window CurrentWindow { get; set; }

        /// <summary>
        /// 需要更新的类型。
        /// </summary>
        public DatabaseType UpdateDababaseType { get; set; }

        /// <summary>
        /// 需要更新的数据库。
        /// </summary>
        public string UpdateName { get; set; }

        #endregion

        #region 绑定相关的属性

        public DatabaseType Database
        {
            get { return this._database; }
            set
            {
                if (this._database != value)
                {
                    this._database = value;
                    this.OnPropertyChanged(() => this.Database);
                }
            }
        }

        public string ServerUri
        {
            get { return this._serverUri; }
            set
            {
                if (this._serverUri != value)
                {
                    this._serverUri = value;
                    this.OnPropertyChanged(() => this.ServerUri);
                }
            }
        }

        public string Account
        {
            get { return this._account; }
            set
            {
                if (this._account != value)
                {
                    this._account = value;
                    this.OnPropertyChanged(() => this.Account);
                }
            }
        }

        public string Password
        {
            get { return this._password; }
            set
            {
                if (this._password != value)
                {
                    this._password = value;
                    this.OnPropertyChanged(() => this.Password);
                }
            }
        }

        public IList<string> Databases { get; set; }

        public string SelectedDatabase { get; set; }

        #endregion

        #region 命令

        public ICommand SelectDatabaseCommand
        {
            get
            {
                return this._selectDatabaseCommand = this._selectDatabaseCommand ?? new DelegateCommand(() =>
                {
                    var metadata = ServiceLocator.Current.GetInstance<Metadata>(this.Database.ToString());

                    if (metadata != null)
                    {
                        metadata.ServerUri = this.ServerUri;
                        metadata.Account = this.Account;
                        metadata.Password = this.Password;

                        try
                        {
                            this.Databases = metadata.GetDatabaseNames();

                            this.OnPropertyChanged(() => this.Databases);
                        }
                        catch
                        {
                            MessageBox.Show("数据库连接失败，请重试！", "错误", MessageBoxButton.OK, MessageBoxImage.Error);
                        }
                    }
                });
            }
        }

        /// <summary>
        /// 确定添加数据库连接命令。
        /// </summary>
        public ICommand ConfirmCommand
        {
            get
            {
                if (this._confirmCommand == null)
                {
                    this._confirmCommand = new DelegateCommand(() =>
                    {
                        if (string.IsNullOrWhiteSpace(this.SelectedDatabase))
                        {
                            MessageBox.Show("请选择一个数据库！", "提醒", MessageBoxButton.OK, MessageBoxImage.Information);
                        }
                        else
                        {
                            var tEvent = this._eventAggregator.GetEvent<OpenCodeBuildViewEvent>();

                            if (tEvent != null)
                            {
                                var connectedDatabase = new ConnectedDatabase
                                {
                                    Name = this.SelectedDatabase,
                                    Type = this.Database,
                                    ServerUri = this.ServerUri,
                                    Account = this.Account,
                                    Password = this.Password
                                };

                                if (!string.IsNullOrWhiteSpace(this.UpdateName))
                                {
                                    ConnectedDatabaseManager.Remove(this.UpdateDababaseType, this.UpdateName);
                                }

                                ConnectedDatabaseManager.SaveOrUpdate(connectedDatabase);

                                tEvent.Publish(connectedDatabase);

                                var refreshEvent = this._eventAggregator.GetEvent<RefreshConnectedDatabaseEvent>();

                                if (refreshEvent != null)
                                {
                                    refreshEvent.Publish(string.Empty);
                                }
                            }

                            this.CurrentWindow.Close();
                        }
                    });
                }

                return this._confirmCommand;
            }
        }

        /// <summary>
        /// 获取关闭应用程序命令。
        /// </summary>
        public ICommand CancleCommand
        {
            get
            {
                if (this._cancleCommand == null)
                {
                    this._cancleCommand = new DelegateCommand(() =>
                    {
                        this.CurrentWindow.Close();
                    });
                }

                return this._cancleCommand;
            }
        }

        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        public LogonServerViewModel(IRegionManager regionManager, IEventAggregator eventArggregator)
        {
            this._regionManager = regionManager;
            this._eventAggregator = eventArggregator;
        }

        #endregion
    }
}
