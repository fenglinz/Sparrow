using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Cache;
using Mercurius.Prime.Core.Logger;
using Mercurius.Prime.Core.Services;
using Mercurius.Prime.Data.IBatisNet;

namespace Mercurius.Prime.Data.Support
{
    /// <summary>
    /// 分页服务回调委托。
    /// </summary>
    /// <typeparam name="T">数据类型</typeparam>
    /// <param name="totalRecords">总记录数</param>
    /// <returns>数据集合</returns>
    public delegate IList<T> PagingServiceCallback<T>(out int totalRecords);

    /// <summary>
    /// 服务处理支持类。
    /// </summary>
    public abstract class ServiceSupport
    {
        #region 字段

        /// <summary>
        /// 默认执行返回结果。
        /// </summary>
        private static Response Defalut() => new Response();

        #endregion

        #region 属性

        /// <summary>
        /// 缓存提供者。
        /// </summary>
        public CacheProvider Cache { get; set; }

        /// <summary>
        /// IBatis.Net持久化器。
        /// </summary>
        public Persistence Persistence { get; set; }

        #endregion

        #region 服务支持

        /// <summary>
        /// 执行服务。
        /// </summary>
        /// <param name="callback">回调方法</param>
        /// <returns>操作结果</returns>
        protected Response Create(
            StatementNamespace ns,
            string innerId,
            object param = null,
            Action callback = null)
        {
            this.Persistence.Create(ns, innerId, param);

            callback?.Invoke();

            return Defalut();
        }

        /// <summary>
        /// 执行服务。
        /// </summary>
        /// <param name="callback">回调方法</param>
        /// <returns>操作结果</returns>
        protected Response Update(
            StatementNamespace ns,
            string innerId,
            object param = null,
            Action callback = null)
        {
            this.Persistence.Update(ns, innerId, param);

            callback?.Invoke();

            return Defalut();
        }

        /// <summary>
        /// 执行服务。
        /// </summary>
        /// <param name="callback">回调方法</param>
        /// <returns>操作结果</returns>
        protected Response Delete(
            StatementNamespace ns,
            string innerId,
            object param = null,
            Action callback = null)
        {
            this.Persistence.Delete(ns, innerId, param);

            callback?.Invoke();

            return Defalut();
        }

        /// <summary>
        /// 执行服务操作。
        /// </summary>
        /// <typeparam name="T">返回类型</typeparam>
        /// <param name="callback">回调方法</param>
        /// <returns>服务返回结果</returns>
        protected Response<T> QueryForObject<T>(
            StatementNamespace ns,
            string innerId,
            object so = null,
            Action callback = null)
        {
            var result = new Response<T>()
            {
                Data = this.Persistence.QueryForObject<T>(ns, innerId, so)
            };

            callback?.Invoke();

            return result;
        }

        /// <summary>
        /// 执行服务操作。
        /// </summary>
        /// <typeparam name="T">返回类型</typeparam>
        /// <param name="handler">回调方法</param>
        /// <returns>服务返回结果</returns>
        protected ResponseSet<T> QueryForList<T>(
            StatementNamespace ns,
            string innerId,
            object so = null,
            Action callback = null)
        {
            var result = new ResponseSet<T>()
            {
                Datas = this.Persistence.QueryForList<T>(ns, innerId, so)
            };

            callback?.Invoke();

            return result;
        }

        /// <summary>
        /// 执行分页服务操作。
        /// </summary>
        /// <typeparam name="T">返回类型</typeparam>
        /// <param name="handler">回调方法</param>
        /// <returns>服务返回结果</returns>
        protected ResponseSet<T> QueryForPagedList<T>(
            StatementNamespace ns,
            string innerId,
            object param = null,
            Action callback = null)
        {
            var totalRecords = -1;

            var result = new ResponseSet<T>()
            {
                Datas = this.Persistence.QueryForPaginatedList<T>(ns, innerId, out totalRecords, param),
                TotalRecords = totalRecords
            };

            callback?.Invoke();

            return result;
        }

        protected DataTable QueryForDataTable(
            StatementNamespace ns,
            string innerId,
            object so = null,
            Action callback = null)
        {
            var result = this.Persistence.QueryForDataTable(ns, innerId, so);

            callback?.Invoke();

            return result;
        }

        #endregion

        #region 操作记录

        /// <summary>
        /// 添加操作记录。
        /// </summary>
        /// <param name="category">业务分类</param>
        /// <param name="serialNumber">业务流水号</param>
        /// <param name="content">记录内容</param>
        public void AddOperationRecord(string category, string serialNumber, string content)
        {
            //var record = new OperationRecord
            //{
            //    BusinessCategory = category,
            //    BusinessSerialNumber = serialNumber,
            //    Content = content,
            //    AddedUserId = WebHelper.GetLogOnUserId(),
            //    LogOnIPAddress = WebHelper.GetClientIPAddress()
            //};

            //var del = new Action<OperationRecord>(args =>
            //{
            //    this.Persistence.Create(OperationRecordNamespace, "Create", args);
            //});

            //del.BeginInvoke(record, ar =>
            //{
            //    var action = ar.AsyncState as Action<OperationRecord>;

            //    action.EndInvoke(ar);
            //    this.ClearCache<OperationRecord>();
            //}, del);
        }

        #endregion

        #region 缓存处理

        /// <summary>
        /// 清除与本服务相关的缓存。
        /// </summary>
        protected void ClearCache<T>()
        {
            this.Cache?.RemoveStarts(this.Cache?.GetCacheKey<T>(string.Empty));
        }

        #endregion
    }
}
