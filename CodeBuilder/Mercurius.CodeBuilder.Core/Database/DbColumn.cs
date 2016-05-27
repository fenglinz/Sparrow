using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using Mercurius.Infrastructure;

namespace Mercurius.CodeBuilder.Core.Database
{
    /// <summary>
    /// <para>
    /// 数据库表字段信息实体类。
    /// </para>
    /// 
    /// <para>
    /// 作者：Fenglinz
    /// 日期：2011-11-02
    /// </para>
    /// </summary>
    public class DbColumn : INotifyPropertyChanged
    {
        #region 字段

        private string _name;
        private string _propertyName;
        private string _sqlType;
        private string _basicType;
        private int _length;
        private string _description;
        private bool _editable;
        private bool _visible;
        private bool _isKeyWordSearch;
        private bool _isSearchCriteria;

        #endregion

        #region 属性

        /// <summary>
        /// 获取或者设置字段名。
        /// </summary>
        public string Name
        {
            get { return this._name; }
            set
            {
                if (this._name == value) return;

                this._name = value;
                this.RaisePropertyChanged("Name");
            }
        }

        /// <summary>
        /// 获取作为字段的名称。
        /// </summary>
        public string FieldName
        {
            get { return this.PropertyName.CamelNaming(); }
        }

        /// <summary>
        /// 获取或者设置该字段对应的属性名。
        /// </summary>
        public string PropertyName
        {
            get { return this._propertyName; }
            set
            {
                if (this._propertyName == value) return;

                this._propertyName = value;
                this.RaisePropertyChanged("PropertyName");
            }
        }

        /// <summary>
        /// 获取或者数据库字段类型。
        /// </summary>
        public string SqlType
        {
            get { return this._sqlType; }
            set
            {
                if (this._sqlType == value) return;

                this._sqlType = value;
                this.RaisePropertyChanged("SqlType");
            }
        }

        /// <summary>
        /// 获取或者设置基本类型。
        /// </summary>
        public string BasicType
        {
            get { return this._basicType; }
            set
            {
                if (this._basicType == value) return;

                this._basicType = value;
                this.RaisePropertyChanged("BasicType");
            }
        }

        /// <summary>
        /// 获取或者设置字段长度。
        /// </summary>
        public int Length
        {
            get { return this._length; }
            set
            {
                if (this._length == value) return;

                this._length = value;
                this.RaisePropertyChanged("Length");
            }
        }

        /// <summary>
        /// 获取或者设置字段描述信息。
        /// </summary>
        public string Description
        {
            get { return this._description; }
            set
            {
                if (this._description == value) return;

                this._description = value;
                this.RaisePropertyChanged("Description");
            }
        }

        /// <summary>
        /// 获取或者设置字段是否可为空。
        /// </summary>
        public bool Nullable { get; set; }

        /// <summary>
        /// 获取或者设置该字段是否为主键。
        /// </summary>
        public bool IsPrimaryKey { get; set; }

        /// <summary>
        /// 获取或者设置该字段是否为自动增长列。
        /// </summary>
        public bool IsIdentity { get; set; }

        /// <summary>
        /// 获取或者设置该字段是否可编辑。
        /// </summary>
        public bool Editable
        {
            get { return this._editable; }
            set
            {
                if (this._editable == value) return;

                this._editable = value;
                this.RaisePropertyChanged("Editable");
            }
        }

        /// <summary>
        /// 获取或者设置该字段是否可见。
        /// </summary>
        public bool Visible
        {
            get { return this._visible; }
            set
            {
                if (this._visible == value) return;

                this._visible = value;
                this.RaisePropertyChanged("Visible");
            }
        }

        /// <summary>
        /// 获取或者设置是否作为关键字查询。
        /// </summary>
        public bool IsKeyWordSearch
        {
            get { return this._isKeyWordSearch; }
            set
            {
                if (this._isKeyWordSearch == value) return;

                this._isKeyWordSearch = value;
                this.RaisePropertyChanged("IsKeyWordSearch");
            }
        }

        /// <summary>
        /// 获取或者设置是否作为条件查询。
        /// </summary>
        public bool IsSearchCriteria
        {
            get { return this._isSearchCriteria; }
            set
            {
                if (this._isSearchCriteria == value) return;

                this._isSearchCriteria = value;
                this.RaisePropertyChanged("IsSearchCriteria");
            }
        }

        #endregion

        #region 事件

        /// <summary>
        /// 属性更改事件。
        /// </summary>
        public event PropertyChangedEventHandler PropertyChanged;

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
