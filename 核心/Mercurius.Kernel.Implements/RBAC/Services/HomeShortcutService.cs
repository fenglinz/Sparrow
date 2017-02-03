using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Kernel.Contracts.RBAC.Entities;
using Mercurius.Kernel.Contracts.RBAC.Services;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Services;
using Mercurius.Prime.Data.Support;

namespace Mercurius.Kernel.Implements.RBAC.Services
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
            return this.InvokeService(
                nameof(CreateOrUpdate),
                () =>
                {
                    this.Persistence.Create(NS, "CreateOrUpdate", homeShortcut);

                    this.ClearCache<HomeShortcut>();
                }, homeShortcut);
        }

        /// <summary>
        /// 删除用户首页快捷方式。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="args">快捷方式编号</param>
        /// <returns>操作结果</returns>
        public Response Remove(string userId, params string[] args)
        {
            return this.InvokeService(
                nameof(Remove),
                () =>
                {
                    if (!args.IsEmpty())
                    {
                        this.Persistence.Delete(NS, "Remove", new { UserId = userId, HomeShortcutIds = args });
                    }

                    this.ClearCache<HomeShortcut>();
                }, new { userId, args });
        }

        /// <summary>
        /// 获取首页快捷方式信息。
        /// </summary>
        /// <param name="id">快捷方式编号</param>
        /// <returns>首页快捷方式信息</returns>
        public Response<HomeShortcut> GetHomeShortcutById(string id)
        {
            return this.InvokeService(
                nameof(GetHomeShortcutById),
                () => this.Persistence.QueryForObject<HomeShortcut>(NS, "GetHomeShortcutById", id), id);
        }

        /// <summary>
        /// 获取用户定义的首页快捷方式。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <returns>首页快捷方式列表</returns>
        public ResponseSet<HomeShortcut> GetHomeShortcuts(string userId)
        {
            return this.InvokeService(
                nameof(GetHomeShortcuts),
                () => this.Persistence.QueryForList<HomeShortcut>(NS, "GetHomeShortcuts", userId), userId);
        }

        #endregion
    }
}
