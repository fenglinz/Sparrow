﻿using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace Mercurius.CodeBuilder.Core.Database
{
    /// <summary>
    /// <para>
    /// 获取数据库元数据信息抽象类。
    /// </para>
    /// 
    /// <para>
    /// 作者：Fenglinz
    /// 日期：2011-11-04
    /// </para>
    /// </summary>
    public abstract class Metadata : INotifyPropertyChanged
    {
        #region 常量

        private static readonly string[] AddColumnKeyWords = { "create", "add", "insert" };
        private static readonly string[] UpdateColumnKeyWords = { "update", "modify", "edit" };

        #endregion

        #region 字段

        private string _serverUri;
        private string _account;
        private string _password;
        private int? _port;

        #endregion

        #region 属性

        /// <summary>
        /// 数据库服务器地址。
        /// </summary>
        public string ServerUri
        {
            get { return this._serverUri; }
            set
            {
                if (this._serverUri != value)
                {
                    this._serverUri = value;
                    this.RaisePropertyChanged("ServerUri");
                }
            }
        }

        /// <summary>
        /// 登录数据库的账户。
        /// </summary>
        public string Account
        {
            get { return this._account; }
            set
            {
                if (this._account != value)
                {
                    this._account = value;
                    this.RaisePropertyChanged("Account");
                }
            }
        }

        /// <summary>
        /// 登录数据库的密码。
        /// </summary>
        public string Password
        {
            get { return this._password; }
            set
            {
                if (this._password != value)
                {
                    this._password = value;
                    this.RaisePropertyChanged("Password");
                }
            }
        }

        /// <summary>
        /// 数据库监听端口。
        /// </summary>
        public int? Port
        {
            get => this._port;
            set
            {
                if (this._port != value)
                {
                    this._port = value;
                    this.RaisePropertyChanged(nameof(Port));
                }
            }
        }

        #endregion

        #region 事件

        public event PropertyChangedEventHandler PropertyChanged;

        #endregion

        #region 抽象方法

        /// <summary>
        /// 获取所有数据库名称。
        /// </summary>
        /// <returns>数据库名称集合</returns>
        public abstract IList<string> GetDatabaseNames();

        /// <summary>
        /// 获取数据库中的所有自定义对象。
        /// </summary>
        /// <param name="databaseName">数据库名称</param>
        /// <returns>自定义对象名称集合</returns>
        public abstract IList<CustomObject> GetCustomObjects(string databaseName);

        /// <summary>
        /// 获取表或视图的详细信息。
        /// </summary>
        /// <param name="databaseName">数据库名称</param>
        /// <param name="tableName">表或视图名称</param>
        /// <param name="isView">是否为视图</param>
        /// <returns>表或视图信息</returns>
        public abstract DbTable GetTableOrViewDetails(string databaseName, string tableName, bool isView = false);

        #endregion

        #region 保护方法

        /// <summary>
        /// 判断是否为需要添加的列。
        /// </summary>
        /// <param name="column"></param>
        /// <returns></returns>
        protected bool IsAddColumn(DbColumn column)
        {
            if (column.IsIdentity)
            {
                return false;
            }

            if (column.IsPrimaryKey)
            {
                return true;
            }

            foreach (var item in UpdateColumnKeyWords)
            {
                if (column.Name.StartsWith(item, StringComparison.OrdinalIgnoreCase))
                {
                    return false;
                }
            }

            return true;
        }

        /// <summary>
        /// 判断是否为需要更新的列
        /// </summary>
        /// <param name="column"></param>
        /// <returns></returns>
        protected bool IsUpdateColumn(DbColumn column)
        {
            if (column.IsIdentity)
            {
                return false;
            }

            if (column.IsPrimaryKey)
            {
                return false;
            }

            foreach (var item in AddColumnKeyWords)
            {
                if (column.Name.StartsWith(item, StringComparison.OrdinalIgnoreCase))
                {
                    return false;
                }
            }

            return true;
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
