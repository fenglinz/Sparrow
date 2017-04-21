using Mercurius.Kernel.Contracts.RBAC.Entities;
using Mercurius.Kernel.Contracts.RBAC.Services;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Services;
using Mercurius.Prime.Data.Support;

namespace Mercurius.Kernel.Implementations.RBAC.Services
{
    /// <summary>
    /// 权限管理服务接口实现。
    /// </summary>
    [Module("基于角色的访问控制模块")]
    public class PermissionService : ServiceSupport, IPermissionService
    {
        #region 常量

        private static readonly StatementNamespace PermissionNamespace = "Mercurius.Kernel.Repositories.RBAC.Permission";

        #endregion

        #region IPermissionService接口实现

        /// <summary>
        /// 添加或者编辑系统菜单信息。
        /// </summary>
        /// <param name="systemMenu">系统菜单信息</param>
        /// <returns>服务执行结果</returns>
        public Response CreateOrUpdate(SystemMenu systemMenu)
        {
            return this.Create<SystemMenu>(PermissionNamespace, "CreateOrUpdate", systemMenu);
        }

        /// <summary>
        /// 删除菜单。
        /// </summary>
        /// <param name="id">菜单编号</param>
        public Response Remove(string id)
        {
            return this.Delete<Button>(PermissionNamespace, "Remove", id, () => this.ClearCache<SystemMenu>());
        }

        /// <summary>
        /// 分配页面按钮资源。
        /// </summary>
        /// <param name="systemMenuId">系统菜单编号</param>
        /// <param name="buttonIds">按钮编号集合(以','号分隔)</param>
        public Response AllotButtons(string systemMenuId, string buttonIds)
        {
            return this.Create(PermissionNamespace, "AllotButtons",
                new
                {
                    SystemMenuId = systemMenuId,
                    ButtonIds = buttonIds,
                    OpUserId = WebHelper.GetLogOnUserId()
                },
                () =>
                {
                    this.ClearCache<Button>();
                    this.ClearCache<SystemMenu>();
                });
        }

        /// <summary>
        /// 为角色分配权限。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <param name="args">菜单/按钮资源编号</param>
        /// <returns>服务执行响应信息</returns>
        public Response AllotPermissionByRole(string roleId, params string[] args)
        {
            return this.Create<SystemMenu>(PermissionNamespace,
                "AllotPermissionByRole",
                new
                {
                    RoleId = roleId,
                    CreateUserId = WebHelper.GetLogOnUserId(),
                    SystemMenuIds = args
                });
        }

        /// <summary>
        /// 获取系统菜单项。
        /// </summary>
        /// <param name="id">菜单编号</param>
        /// <returns>系统菜单信息</returns>
        public Response<SystemMenu> GetSystemMenu(string id)
        {
            return this.QueryForObject<SystemMenu>(PermissionNamespace, "GetSystemMenu", id);
        }

        /// <summary>
        /// 获取系统菜单项。
        /// </summary>
        /// <returns>服务执行结果</returns>
        public ResponseSet<SystemMenu> GetSystemMenus()
        {
            return this.QueryForList<SystemMenu>(
                PermissionNamespace, "GetSystemMenus",
                callback: rs => rs.Datas.AsSorted<SystemMenu, string>());
        }

        /// <summary>
        /// 获取标有用户拥有访问权限的菜单列表。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <returns>菜单列表</returns>
        public ResponseSet<SystemMenu> GetSystemMenusWithAllotedByUser(string id)
        {
            return this.QueryForList<SystemMenu>(
                PermissionNamespace, "GetSystemMenusWithAllotedByUser", id,
                rs => rs.Datas.AsSorted<SystemMenu, string>());
        }

        /// <summary>
        /// 获取标有角色拥有访问权限的菜单列表。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>菜单列表</returns>
        public ResponseSet<SystemMenu> GetSystemMenusWithAllotedByRole(string id)
        {
            return this.QueryForList<SystemMenu>(
                PermissionNamespace, "GetSystemMenusWithAllotedByRole", id,
                rs => rs.Datas.AsSorted<SystemMenu, string>());
        }

        /// <summary>
        /// 获取用户可访问的菜单列表。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <returns>菜单列表</returns>
        public ResponseSet<SystemMenu> GetAccessibleMenus(string userId)
        {
            return this.QueryForList<SystemMenu>(
                PermissionNamespace, "GetAccessibleMenusByUser",
                userId, rs => rs.Datas.AsSorted<SystemMenu, string>());
        }

        /// <summary>
        /// 获取当前页可访问的按钮列表。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="navigateUrl">当前页URL</param>
        /// <returns>按钮列表</returns>
        public ResponseSet<SystemMenu> GetAccessibleButtons(string userId, string navigateUrl)
        {
            return this.QueryForList<SystemMenu>(PermissionNamespace, "GetAccessibleButtons", new { UserId = userId, NavigateUrl = navigateUrl });
        }

        #endregion
    }
}
