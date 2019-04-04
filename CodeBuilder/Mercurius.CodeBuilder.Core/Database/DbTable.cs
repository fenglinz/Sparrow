using System.Collections.Generic;
using System.ComponentModel;

namespace Mercurius.CodeBuilder.Core.Database
{
    /// <summary>
    /// <para>
    /// 数据库表信息实体类。
    /// </para>
    /// 
    /// <para>
    /// 作者：Fenglinz
    /// 日期：2011-11-02
    /// </para>
    /// </summary>
    public class DbTable : INotifyPropertyChanged
    {
        #region 字段

        private bool _IsEnabled = false;
        private string _className = null;
        private string _moduleName = null;
        private string _moduleDescription = null;
        private string _description = null;
        private bool _isEntityOnly = false;
        private bool _hasCreate = true;
        private bool _hasUpdate = true;
        private bool _hasCreateOrUpdate = false;
        private bool _hasRemove = true;
        private bool _hasSingleData = true;
        private bool _hasGetAll = false;
        private bool _hasSearchData = true;
        private bool _hasCreateWebApi = true;

        #endregion

        #region 属性

        /// <summary>
        /// 表名。
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 架构。
        /// </summary>
        public string Schema { get; set; }

        /// <summary>
        /// 该表是否可用。
        /// </summary>
        public bool IsEnabled
        {
            get => this._IsEnabled;
            set
            {
                if (this._IsEnabled != value)
                {
                    this._IsEnabled = value;
                    this.RaisePropertyChanged(nameof(IsEnabled));
                }
            }
        }

        /// <summary>
        /// 当前类所属的模块名称。
        /// </summary>
        public string ModuleName
        {
            get => this._moduleName;
            set
            {
                if (this._moduleName != value)
                {
                    this._moduleName = value;
                    this.RaisePropertyChanged(nameof(ModuleName));
                }
            }
        }

        /// <summary>
        /// 模型描述
        /// </summary>
        public string ModuleDescription
        {
            get => this._moduleDescription;
            set
            {
                if (this._moduleDescription != value)
                {
                    this._moduleDescription = value;
                    this.RaisePropertyChanged(nameof(ModuleDescription));
                }
            }
        }

        /// <summary>
        /// 该实体的命名空间。
        /// </summary>
        public string Namespace { get; set; }

        /// <summary>
        /// 该表对应的实体类名称。
        /// </summary>
        public string ClassName
        {
            get => this._className;
            set
            {
                if (this._className != value)
                {
                    this._className = value;
                    this.RaisePropertyChanged(nameof(ClassName));
                }
            }
        }

        public string ClassFormat { get; set; }

        /// <summary>
        /// 完整类名称格式化字符串(包含程序集)。
        /// </summary>
        public string FullClassNameFormat { get; set; }

        /// <summary>
        /// 类的描述信息。
        /// </summary>
        public string Description
        {
            get => this._description;
            set
            {
                if (this._description != value)
                {
                    this._description = value;
                    this.RaisePropertyChanged(nameof(Description));
                }
            }
        }

        /// <summary>
        /// 是否为视图。
        /// </summary>
        public bool IsView { get; set; }

        /// <summary>
        /// 只生成实体。
        /// </summary>
        public bool IsEntityOnly
        {
            get => this._isEntityOnly;
            set
            {
                if (this._isEntityOnly != value)
                {
                    this._isEntityOnly = value;
                    this.RaisePropertyChanged(nameof(IsEntityOnly));
                }
            }
        }

        /// <summary>
        /// 拥有添加操作。
        /// </summary>
        public bool HasCreate
        {
            get => this._hasCreate;
            set
            {
                if (this._hasCreate != value)
                {
                    this._hasCreate = value;
                    this.RaisePropertyChanged(nameof(HasCreate));
                }
            }
        }

        /// <summary>
        /// 拥有修改操作。
        /// </summary>
        public bool HasUpdate
        {
            get => this._hasUpdate;
            set
            {
                if (this._hasUpdate != value)
                {
                    this._hasUpdate = value;
                    this.RaisePropertyChanged(nameof(HasUpdate));
                }
            }
        }

        /// <summary>
        /// 拥有添加或修改操作。
        /// </summary>
        public bool HasCreateOrUpdate
        {
            get => this._hasCreateOrUpdate;
            set
            {
                if (this._hasCreateOrUpdate != value)
                {
                    this._hasCreateOrUpdate = value;
                    this.RaisePropertyChanged(nameof(HasCreateOrUpdate));
                }
            }
        }

        /// <summary>
        /// 拥有删除操作。
        /// </summary>
        public bool HasRemove
        {
            get => this._hasRemove;
            set
            {
                if (this._hasRemove != value)
                {
                    this._hasRemove = value;
                    this.RaisePropertyChanged(nameof(HasRemove));
                }
            }
        }

        /// <summary>
        /// 拥有查询单条数据。
        /// </summary>
        public bool HasSingleData
        {
            get => this._hasSingleData;
            set
            {
                if (this._hasSingleData != value)
                {
                    this._hasSingleData = value;
                    this.RaisePropertyChanged(nameof(HasSingleData));
                }
            }
        }

        public bool HasGetAll
        {
            get => this._hasGetAll;
            set
            {
                if (this._hasGetAll != value)
                {
                    this._hasGetAll = value;
                    this.RaisePropertyChanged(nameof(HasGetAll));
                }
            }
        }

        /// <summary>
        /// 拥有查询数据操作。
        /// </summary>
        public bool HasSearchData
        {
            get => this._hasSearchData;
            set
            {
                if (this._hasSearchData != value)
                {
                    this._hasSearchData = value;
                    this.RaisePropertyChanged(nameof(HasSearchData));
                }
            }
        }

        public bool HasCreateWebApi
        {
            get => this._hasCreateWebApi;
            set
            {
                if (this._hasCreateWebApi != value)
                {
                    this._hasCreateWebApi = value;
                    this.RaisePropertyChanged(nameof(this.HasCreateWebApi));
                }
            }
        }

        /// <summary>
        /// 获取所有字段信息。
        /// </summary>
        public IList<DbColumn> Columns { get; set; }

        #endregion

        #region 事件

        /// <summary>
        /// 属性更改事件。
        /// </summary>
        public event PropertyChangedEventHandler PropertyChanged;

        #endregion

        #region 构造方法

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        public DbTable()
        {
            this.Columns = new List<DbColumn>();
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 获取类名
        /// </summary>
        /// <param name="format">类格式化</param>
        /// <returns>类名称</returns>
        public string GetClassName()
        {
            if (!string.IsNullOrWhiteSpace(this.ClassFormat))
            {
                return string.Format(this.ClassFormat, this.ClassName);
            }

            return this.ClassName;
        }

        #endregion

        #region 私有方法

        /// <summary>
        /// 抛出属性更改事件。
        /// </summary>
        /// <param name="propertyName">属性名称</param>
        private void RaisePropertyChanged(string propertyName)
        {
            if (this.PropertyChanged != null)
            {
                this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
            }
        }

        #endregion
    }
}
