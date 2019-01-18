// <copyright file="XCommand.cs" company="武汉链享医药供应链管理有限公司">
// 版权所有 © 武汉链享医药供应链管理有限公司. 保留所有权利.
// </copyright>
// <author>张枫林</author>
// <create>2017-02-24</create>

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

namespace Mercurius.Prime.Core.Ado
{
    /// <summary>
    /// CommandText配置信息。
    /// </summary>
    public class XCommand
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
        public IList<XCommand> Attachs { get; set; }

        #endregion

        #region 索引

        /// <summary>
        /// 获取附加命令。
        /// </summary>
        /// <param name="index">索引位置</param>
        /// <returns>附加命令</returns>
        public XCommand this[uint index]
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
        public XCommand this[string attachName]
        {
            get
            {
                return this.Attachs?.FirstOrDefault(a => a.Name == attachName);
            }
        }

        #endregion

        #region 业务属性

        /// <summary>
        /// where条件。
        /// </summary>
        internal WhereSegment Where { get; set; }

        /// <summary>
        /// 执行片段
        /// </summary>
        internal IList<SqlSegment> Segments { get; private set; } = new List<SqlSegment>();

        /// <summary>
        /// 排序
        /// </summary>
        internal IList<string> OrderBys { get; private set; } = new List<string>();

        /// <summary>
        /// 分组
        /// </summary>
        internal IList<string> GroupBys { get; private set; } = new List<string>();

        /// <summary>
        /// 获取有效的SQL执行命令.
        /// </summary>
        /// <returns>sql命令</returns>
        internal string EffectiveCommandText
        {
            get
            {
                var builder = new StringBuilder(this.Text);
                var segmentBuilder = new StringBuilder();

                for (var index = 0; index < this.Segments.Count; index++)
                {
                    var item = this.Segments[index];

                    if (item.EffectiveExpression.Compile().Invoke())
                    {
                        segmentBuilder.Append(item.Text);
                    }
                }

                if (segmentBuilder.Length > 0)
                {
                    var sqlSegment = segmentBuilder.ToString().Trim();

                    if (this.Where != null)
                    {
                        builder.Append(" WHERE ");

                        if (!this.Where.Trimeds.IsEmpty())
                        {
                            foreach (var item in this.Where.Trimeds)
                            {
                                if (sqlSegment.StartsWith(item, StringComparison.OrdinalIgnoreCase))
                                {
                                    sqlSegment = sqlSegment.Substring(item.Length);
                                }
                            }
                        }
                    }

                    builder.AppendFormat(" {0} ", sqlSegment);
                }

                // 追加分组
                if (!this.GroupBys.IsEmpty())
                {
                    builder.Append("GROUP BY ");

                    for (int index = 0; index < this.GroupBys.Count; index++)
                    {
                        builder.AppendFormat("{0}{1}", this.GroupBys[index], index < this.GroupBys.Count - 1 ? "," : string.Empty);
                    }
                }

                // 追加排序
                if (!this.OrderBys.IsEmpty())
                {
                    builder.Append(" ORDER BY ");

                    for (var index = 0; index < this.OrderBys.Count; index++)
                    {
                        builder.AppendFormat("{0}{1}", this.OrderBys[index], index < this.OrderBys.Count - 1 ? "," : string.Empty);
                    }
                }

                return builder.ToString();
            }
        }

        #endregion

        #region 内部方法

        /// <summary>
        /// 清理设置。
        /// </summary>
        internal void Clear()
        {
            this.Where = null;
            this.Segments.Clear();
            this.OrderBys.Clear();

            if (!this.Attachs.IsEmpty())
            {
                foreach (var item in this.Attachs)
                {
                    this.Where = null;
                    this.Segments.Clear();
                    this.OrderBys.Clear();
                }
            }
        }

        #endregion
    }
}