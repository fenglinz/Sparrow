using System;
using System.Data;
using System.Linq;
using Mercurius.Infrastructure;
using Mercurius.Siskin.Contracts;
using Mercurius.Siskin.Contracts.RBAC;
using Mercurius.Siskin.Entities;
using Mercurius.Siskin.Entities.RBAC;
using Mercurius.Siskin.Entities.RBAC.SO;
using Mercurius.Siskin.Services.Support;
using static Mercurius.Siskin.Repositories.StatementNamespaces.Core;
using static Mercurius.Siskin.Repositories.StatementNamespaces.RBAC;

namespace Mercurius.Siskin.Services.RBAC
{
    /// <summary>
    /// 回收站服务接口实现。
    /// </summary>
    public class RecyclebinService : ServiceSupport, IRecyclebinService
    {
        #region IRecyclebinService接口实现

        /// <summary>
        /// 获取回收站信息分类。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <returns>回收站信息分类</returns>
        public ResponseCollection<string> GetCategories(string userId)
        {
            return this.InvokeService(
                "GetCategories",
                () => this.Persistence.QueryForList<string>(RecyclebinNamespace, "GetCategories", userId),
                args: userId);
        }

        /// <summary>
        /// 获取回收站信息。
        /// </summary>
        /// <param name="id">回收站编号</param>
        /// <returns>回收站信息</returns>
        public Response<Recyclebin> GetRecyclebinById(string id)
        {
            return this.InvokeService(
                "GetRecyclebinById",
                () => this.Persistence.QueryForObject<Recyclebin>(RecyclebinNamespace, "GetRecyclebinById", id),
                args: id);
        }

        /// <summary>
        /// 获取回收站的所有数据。
        /// </summary>
        /// <param name="so">回收站信息查询对象</param>
        /// <returns>回收站信息列表</returns>
        public ResponseCollection<Recyclebin> GetRecyclebins(RecyclebinSO so)
        {
            return this.InvokePagingService(
                "GetRecyclebins",
                (out int totalRecords) =>
                this.Persistence.QueryForPaginatedList<Recyclebin>(RecyclebinNamespace, "GetRecyclebins", out totalRecords, so),
                args: so);
        }

        /// <summary>
        /// 获取回收站信息详情。
        /// </summary>
        /// <param name="table">表名称</param>
        /// <param name="column">字段名</param>
        /// <param name="value">字段值</param>
        /// <returns>回收站信息详情</returns>
        public Response<DataTable> GetRecyclebinDetails(string table, string column, string value)
        {
            var items = table.Split('.');

            return this.InvokeService(
                "GetRecyclebinDetails",
                () => this.Persistence.QueryForDataTable(RecyclebinNamespace, "GetRecyclebinDetails", new { Schema = items.FirstOrDefault(), Table = items.LastOrDefault(), Column = column, Value = value }),
                true,
                table,
                column,
                value);
        }

        /// <summary>
        /// 还原回收站数据。
        /// </summary>
        /// <param name="args">回收站数据编号列表</param>
        public Response Restore(params string[] args)
        {
            return this.InvokeService(
                "Restore",
                () =>
                {
                    this.Persistence.Update(RecyclebinNamespace, "Restore", new { Values = args });

                    this.Cache.Clear();
                },
                args);
        }

        /// <summary>
        /// 清空回收站数据。
        /// </summary>
        /// <param name="args">回收站数据编号列表</param>
        public Response Clear(params string[] args)
        {
            return this.InvokeService(
                "Clear",
                () =>
                {
                    this.Persistence.Delete(RecyclebinNamespace, "Clear", new { Values = args });

                    this.Cache.Clear();
                },
                args);
        }

        /// <summary>
        /// 判断是否能将数据删除到回收站。
        /// </summary>
        /// <param name="table">数据库表名称</param>
        /// <param name="column">字段名称</param>
        /// <param name="args">字段值列表</param>
        /// <returns>服务执行响应信息</returns>
        public Response<bool> CanRemoveToRecyclebin(string table, string column, params object[] args)
        {
            return this.InvokeService(
                "CanRemoveToRecyclebin",
                () =>
                {
                    var items = table.Split('.');
                    var obj1 = new { Schema = items.FirstOrDefault(), Table = items.LastOrDefault(), Column = column, Values = args };

                    // 验证数据库字段是否存在。
                    var isColumnExist = this.Persistence.QueryForObject<int>(RepositoryUtilsNamespace, "IsColumnExists", obj1) > 0;

                    if (isColumnExist)
                    {
                        var obj2 = new { Schema = items.FirstOrDefault(), Table = items.LastOrDefault(), Column = column, Values = args };

                        return this.Persistence.QueryForObject<int>(RepositoryUtilsNamespace, "IsDataExists", obj2) == 0;
                    }

                    throw new Exception("数据库中不存在给定的表或字段！");
                },
                false,
                table,
                column,
                args);
        }

        /// <summary>
        /// 将数据移除到回收站。
        /// </summary>
        /// <param name="name">表的业务名称</param>
        /// <param name="table">表名称</param>
        /// <param name="column">字段名称</param>
        /// <param name="args">字段值列表</param>
        /// <returns>服务执行响应信息</returns>
        public Response RemoveToRecyclebin(string name, string table, string column, params object[] args)
        {
            return this.InvokeService(
                "RemoveToRecyclebin",
                () =>
                {
                    var items = table.Split('.');

                    var recyclebins = args.Select(a => new Recyclebin
                    {
                        Id = Guid.NewGuid().ToString(),
                        Category = name,
                        Schema = items.FirstOrDefault(),
                        Table = items.LastOrDefault(),
                        Column = column,
                        Value = Convert.ToString(a),
                        CreateDateTime = DateTime.Now,
                        CreateUserId = WebHelper.GetLogOnUserId(),
                        CreateUserName = WebHelper.GetLogOnUserName()
                    });

                    var obj = new { Schema = items.FirstOrDefault(), Table = items.LastOrDefault(), Column = column, Recyclebins = recyclebins.ToArray() };

                    this.Persistence.Update(RecyclebinNamespace, "VirtualRemove", obj);

                    this.Cache.Clear();
                },
                name,
                table,
                column,
                args);
        }

        #endregion

        #region 重写基类方法

        /// <summary>
        /// 获取模块名称。
        /// </summary>
        /// <returns>模块名称</returns>
        protected override string GetModelName()
        {
            return Constants.Model_RBAC;
        }

        #endregion
    }
}
