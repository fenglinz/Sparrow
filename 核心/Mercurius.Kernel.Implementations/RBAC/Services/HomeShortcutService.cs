using Mercurius.Kernel.Contracts.RBAC.Entities;
using Mercurius.Kernel.Contracts.RBAC.Services;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Services;
using Mercurius.Prime.Data.Support;

namespace Mercurius.Kernel.Implementations.RBAC.Services
{
    [Module("基于角色的访问控制模块")]
    public class HomeShortcutService : ServiceSupport, IHomeShortcutService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Kernel.Repositories.RBAC.HomeShortcut";

        #endregion

        #region IHomeShortcutService接口实现

        /// <summary>
        /// 添加首页快捷方式信息。
        /// </summary>
        /// <param name="homeShortcut">首页快捷方式信息</param>
        /// <returns>操作结果</returns>
        public Response CreateOrUpdate(HomeShortcut homeShortcut)
        {
            return this.Create<HomeShortcut>(NS, "CreateOrUpdate", homeShortcut);
        }

        /// <summary>
        /// 删除用户首页快捷方式。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="args">快捷方式编号</param>
        /// <returns>操作结果</returns>
        public Response Remove(string userId, params string[] args)
        {
            return this.Delete<HomeShortcut>(NS, "Remove",
                new { UserId = userId, HomeShortcutIds = args }, rs => !args.IsEmpty());
        }

        /// <summary>
        /// 获取首页快捷方式信息。
        /// </summary>
        /// <param name="id">快捷方式编号</param>
        /// <returns>首页快捷方式信息</returns>
        public Response<HomeShortcut> GetHomeShortcutById(string id)
        {
            return this.QueryForObject<HomeShortcut>(NS, "GetHomeShortcutById", id);
        }

        /// <summary>
        /// 获取用户定义的首页快捷方式。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <returns>首页快捷方式列表</returns>
        public ResponseSet<HomeShortcut> GetHomeShortcuts(string userId)
        {
            return this.QueryForList<HomeShortcut>(NS, "GetHomeShortcuts", userId);
        }

        #endregion
    }
}
