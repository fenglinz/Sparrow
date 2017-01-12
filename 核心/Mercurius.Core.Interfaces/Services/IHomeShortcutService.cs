using Mercurius.Core.Interfaces.Entities;
using Mercurius.Prime.Core.Services;

namespace Mercurius.Core.Interfaces.Services
{
    /// <summary>
    /// 首页快捷方式服务接口。
    /// </summary>
    public interface IHomeShortcutService
    {
        /// <summary>
        /// 添加或者修改首页快捷方式信息。
        /// </summary>
        /// <param name="homeShortcut">首页快捷方式信息</param>
        /// <returns>保存结果</returns>
        Response CreateOrUpdate(HomeShortcut homeShortcut);

        /// <summary>
        /// 删除用户首页快捷方式。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="args">快捷方式编号</param>
        /// <returns>操作结果</returns>
        Response Remove(string userId, params string[] args);

        /// <summary>
        /// 获取首页快捷方式信息。
        /// </summary>
        /// <param name="id">快捷方式编号</param>
        /// <returns>首页快捷方式信息</returns>
        Response<HomeShortcut> GetHomeShortcutById(string id);

        /// <summary>
        /// 获取用户定义的首页快捷方式。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <returns>首页快捷方式列表</returns>
        ResponseSet<HomeShortcut> GetHomeShortcuts(string userId);
    }
}