using System;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;
using System.Security.Principal;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Data;
using System.Windows.Forms;
using System.Windows.Input;
using System.Xml.Linq;
using Mercurius.CodeBuilder.Core;
using Mercurius.CodeBuilder.Core.Database;
using Mercurius.CodeBuilder.Core.Events;
using Microsoft.Practices.ServiceLocation;
using Prism.Commands;
using Prism.Events;
using static System.Configuration.ConfigurationManager;
using Mercurius.CodeBuilder.DbMetadata.MSSQL;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Ado;
using Mercurius.Prime.DataProcess.Excel;
using Application = System.Windows.Application;
using Mercurius.CodeBuilder.UI.Themes;
using BuildConfiguration = Mercurius.CodeBuilder.Core.Configuration;

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
    public class CodeBuilderViewModel2 : ViewModelBase
    {
        #region 字段

        private readonly IEventAggregator _eventAggregator;

        private readonly BuildEvent _buildEvent;

        private string _selectAllText = "全选";
        private string _searchText = "";
        private bool _searchTextChanged = false;

        private ICommand _loadedCommand;
        private ICommand _buildingCommand;
        private ICommand _selectProjectFolderCommand;
        private ICommand _selectEntityProjectFileCommand;
        private ICommand _selectContractProjectFileCommand;
        private ICommand _selectServiceProjectFileCommand;
        private ICommand _initializeProjectCommand;
        private ICommand _createTableDefinitionCommand;
        private ICommand _buildingDatabaseScriptsCommand;
        private ICommand _selectAllCommand;
        private ICommand _searchCommand;

        #endregion

        #region 属性
         
        public BuildConfiguration Configuration { get; }

        public ObservableCollection<DbTable> Tables { get; set; }

        public string ProjectFileLabel1 { get; set; } = "接口定义项目：";

        public string ProjectFileLabel2 { get; set; } = "接口实现项目：";

        public string ProjectFileLabel3 { get; set; } = "插件实现项目：";

        public string SelectAllText
        {
            get { return this._selectAllText; }
            set
            {
                if (this._selectAllText != value)
                {
                    this._selectAllText = value;
                    this.RaisePropertyChanged(nameof(SelectAllText));
                }
            }
        }

        public string SearchText
        {
            get { return this._searchText; }
            set
            {
                if (this._searchText != value.Trim())
                {
                    this._searchText = value.Trim();
                    this._searchTextChanged = true;
                    this.RaisePropertyChanged(nameof(SearchText));
                }
            }
        }

        #endregion

        #region 命令

        /// <summary>
        /// 窗体加载处理。
        /// </summary>
        public ICommand LoadedCommand
        {
            get
            {
                return this._loadedCommand = this._loadedCommand ?? new DelegateCommand<string>(arg =>
                {
                    if (Application.Current.MainWindow is MercuriusWindow shell)
                    {
                        shell.SubTitle = $"当前数据库为：{this.Configuration.CurrentDatabase.Name}({this.Configuration.CurrentDatabase.Type})";
                    }

                    this.Configuration.ReloadLastConfiguration();

                    var delAction = new Action(this.FillTableDetails);

                    delAction.BeginInvoke(ar =>
                    {
                        delAction.EndInvoke(ar);

                        this.Configuration.ReloadLastTablesConfiguration(item => this.Tables.Add(item));
                    }, null);
                });
            }
        }

        /// <summary>
        /// 加载项目的命令。
        /// </summary>
        public ICommand InitializeProjectCommand
        {
            get
            {
                return this._initializeProjectCommand ??
                    (this._initializeProjectCommand = new DelegateCommand(() =>
                    {
                        if (!File.Exists(@"Projects\CSharp.zip"))
                        {
                            ShowMessage("请在应用程序的Projects文件夹中存入CSharp.zip基础项目文件。", MessageBoxImage.Warning, "警告");

                            return;
                        }

                        if (string.IsNullOrWhiteSpace(this.Configuration.BaseNamespace))
                        {
                            ShowMessage("请输入命名空间！", MessageBoxImage.Warning);

                            return;
                        }

                        var codeCreator = ServiceLocator.Current.GetInstance<AbstractCodeCreator>(this.Configuration.Language);

                        if (codeCreator != null)
                        {
                            var task = new Task(() =>
                            {
                                codeCreator.Initialize(this.Configuration);
                            });

                            task.Start();
                            task.ContinueWith(t =>
                            {
                                ShowMessage("初始化完成!");
                            });
                        }
                    }));
            }
        }

        /// <summary>
        /// 生成表定义文档命令。
        /// </summary>
        public ICommand CreateTableDefinitionCommand
        {
            get
            {
                return this._createTableDefinitionCommand ??
                       (this._createTableDefinitionCommand = new DelegateCommand(() =>
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
                                                         IsPrimaryKey = c.IsPrimaryKey,
                                                         IsIdentity = c.IsIdentity,
                                                         IsNullable = c.Nullable
                                                     }).ToList()
                                                 }).ToList();

                                   var export = new ExportTablesDefinition();

                                   export.Export(tables, dialog.OpenFile());

                                   ShowMessage("表定义文档生成成功！");
                               }
                               catch (Exception e)
                               {
                                   this._buildEvent.Publish(new BuildEventArg(Status.Failure));
                                   ShowMessage("出现错误，错误原因：" + e.Message, MessageBoxImage.Error);
                               }
                           }
                       }));
            }
        }

        /// <summary>
        /// 生成代码命令。
        /// </summary>
        public ICommand BuildingCommand
        {
            get
            {
                return this._buildingCommand ?? (this._buildingCommand = new DelegateCommand(() =>
                {
                    if (string.IsNullOrWhiteSpace(this.Configuration.BaseNamespace))
                    {
                        ShowMessage("请输入命名空间！", MessageBoxImage.Warning);

                        return;
                    }

                    try
                    {
                        var codeCreator = ServiceLocator.Current.GetInstance<AbstractCodeCreator>(this.Configuration.Language);

                        if (codeCreator != null)
                        {
                            var buildEvent = this._eventAggregator?.GetEvent<BuildEvent>();

                            buildEvent?.Publish(new BuildEventArg(Status.Begin, "开始生成代码，请稍后..."));

                            var task = new Task(() =>
                            {
                                codeCreator.Create(this.Configuration);
                                buildEvent?.Publish(new BuildEventArg(Status.Success, "代码生成完成！"));
                            });

                            task.Start();
                            task.ContinueWith(t =>
                            {
                                Application.Current.Dispatcher.Invoke(() =>
                                {
                                    ShowMessage("生成完成！");
                                });
                            });

                        }
                    }
                    catch (Exception e)
                    {
                        this._buildEvent.Publish(new BuildEventArg(Status.Failure));
                        ShowMessage("生成不成功，请稍后重试！\n错误详情：" + e.Message, MessageBoxImage.Error);
                    }
                }));
            }
        }

        /// <summary>
        /// 生成数据库脚本命令。
        /// </summary>
        public ICommand BuildingDatabaseScriptsCommand
        {
            get
            {
                return this._buildingDatabaseScriptsCommand ?? (this._buildingDatabaseScriptsCommand = new DelegateCommand(() =>
                {
                    var db = this.Configuration.CurrentDatabase;

                    if (db.Type != DatabaseType.MSSQL)
                    {
                        ShowMessage("提示：暂不支持SQL Server以外的数据库脚本导出！");

                        return;
                    }

                    var dialog = new FolderBrowserDialog
                    {
                        Description = "选择数据库脚本保存目录"
                    };

                    if (dialog.ShowDialog() == DialogResult.OK)
                    {
                        var buildEvent = this._eventAggregator?.GetEvent<BuildEvent>();

                        try
                        {
                            buildEvent?.Publish(new BuildEventArg(Status.Begin, "开始导出脚本，请稍后..."));

                            var task = new Task(() =>
                            {
                                var dbHelper = DbHelperCreator.Create(DatabaseType.MSSQL, db.ServerUri, db.Name, db.Account, db.Password);
                                var scripter = new MSSQLDatabaseScriptExporter(dbHelper);

                                scripter.Export(dialog.SelectedPath);
                                buildEvent?.Publish(new BuildEventArg(Status.Success, "脚本导出完成！"));
                            });

                            task.Start();
                            task.ContinueWith(t =>
                            {
                                Application.Current.Dispatcher.Invoke(() =>
                                {
                                    ShowMessage("数据库脚本生成成功！");
                                });
                            });
                        }
                        catch (Exception e)
                        {
                            buildEvent?.Publish(new BuildEventArg(Status.Failure));
                            Application.Current.Dispatcher.Invoke(() =>
                            {
                                ShowMessage("出现错误，错误原因：" + e.Message, MessageBoxImage.Error);
                            });
                        }
                    }
                }));
            }
        }

        public ICommand SelectProjectFolderCommand
        {
            get
            {
                return this._selectProjectFolderCommand ?? (this._selectProjectFolderCommand = new DelegateCommand(() =>
                {
                    var dialog = new FolderBrowserDialog { Description = "选择Java项目的源代码目录" };

                    if (Directory.Exists(this.Configuration.OutputFolder))
                    {
                        dialog.SelectedPath = this.Configuration.OutputFolder;
                    }

                    if (dialog.ShowDialog() == DialogResult.OK)
                    {
                        this.Configuration.OutputFolder = dialog.SelectedPath;
                    }
                }));
            }
        }

        /// <summary>
        /// 选择实体代码生成保存目录的命令。
        /// </summary>
        public ICommand SelectEntityProjectFileCommand
        {
            get
            {
                return this._selectEntityProjectFileCommand ?? (this._selectEntityProjectFileCommand = new DelegateCommand(() =>
                {
                    var dialog = new OpenFileDialog
                    {
                        Filter = "工程文件|*.csproj",
                        CheckFileExists = true,
                        Multiselect = false,
                        Title = $"选择{this.ProjectFileLabel1?.Replace("：", "")}"
                    };

                    if (dialog.ShowDialog() == DialogResult.OK)
                    {
                        this.Configuration.EntityProjectFile = dialog.FileName;
                        this.Configuration.EntityBaseNamespace = this.GetRootNamespace(dialog.FileName);
                    }
                }));
            }
        }

        /// <summary>
        /// 选择代码生成保存目录的命令。
        /// </summary>
        public ICommand SelectContractProjectFileCommand
        {
            get
            {
                return this._selectContractProjectFileCommand ?? (this._selectContractProjectFileCommand = new DelegateCommand(() =>
                {
                    var dialog = new OpenFileDialog
                    {
                        Filter = "工程文件|*.csproj",
                        CheckFileExists = true,
                        Multiselect = false,
                        Title = $"选择{this.ProjectFileLabel2?.Replace("：", "")}"
                    };

                    if (dialog.ShowDialog() == DialogResult.OK)
                    {
                        this.Configuration.ContractProjectFile = dialog.FileName;
                        this.Configuration.ContractBaseNamespace = this.GetRootNamespace(dialog.FileName);
                    }
                }));
            }
        }

        /// <summary>
        /// 选择代码生成保存目录的命令。
        /// </summary>
        public ICommand SelectServiceProjectFileCommand
        {
            get
            {
                return this._selectServiceProjectFileCommand ?? (this._selectServiceProjectFileCommand = new DelegateCommand(() =>
                {
                    var dialog = new OpenFileDialog
                    {
                        Filter = "工程文件|*.csproj",
                        CheckFileExists = true,
                        Multiselect = false,
                        Title = $"选择{this.ProjectFileLabel3?.Replace("：", "")}"
                    };

                    if (dialog.ShowDialog() == DialogResult.OK)
                    {
                        this.Configuration.ServiceProjectFile = dialog.FileName;
                        this.Configuration.ServiceBaseNamespace = this.GetRootNamespace(dialog.FileName);
                    }
                }));
            }
        }

        public ICommand SelectAllCommand
        {
            get
            {
                return this._selectAllCommand ?? (this._selectAllCommand = new DelegateCommand(() =>
                {
                    if (this._selectAllText == "全选")
                    {
                        this.SelectAllText = "全不选";
                        Configuration.Tables.ForEach(t => t.IsEnabled = true);
                    }
                    else
                    {
                        this.SelectAllText = "全选";
                        Configuration.Tables.ForEach(t => t.IsEnabled = false);
                    }
                }));
            }
        }

        public ICommand SearchCommand
        {
            get
            {
                return this._searchCommand ?? (this._searchCommand = new DelegateCommand(() =>
                {
                    if (this._searchTextChanged)
                    {
                        this._searchTextChanged = false;

                        this.SelectAllText = "全选";
                        this.Configuration.Tables.Clear();
                        this.Tables.ForEach(t => t.IsEnabled = false);

                        if (string.IsNullOrWhiteSpace(this.SearchText))
                        {
                            this.Configuration.Tables.AddRange(this.Tables);
                        }
                        else
                        {
                            this.Configuration.Tables.AddRange(this.Tables.Where(t => t.Name?.ToLower().Contains(this.SearchText.ToLower()) == true || t.Description?.ToLower().Contains(this.SearchText.ToLower()) == true));
                        }
                    }
                }));
            }
        }
        #endregion

        #region 构造方法

        /// <summary>
        /// 构造方法。
        /// </summary>
        /// <param name="eventAggregator">事件分发器</param>
        public CodeBuilderViewModel2(IEventAggregator eventAggregator)
        {
            this._eventAggregator = eventAggregator;
            this._buildEvent = eventAggregator.GetEvent<BuildEvent>();
            this.Tables = new ObservableCollection<DbTable>();

            this.Configuration = new BuildConfiguration
            {
                Language = "C#",
                OrmMiddleware = "Dapper",
                CopyrightOwner = AppSettings["copyright"],
                BaseNamespace = AppSettings["DefaultNamespace"]
            };

            this.Configuration.PropertyChanged += (sender, e) =>
            {
                if (e.PropertyName == "OrmMiddleware")
                {
                    var config = sender as BuildConfiguration;

                    if (config?.OrmMiddleware == "Dapper")
                    {
                        this.ProjectFileLabel1 = "接口定义项目：";
                        this.ProjectFileLabel2 = "接口实现项目：";
                        this.ProjectFileLabel3 = "插件实现项目";
                    }
                    else
                    {
                        this.ProjectFileLabel1 = "接口定义项目：";
                        this.ProjectFileLabel2 = "接口实现项目：";
                        this.ProjectFileLabel3 = "插件实现项目：";
                    }

                    this.RaisePropertyChanged(nameof(ProjectFileLabel1));
                    this.RaisePropertyChanged(nameof(ProjectFileLabel2));
                    this.RaisePropertyChanged(nameof(ProjectFileLabel3));
                }
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

        #region 私有方法

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
                        metadata.Port = this.Configuration.CurrentDatabase.Port;

                        var tables = metadata.GetCustomObjects(this.Configuration.CurrentDatabase.Name);

                        foreach (var table in tables)
                        {
                            if (table.Type != CustomObjectType.Procedure)
                            {
                                var currentDatabaseType = this.Configuration.CurrentDatabase.Type;
                                var detail = metadata.GetTableOrViewDetails(this.Configuration.CurrentDatabase.Name, (currentDatabaseType == DatabaseType.MySQL || currentDatabaseType == DatabaseType.Oracle) ? table.Name : $"{table.Schema}.{table.Name}", table.Type == CustomObjectType.View);

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
                    Application.Current.Dispatcher.Invoke(() =>
                    {
                        ShowMessage("发生错误，请稍后再试！\n" + e.Message, MessageBoxImage.Error);
                    });
                }
                finally
                {
                    this._eventAggregator.GetEvent<LoadedTablesCompletedEvent>().Publish(true);
                }
            }
        }

        private string GetRootNamespace(string projectFilePath)
        {
            var xdocument = XDocument.Load(projectFilePath);
            XNamespace xmlns = "http://schemas.microsoft.com/developer/msbuild/2003";

            return xdocument.Root.Descendants(xmlns + "RootNamespace")?.FirstOrDefault()?.Value;
        }

        #endregion
    }
}
