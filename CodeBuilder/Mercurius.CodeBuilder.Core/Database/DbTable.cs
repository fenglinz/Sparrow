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
        private bool _isEntityOnly;
        private bool _hasCreate = true;
        private bool _hasUpdate = true;
        private bool _hasCreateOrUpdate = false;
        private bool _hasRemove = true;
        private bool _hasSingleData = true;
        private bool _hasGetAll = false;
        private bool _hasSearchData = true;

        #endregion

        #region 属性

        /// <summary>
        /// 获取或者设置表名。
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 架构。
        /// </summary>
        public string Schema { get; set; }

        /// <summary>
        /// 获取或者设置该表是否可用。
        /// </summary>
        public bool IsEnabled
        {
            get { return this._IsEnabled; }
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
        /// 获取或者设置当前类所属的模块名称。
        /// </summary>
        public string ModuleName
        {
            get { return this._moduleName; }
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
            get { return this._moduleDescription; }
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
        /// 获取或者设置该实体的命名空间。
        /// </summary>
        public string Namespace { get; set; }

        /// <summary>
        /// 获取或者设置该表对应的实体类名称。
        /// </summary>
        public string ClassName
        {
            get { return this._className; }
            set
            {
                if (this._className != value)
                {
                    this._className = value;
                    this.RaisePropertyChanged(nameof(ClassName));
                }
            }
        }

        /// <summary>
        /// 获取或者设置完整类名称格式化字符串(包含程序集)。
        /// </summary>
        public string FullClassNameFormat { get; set; }

        /// <summary>
        /// 获取或者设置类的描述信息。
        /// </summary>
        public string Description
        {
            get { return this._description; }
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
            get
            {
                return this._isEntityOnly;
            }
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
            get { return this._hasCreate; }
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
            get { return this._hasUpdate; }
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
            get { return this._hasCreateOrUpdate; }
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
            get { return this._hasRemove; }
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
            get { return this._hasSingleData; }
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
            get { return this._hasGetAll; }
            set
            {
                if (this._hasGetAll!=value)
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
            get { return this._hasSearchData; }
            set
            {
                if (this._hasSearchData != value)
                {
                    this._hasSearchData = value;
                    this.RaisePropertyChanged(nameof(HasSearchData));
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
