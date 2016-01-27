using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Security.Principal;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Forms;
using System.Windows.Input;
using Mercurius.CodeBuilder.Core;
using Mercurius.CodeBuilder.Core.Database;
using Mercurius.CodeBuilder.Core.Events;
using Microsoft.Practices.Prism.Commands;
using Microsoft.Practices.Prism.Mvvm;
using Microsoft.Practices.Prism.PubSubEvents;
using Microsoft.Practices.ServiceLocation;
using Mercurius.Infrastructure.Ado;
using Application = System.Windows.Application;
using MessageBox = System.Windows.MessageBox;

namespace Mercurius.CodeBuilder.UI.ViewModels
{
    /// <summary>
    /// <para>
    /// 表、表结构显示以及代码生成视图-模型。
    /// </para>
    /// 
    /// <para>
    /// 作者：Fenglinz
    /// 日期：2011-11-11
    /// </para>
    /// </summary>
    public class CodeBuilderViewModel : BindableBase
    {
        #region 字段

        private readonly IEventAggregator _eventAggregator;

        private ICommand _loadedCommand;
        private ICommand _buildingCommand;
        private ICommand _selectFolderCommand;
        private ICommand _createTableDefinitionCommand;

        #endregion

        #region 属性

        public Configuration Configuration { get; private set; }

        #endregion

        #region 命令

        public ICommand LoadedCommand
        {
            get
            {
                return this._loadedCommand = this._loadedCommand ?? new DelegateCommand<string>(arg =>
                {
                    var delAction = new Action(this.FillTableDetails);

                    var asyncResul = delAction.BeginInvoke(ar =>
                    {
                        delAction.EndInvoke(ar);

                        this.Configuration.ReloadLastConfiguration();
                    }, null);
                });
            }
        }

        private void FillTableDetails()
        {
            if (this.Configuration.Tables.Count == 0)
            {
                try
                {
                    var metadata = ServiceLocator.Current.GetInstance<Metadata>(this.Configuration.CurrentDatabase.Type.ToString());

                    if (metadata != null)
                    {
                        metadata.ServerUri = this.Configuration.CurrentDatabase.ServerUri;
                        metadata.Account = this.Configuration.CurrentDatabase.Account;
                        metadata.Password = this.Configuration.CurrentDatabase.Password;

                        var tables = metadata.GetCustomObjects(this.Configuration.CurrentDatabase.Name);

                        foreach (var table in tables)
                        {
                            if (table.Type != CustomObjectType.Procedure)
                            {
                                var detail = metadata.GetTableOrViewDetails(this.Configuration.CurrentDatabase.Name, $"{table.Schema}.{table.Name}", table.Type == CustomObjectType.View);

                                detail.Description = table.Description;

                                Application.Current.Dispatcher.BeginInvoke(new Action(() =>
                                {
                                    this.Configuration.Tables.Add(detail);
                                }));
                            }
                        }
                    }
                }
                catch (Exception e)
                {
                    MessageBox.Show("发生错误，请稍后再试！\n" + e.Message, "错误", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                finally
                {
                    this._eventAggregator.GetEvent<LoadedTablesCompletedEvent>().Publish(true);
                }
            }
        }

        public ICommand CreateTableDefinitionCommand
        {
            get
            {
                if (this._createTableDefinitionCommand == null)
                {
                    this._createTableDefinitionCommand = new DelegateCommand(() =>
                    {
                        var dialog = new SaveFileDialog
                        {
                            Filter = "Excel文件|*.xls",
                            FileName = $"{Configuration.CurrentDatabase.Name}数据库的表结构文档.xls"
                        };

                        if (dialog.ShowDialog() == DialogResult.OK)
                        {
                            try
                            {
                                var tables = (from t in Configuration.Tables
                                              select new Table
                                              {
                                                  Name = t.Name,
                                                  Schema = t.Schema,
                                                  Comments = t.Description,
                                                  Columns = t.Columns.Select(c => new Column
                                                  {
                                                      Name = c.Name,
                                                      DataType = c.SqlType,
                                                      DataLength = c.Length,
                                                      Description = c.Description,
                                                      IsIdentity = c.IsIdentity,
                                                      IsNullable = c.Nullable
                                                  }).ToList()
                                              }).ToList();

                                var export = new ExportTablesDefinition();

                                export.Export(tables, dialog.OpenFile());

                                MessageBox.Show("表定义文档生成成功！", "提示", MessageBoxButton.OK);
                            }
                            catch (Exception e)
                            {
                                MessageBox.Show("出现错误，错误原因：" + e.Message, "错误", MessageBoxButton.OK);
                            }
                        }
                    });
                }

                return this._createTableDefinitionCommand;
            }
        }

        /// <summary>
        /// 生成代码命令。
        /// </summary>
        public ICommand BuildingCommand
        {
            get
            {
                if (this._buildingCommand == null)
                {
                    this._buildingCommand = new DelegateCommand(() =>
                    {
                        if (string.IsNullOrWhiteSpace(this.Configuration.OutputFolder) || !Directory.Exists(this.Configuration.OutputFolder))
                        {
                            MessageBox.Show("请选择代码输出目录！", "提示", MessageBoxButton.OK, MessageBoxImage.Warning);

                            return;
                        }

                        try
                        {
                            var codeCreator =
                                ServiceLocator.Current.GetInstance<AbstractCodeCreator>(this.Configuration.Language);

                            if (codeCreator != null)
                            {
                                codeCreator.Create(this.Configuration);

                                MessageBox.Show("生成完成！", "提示", MessageBoxButton.OK, MessageBoxImage.Information);
                            }
                        }
                        catch (Exception e)
                        {
                            MessageBox.Show("生成不成功，请稍后重试！\n错误详情：" + e.Message, "错误", MessageBoxButton.OK, MessageBoxImage.Error);
                        }
                    });
                }

                return this._buildingCommand;
            }
        }

        /// <summary>
        /// 选择代码生成保存目录的命令。
        /// </summary>
        public ICommand SelectFolderCommand
        {
            get
            {
                if (this._selectFolderCommand == null)
                {
                    this._selectFolderCommand = new DelegateCommand(() =>
                    {
                        var dialog = new FolderBrowserDialog
                        {
                            Description = "选择代码生成保存目录",
                            SelectedPath = this.Configuration.OutputFolder
                        };

                        if (dialog.ShowDialog() == DialogResult.OK)
                        {
                            this.Configuration.OutputFolder = dialog.SelectedPath;
                        }
                    });
                }

                return this._selectFolderCommand;
            }
        }

        #endregion

        #region 构造方法

        public CodeBuilderViewModel(IEventAggregator eventAggregator)
        {
            this._eventAggregator = eventAggregator;

            this.Configuration = new Configuration
            {
                Language = "C#"
            };

            var currentUserName = WindowsIdentity.GetCurrent().Name;

            if (!string.IsNullOrWhiteSpace(currentUserName) && currentUserName.Contains('\\'))
            {
                this.Configuration.Author = currentUserName.Split('\\')[1];
            }

            this._eventAggregator.GetEvent<OpenCodeBuildViewEvent>().Subscribe(arg =>
            {
                this.Configuration.CurrentDatabase = arg;
            });
        }

        #endregion
    }
}
