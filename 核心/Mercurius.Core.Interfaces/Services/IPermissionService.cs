using Mercurius.Core.Interfaces.Entities;
using Mercurius.EntityBase;

namespace Mercurius.Core.Interfaces.Services
{
    /// <summary>
    /// 权限管理服务。
    /// </summary>
    public interface IPermissionService
    {
        /// <summary>
        /// 添加或者编辑系统菜单信息。
        /// </summary>
        /// <param name="systemMenu">系统菜单信息</param>
        /// <returns>服务执行结果</returns>
        Response CreateOrUpdate(SystemMenu systemMenu);

        /// <summary>
        /// 删除菜单。
        /// </summary>
        /// <param name="id">菜单编号</param>
        Response Remove(string id);

        /// <summary>
        /// 分配页面按钮资源。
        /// </summary>
        /// <param name="systemMenuId">系统菜单编号</param>
        /// <param name="buttonIds">按钮编号集合(以','号分隔)</param>
        Response AllotButtons(string systemMenuId, string buttonIds);

        /// <summary>
        /// 为角色分配权限。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <param name="args">菜单/按钮资源编号</param>
        /// <returns>服务执行响应信息</returns>
        Response AllotPermissionByRole(string roleId, params string[] args);

        /// <summary>
        /// 获取系统菜单项。
        /// </summary>
        /// <param name="id">菜单编号</param>
        /// <returns>系统菜单信息</returns>
        Response<SystemMenu> GetSystemMenu(string id);

        /// <summary>
        /// 获取系统菜单项。
        /// </summary>
        /// <returns>菜单列表</returns>
        ResponseSet<SystemMenu> GetSystemMenus();

        /// <summary>
        /// 获取标有用户拥有访问权限的菜单列表。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <returns>菜单列表</returns>
        ResponseSet<SystemMenu> GetSystemMenusWithAllotedByUser(string id);

        /// <summary>
        /// 获取标有角色拥有访问权限的菜单列表。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>菜单列表</returns>
        ResponseSet<SystemMenu> GetSystemMenusWithAllotedByRole(string id);

        /// <summary>
        /// 获取用户可访问的菜单列表。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <returns>菜单列表</returns>
        ResponseSet<SystemMenu> GetAccessibleMenus(string userId);

        /// <summary>
        /// 获取当前页可访问的按钮列表。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="navigateUrl">当前页URL</param>
        /// <returns>按钮列表</returns>
        ResponseSet<SystemMenu> GetAccessibleButtons(string userId, string navigateUrl);
    }
}
