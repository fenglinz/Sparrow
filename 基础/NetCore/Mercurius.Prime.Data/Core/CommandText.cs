// <copyright file="CommandText.cs" company="武汉链享医药供应链管理有限公司">
// 版权所有 © 武汉链享医药供应链管理有限公司. 保留所有权利.
// </copyright>
// <author>张枫林</author>
// <create>2017-02-24</create>

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using Mercurius.Prime.Core;
using Mercurius.Prime.Data.Parser;

namespace Mercurius.Prime.Data
{
    /// <summary>
    /// CommandText配置信息。
    /// </summary>
    public class CommandText
    {
        #region 字段

        private DbConnection _connection;

        #endregion

        #region 属性

        /// <summary>
        /// 执行该命令的数据库连接对象。
        /// </summary>
        internal DbConnection Connection
        {
            get { return this._connection; }
            set
            {
                if (this._connection != value)
                {
                    this._connection = value;

                    if (!this.Attachs.IsEmpty())
                    {
                        foreach (var item in this.Attachs)
                        {
                            item.Connection = value;
                        }
                    }
                }
            }
        }

        /// <summary>
        /// 命令名称。
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// SQL命令类型。
        /// </summary>
        public CommandType Type { get; set; }

        /// <summary>
        /// SQL命令。
        /// </summary>
        public string Text { get; set; }

        /// <summary>
        /// 执行模式。
        /// </summary>
        public ExecuteMode Mode { get; set; }

        /// <summary>
        /// 附加命令。
        /// </summary>
        public IList<CommandText> Attachs { get; set; }

        #endregion

        #region 索引

        /// <summary>
        /// 获取附加命令。
        /// </summary>
        /// <param name="index">索引位置</param>
        /// <returns>附加命令</returns>
        public CommandText this[uint index]
        {
            get
            {
                if (index >= this.Attachs?.Count)
                {
                    return null;
                }

                return this.Attachs?[(int)index];
            }
        }

        /// <summary>
        /// 获取附加命令。
        /// </summary>
        /// <param name="attachName">附加命令名称</param>
        /// <returns>附加命令</returns>
        public CommandText this[string attachName]
        {
            get
            {
                return this.Attachs?.FirstOrDefault(a => a.Name == attachName);
            }
        }

        #endregion

        #region 业务属性

        /// <summary>
        /// 查询条件.
        /// </summary>
        public Criteria Criteria { get; internal set; }

        public string EffectiveCommandText
        {
            get
            {
                if (this.Criteria == null)
                {
                    return this.Text;
                }

                return $"{this.Text} {this.Criteria.GetCriteriaSegment()}";
            }
        }

        #endregion
    }
}