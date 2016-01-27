using System.Data;
using Mercurius.Sparrow.Entities.Core;
using Mercurius.Sparrow.Entities.RBAC;
using Mercurius.Sparrow.Entities.RBAC.SO;

namespace Mercurius.Sparrow.Contracts.RBAC
{
    /// <summary>
    /// 回收站服务接口。
    /// </summary>
    public interface IRecyclebinService
    {
        /// <summary>
        /// 获取回收站信息分类。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <returns>回收站信息分类</returns>
        ResponseCollection<string> GetCategories(string userId);

        /// <summary>
        /// 获取回收站信息。
        /// </summary>
        /// <param name="id">回收站编号</param>
        /// <returns>回收站信息</returns>
        Response<Recyclebin> GetRecyclebinById(string id);

        /// <summary>
        /// 获取回收站的所有数据。
        /// </summary>
        /// <param name="so">回收站信息查询对象</param>
        /// <returns>回收站信息列表</returns>
        ResponseCollection<Recyclebin> GetRecyclebins(RecyclebinSO so);

        /// <summary>
        /// 获取回收站信息详情。
        /// </summary>
        /// <param name="table">表名称</param>
        /// <param name="column">字段名</param>
        /// <param name="value">字段值</param>
        /// <returns>回收站信息详情</returns>
        Response<DataTable> GetRecyclebinDetails(string table, string column, string value);

        /// <summary>
        /// 还原回收站数据。
        /// </summary>
        /// <param name="args">回收站数据编号列表</param>
        Response Restore(params string[] args);

        /// <summary>
        /// 清空回收站数据。
        /// </summary>
        /// <param name="args">回收站数据编号列表</param>
        Response Clear(params string[] args);

        /// <summary>
        /// 判断是否能将数据删除到回收站。
        /// </summary>
        /// <param name="table">表名称</param>
        /// <param name="column">字段名称</param>
        /// <param name="args">字段值列表</param>
        /// <returns>服务执行响应信息</returns>
        Response<bool> CanRemoveToRecyclebin(string table, string column, params object[] args);

        /// <summary>
        /// 将数据移除到回收站。
        /// </summary>
        /// <param name="name">表的业务名称</param>
        /// <param name="table">表名称</param>
        /// <param name="column">字段名称</param>
        /// <param name="args">字段值列表</param>
        /// <returns>服务执行响应信息</returns>
        Response RemoveToRecyclebin(string name, string table, string column, params object[] args);
    }
}
