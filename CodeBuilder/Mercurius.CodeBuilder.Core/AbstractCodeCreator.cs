using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using Mercurius.CodeBuilder.Core;
using Mercurius.CodeBuilder.Core.Database;
using Mercurius.CodeBuilder.Core.Events;
using Microsoft.Practices.Prism.PubSubEvents;
using Microsoft.Practices.ServiceLocation;

namespace Mercurius.CodeBuilder.Core
{
    /// <summary>
    /// <para>
    /// 代码创建器抽象类。
    /// </para>
    /// 
    /// <para>
    /// 作者：Fenglinz
    /// 日期：2011-11-09
    /// </para>
    /// </summary>
    public abstract class AbstractCodeCreator
    {
        #region 字段

        protected BuildEvent _buildEvent;
        protected IEventAggregator _eventAggregator;

        #endregion

        #region 构造方法

        /// <summary>
        /// 默认构造方法。
        /// </summary>
        protected AbstractCodeCreator()
        {
            this._eventAggregator = ServiceLocator.Current.GetInstance<IEventAggregator>();
            this._buildEvent = this._eventAggregator?.GetEvent<BuildEvent>();
        }

        #endregion

        #region 公开方法

        /// <summary>
        /// 生成工程。
        /// </summary>
        /// <param name="configuration">代码生成配置信息</param>
        public void Create(Configuration configuration)
        {
            //if (this.IsFirstCreate(configuration))
            //{
            //    this.Initialize(configuration);
            //}

            this._buildEvent?.Publish(new BuildEventArg(Status.Begin));

            this.DbTypeMappingHandler(configuration);

            this.CreateHandler(configuration);

            // 序列化配置。
            configuration.SerializeConfiguration();

            this._buildEvent.Publish(new BuildEventArg(Status.Success));
        }

        #endregion

        #region 抽象方法

        /// <summary>
        /// 初始化处理。
        /// </summary>
        public abstract void Initialize(Configuration configuration);

        /// <summary>
        /// 代码生成处理。
        /// </summary>
        protected abstract void CreateHandler(Configuration configuration);

        #endregion

        #region 私有方法

        private bool IsFirstCreate(Configuration configuration)
        {
            if ("Mercurius.Siskin".Equals(configuration.BaseNamespace, StringComparison.InvariantCultureIgnoreCase))
            {
                return false;
            }

            var settingFile = $@"{configuration.OutputFolder}\pa.hdata";

            if (File.Exists(settingFile))
            {
                return false;
            }

            File.Create(settingFile);
            File.SetAttributes(settingFile, FileAttributes.Hidden | FileAttributes.ReadOnly);

            return true;
        }

        /// <summary>
        /// 转换SqlType为基本数据类型。
        /// </summary>
        private void DbTypeMappingHandler(Configuration configuration)
        {
            var dbTypeMapping = ServiceLocator.Current.GetInstance<DbTypeMapping>(configuration.CurrentDatabase.Type.ToString());

            for (var i = 0; i < configuration.Tables.Count; i++)
            {
                var table = configuration.Tables[i];

                for (var j = 0; j < table.Columns.Count; j++)
                {
                    var column = table.Columns[j];

                    column.BasicType = dbTypeMapping.GetBasicType(configuration.Language, column.SqlType);
                }
            }
        }

        #endregion
    }
}
