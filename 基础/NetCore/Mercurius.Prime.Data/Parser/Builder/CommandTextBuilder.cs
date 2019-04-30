using System;
using System.Collections.Generic;
using System.Linq;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Log;
using Mercurius.Prime.Data.Parser.Resolver;

namespace Mercurius.Prime.Data.Parser.Builder
{
    /// <summary>
    /// 命令生成器
    /// </summary>
    public abstract class CommandTextBuilder
    {
        #region 字段

        /// <summary>
        /// sql命令缓存器.
        /// </summary>
        private static readonly Dictionary<string, string> CommandTextCaches = new Dictionary<string, string>();

        private IResolver _resolver;
        private string _resolverFullName;

        #endregion

        #region 属性

        /// <summary>
        /// 表解析器
        /// </summary>
        protected IResolver Resolver
        {
            get { return this._resolver; }
            set
            {
                if (this._resolver != value)
                {
                    this._resolver = value;
                    this._resolverFullName = value.GetType().FullName;
                }
            }
        }

        /// <summary>
        /// 日志对象
        /// </summary>
        public AbstractLogger Logger { get; set; }

        #endregion

        /// <summary>
        /// 获取create sql命令
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <returns>create sql命令</returns>
        public string GetCreateCommandText<T>()
        {
            var columns = this.Resolver.Resolve<T>();
            var sql = this.CommandTextCacheHandler(columns.TableName, nameof(GetCreateCommandText), () =>
            {
                return this.GetCreateCommandText(columns.TableName, columns.Where(c => !c.IsReadOnly || !c.IsIdentity));
            });

            if (this.Logger?.IsEnabledFor(Level.Debug) == true)
            {
                // 记录日志
                if (this.Logger?.IsEnabledFor(Level.Debug) == true)
                {
                    this.Logger.WriteFormat(Level.Debug, "表【{0}】的create sql：{1}", columns.TableName, sql);
                }
            }

            return sql;
        }

        /// <summary>
        /// 获取update sql命令
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="updates">更新列表</param>
        /// <param name="action">更新条件设置回调</param>
        /// <returns>update sql命令</returns>
        public string GetUpdateCommandText<T>(object updates = null, Action<Criteria<T>> action = null)
        {
            var columns = this.Resolver.Resolve<T>();

            return this.CommandTextCacheHandler(columns.TableName, nameof(GetUpdateCommandText), () =>
            {
                var effectiveColumns = columns.Where(c => !c.IsReadOnly || !c.IsIdentity);
                var segments = this.GetDynamicQuerySegment(action);

                if (updates != null)
                {
                    var segmentColumns = segments.Item2;
                    var props = ParameterHelper.GetProperties(updates);

                    effectiveColumns = from c in columns
                                       where
                                         props.Any(p => string.CompareOrdinal(p.Name, c.PropertyName) == 0)
                                         && segments.Item2?.Segments.Any(s => string.CompareOrdinal(s.Column, c.Name) == 0) == false
                                       select c;
                }

                var commandText = this.GetUpdateCommandText(columns.TableName, effectiveColumns);

                // 追加查询条件
                commandText += segments.Item1;

                // 记录日志
                if (this.Logger?.IsEnabledFor(Level.Debug) == true)
                {
                    this.Logger.WriteFormat(Level.Debug, "表【{0}】的update sql：{1}", columns.TableName, commandText);
                }

                return commandText;
            });
        }

        /// <summary>
        /// 获取delete sql命令
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="action">删除条件设置回调</param>
        /// <returns>delete sql命令</returns>
        public string GetDeleteCommandText<T>(Action<Criteria<T>> action = null)
        {
            var columns = this.Resolver.Resolve<T>();
            var commandText = this.GetDeleteCommandText(columns.TableName);

            // 追加查询条件
            commandText += this.GetDynamicQuerySegment(action);

            // 记录日志
            if (this.Logger?.IsEnabledFor(Level.Debug) == true)
            {
                this.Logger.WriteFormat(Level.Debug, "表【{0}】的delete sql：{1}", columns.TableName, commandText);
            }

            return commandText;
        }

        /// <summary>
        /// 获取查询一条记录的sql命令
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="selectors">返回列集合</param>
        /// <param name="action">查询条件设置回调</param>
        /// <returns>查询一条记录的sql命令</returns>
        public string GetQueryForObjectCommandText<T>(Action<SelectCriteria<T>> action = null, params string[] selectors)
        {
            var columns = this.Resolver.Resolve<T>();
            var commandText = this.CommandTextCacheHandler(columns.TableName, nameof(GetQueryCommandText), () =>
            {
                var filters = selectors.IsEmpty() ?
                     columns :
                     (from c in columns
                      where
                        selectors.Contains(c.PropertyName, StringComparer.OrdinalIgnoreCase) || selectors.Contains(c.Name, StringComparer.OrdinalIgnoreCase)
                      select c);

                return this.GetQueryCommandText(columns.TableName, filters);
            });

            // 追加查询条件
            commandText += this.GetDynamicQuerySegment(action);

            // 记录日志
            if (this.Logger?.IsEnabledFor(Level.Debug) == true)
            {
                this.Logger.WriteFormat(Level.Debug, "表【{0}】的返回单条记录的sql：{1}", columns.TableName, commandText);
            }

            return this.QueryForObjectWarpper(commandText);
        }

        /// <summary>
        /// 获取查询所有符合条件记录的sql命令
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="selectors">返回列</param>
        /// <param name="action">查询条件设置回调</param>
        /// <returns>查询所有符合条件记录的sql命令</returns>
        public string GetQueryForListCommandText<T>(Action<SelectCriteria<T>> action = null, params string[] selectors)
        {
            var columns = this.Resolver.Resolve<T>();
            var commandText = this.CommandTextCacheHandler(columns.TableName, nameof(GetQueryCommandText), () =>
            {
                var filters = selectors.IsEmpty() ?
                     columns :
                     (from c in columns
                      where
                        selectors.Contains(c.PropertyName, StringComparer.OrdinalIgnoreCase) || selectors.Contains(c.Name, StringComparer.OrdinalIgnoreCase)
                      select c);

                return this.GetQueryCommandText(columns.TableName, filters);
            });

            // 追加查询条件
            commandText += this.GetDynamicQuerySegment(action);

            // 记录日志
            if (this.Logger?.IsEnabledFor(Level.Debug) == true)
            {
                this.Logger.WriteFormat(Level.Debug, "表【{0}】的返回所有符合条件记录的sql：{1}", columns.TableName, commandText);
            }

            return commandText;
        }

        #region 抽象方法

        /// <summary>
        /// 获取create sql命令
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="columns">列信息</param>
        /// <returns>sql命令</returns>
        protected abstract string GetCreateCommandText(string tableName, IEnumerable<Column> columns);

        /// <summary>
        /// 获取update sql命令
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="columns">需要更新列的集合</param>
        /// <returns>update sql命令</returns>
        protected abstract string GetUpdateCommandText(string tableName, IEnumerable<Column> columns);

        /// <summary>
        /// 获取delete sql命令
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <returns>delete sql命令</returns>
        protected abstract string GetDeleteCommandText(string tableName);

        /// <summary>
        /// 获取select sql命令
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="columns">返回列集合</param>
        /// <returns>select sql命令</returns>
        protected abstract string GetQueryCommandText(string tableName, IEnumerable<Column> columns);

        /// <summary>
        /// 获取查询一条记录的sql命令
        /// </summary>
        /// <param name="commandText">select sql命令</param>
        /// <returns>查询一条记录的sql命令</returns>
        protected abstract string QueryForObjectWarpper(string commandText);

        /// <summary>
        /// 获取更新、删除条件的sql片段
        /// </summary>
        /// <param name="segments">sql片段对象集合</param>
        /// <returns>sql片段</returns>
        internal abstract string GetCriteriaSegment(IEnumerable<Segment> segments);

        /// <summary>
        /// 获取查询条件的sql片段
        /// </summary>
        /// <param name="segments">sql片段对象集合</param>
        /// <param name="groupBys">分组集合</param>
        /// <param name="orderBys">排序集合</param>
        /// <returns>sql片段</returns>
        internal abstract string GetSelectCriteriaSegment(IEnumerable<Segment> segments, IEnumerable<GroupColumn> groupBys, IEnumerable<OrderColumn> orderBys);

        /// <summary>
        /// 获取分页查询命令
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <param name="selectors">返回列</param>
        /// <param name="action">查询条件设置回调</param>
        /// <returns>
        /// Item1: 查询当前页数据的sql命令
        /// Item2: 查询符合条件的总记录数
        /// </returns>
        public abstract Tuple<string, string> GetQueryForPagedListCommandText<S, T>(Action<SelectCriteria<S>> action = null, params string[] selectors);

        #endregion

        #region 私有方法

        /// <summary>
        /// 获取动态查询条件
        /// </summary>
        /// <param name="action">动态条件设置处理</param>
        /// <returns>动态查询命令片段</returns>
        private Tuple<string, Criteria<T>> GetDynamicQuerySegment<T>(Action<Criteria<T>> action)
        {
            // 查询回调处理
            if (action != null)
            {
                var dynamicQuery = new Criteria<T>();

                // 回调处理
                action.Invoke(dynamicQuery);

                var segments = this.GetCriteriaSegment(dynamicQuery.Segments);
                var sql = segments.IsNullOrEmpty() ? string.Empty : $" {(dynamicQuery.NeedWhere ? "WHERE" : string.Empty)}{dynamicQuery.TrimedSqlSegment(segments)} ";

                return new Tuple<string, Criteria<T>>(sql, dynamicQuery);
            }

            return new Tuple<string, Criteria<T>>(string.Empty, null);
        }

        /// <summary>
        /// 获取动态查询条件
        /// </summary>
        /// <param name="action">动态条件设置处理</param>
        /// <returns>动态查询命令片段</returns>
        protected string GetDynamicQuerySegment<T>(Action<SelectCriteria<T>> action)
        {
            // 查询回调处理
            if (action != null)
            {
                var dynamicQuery = new SelectCriteria<T>();

                // 回调处理
                action.Invoke(dynamicQuery);

                var segments = this.GetSelectCriteriaSegment(dynamicQuery.Segments, dynamicQuery.GroupBys, dynamicQuery.OrderBys);

                return segments.IsNullOrEmpty() ? string.Empty : $" {(dynamicQuery.NeedWhere ? "WHERE" : string.Empty)}{dynamicQuery.TrimedSqlSegment(segments)} ";
            }

            return string.Empty;
        }

        /// <summary>
        /// 命令缓存处理.
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="type">类型</param>
        /// <param name="func">无缓存时的回调处理</param>
        /// <returns>sql命令</returns>
        protected string CommandTextCacheHandler(string tableName, string type, Func<string> func)
        {
            var cacheKey = $"{this._resolverFullName}_{tableName}_{type}";

            if (CommandTextCaches.ContainsKey(cacheKey))
            {
                return CommandTextCaches[cacheKey];
            }
            else
            {
                var commandText = func();

                CommandTextCaches.Add(cacheKey, commandText);

                return commandText;
            }
        }

        #endregion
    }
}
