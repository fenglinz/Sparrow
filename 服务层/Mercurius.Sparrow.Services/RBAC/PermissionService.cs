using System;
using System.Linq;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Contracts.RBAC;
using Mercurius.Sparrow.Entities;
using Mercurius.Sparrow.Entities.RBAC;
using Mercurius.Sparrow.Services.Support;
using static Mercurius.Sparrow.Repositories.StatementNamespaces.RBAC;

namespace Mercurius.Sparrow.Services.RBAC
{
    /// <summary>
    /// 权限管理服务接口实现。
    /// </summary>
    [Module("基于角色的访问控制模块")]
    public class PermissionService : ServiceSupport, IPermissionService
    {
        #region IPermissionService接口实现

        /// <summary>
        /// 删除菜单。
        /// </summary>
        /// <param name="id">菜单编号</param>
        public Response Remove(string id)
        {
            return this.InvokeService(
                nameof(Remove),
                () =>
                {
                    this.Persistence.Delete(PermissionNamespace, "DeleteSystemMenu", id);

                    this.ClearCache<Button>();
                    this.ClearCache<SystemMenu>();
                },
                id);
        }

        /// <summary>
        /// 添加或者编辑系统菜单信息。
        /// </summary>
        /// <param name="systemMenu">系统菜单信息</param>
        /// <returns>服务执行结果</returns>
        public Response CreateOrUpdate(SystemMenu systemMenu)
        {
            return this.InvokeService(
                nameof(CreateOrUpdate),
                () =>
                {
                    this.Persistence.Create(PermissionNamespace, "CreateOrUpdateSystemMenu", systemMenu);

                    this.ClearCache<SystemMenu>();
                },
                systemMenu);
        }

        /// <summary>
        /// 添加页面按钮资源。
        /// </summary>
        /// <param name="systemMenuId">系统菜单编号</param>
        /// <param name="buttonId">按钮编号</param>
        public Response AddSystemMenuButton(string systemMenuId, string buttonId)
        {
            return this.InvokeService(
                nameof(AddSystemMenuButton),
                () =>
                {
                    var button = this.Persistence.QueryForObject<Button>(ButtonNamespace, "GetButtons", buttonId);

                    if (button != null)
                    {
                        var count = this.Persistence.QueryForObject<int>(PermissionNamespace, "CheckSystemButtonExists", new { ParentId = systemMenuId, ButtonName = buttonId });

                        if (count > 0)
                        {
                            throw new Exception("按钮已经添加！");
                        }

                        button.Sort = this.Persistence.QueryForObject<int>(PermissionNamespace, "NewSystemMenuButtonSort", systemMenuId);

                        this.Persistence.Create(
                            PermissionNamespace,
                            "CreateOrUpdateSystemMenu",
                            new SystemMenu
                            {
                                Id = Guid.NewGuid().ToString(),
                                ParentId = systemMenuId,
                                Name = button.Name,
                                Title = button.Title,
                                Image = button.Image,
                                Category = 3,
                                NavigateUrl = button.Code,
                                Target = "OnClick",
                                Sort = button.Sort,
                                CreateUserId = WebHelper.GetLogOnUserId(),
                                CreateDateTime = DateTime.Now
                            });

                        this.ClearCache<Button>();
                        this.ClearCache<SystemMenu>();
                    }
                },
                systemMenuId,
                buttonId);
        }

        /// <summary>
        /// 为角色分配权限。
        /// </summary>
        /// <param name="roleId">角色编号</param>
        /// <param name="args">菜单/按钮资源编号</param>
        /// <returns>服务执行响应信息</returns>
        public Response AllotPermissionByRole(string roleId, params string[] args)
        {
            return this.InvokeService(
                nameof(AllotPermissionByRole),
                () =>
                {
                    var permissions = args.IsEmpty() ? null : args.Select(arg => new RolePermission
                    {
                        Id = Guid.NewGuid().ToString(),
                        RoleId = roleId,
                        SystemMenuId = arg,
                        CreateUserId = WebHelper.GetLogOnUserId(),
                        CreateDateTime = DateTime.Now
                    }).ToList();

                    this.Persistence.Create(PermissionNamespace, "AllotPermissionByRole", new { RoleId = roleId, RolePermissions = permissions });

                    this.ClearCache<SystemMenu>();
                },
                roleId,
                args);
        }

        /// <summary>
        /// 为用户组分配权限。
        /// </summary>
        /// <param name="userGroupId">用户组编号</param>
        /// <param name="args">菜单/按钮资源</param>
        /// <returns>服务执行响应信息</returns>
        public Response AllotPermissionByUserGroup(string userGroupId, params string[] args)
        {
            return this.InvokeService(
                nameof(AllotPermissionByUserGroup),
                () =>
                {
                    var permissions = args.IsEmpty() ? null : args.Select(arg => new UserGroupPermission
                    {
                        Id = Guid.NewGuid().ToString(),
                        UserGroupId = userGroupId,
                        SystemMenuId = arg,
                        CreateUserId = WebHelper.GetLogOnUserId(),
                        CreateDateTime = DateTime.Now
                    }).ToList();

                    this.Persistence.Create(PermissionNamespace, "AllotPermissionByUserGroup", new { UserGroupId = userGroupId, UserGroupPermissions = permissions });

                    this.ClearCache<SystemMenu>();
                },
                userGroupId,
                args);
        }

        /// <summary>
        /// 获取系统菜单项。
        /// </summary>
        /// <param name="id">菜单编号</param>
        /// <returns>系统菜单信息</returns>
        public Response<SystemMenu> GetSystemMenu(string id)
        {
            return this.InvokeService(
                nameof(GetSystemMenu),
                () => this.Persistence.QueryForObject<SystemMenu>(PermissionNamespace, "GetSystemMenu", id),
                args: id);
        }

        /// <summary>
        /// 获取系统菜单项。
        /// </summary>
        /// <returns>服务执行结果</returns>
        public ResponseCollection<SystemMenu> GetSystemMenus()
        {
            return this.InvokeService(
                nameof(GetSystemMenus),
                () => this.Persistence.QueryForList<SystemMenu>(PermissionNamespace, "GetSystemMenus").AsSorted<SystemMenu, string>());
        }

        /// <summary>
        /// 获取菜单的按钮菜单列表。
        /// </summary>
        /// <param name="id">菜单编号</param>
        /// <returns>按钮菜单列表</returns>
        public ResponseCollection<SystemMenu> GetSystemMenuButtons(string id)
        {
            return this.InvokeService(
                nameof(GetSystemMenuButtons),
                () => this.Persistence.QueryForList<SystemMenu>(PermissionNamespace, "GetSystemMenuButtons", id),
                args: id);
        }

        /// <summary>
        /// 根据用户编号获取标有访问权限的菜单列表。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <returns>菜单列表</returns>
        public ResponseCollection<SystemMenu> GetSystemMenusWithAlloted(string userId)
        {
            return this.InvokeService(
                nameof(GetSystemMenusWithAlloted),
                () => this.Persistence.QueryForList<SystemMenu>(PermissionNamespace, "GetSystemMenusWithAlloted", userId).AsSorted<SystemMenu, string>(),
                args: userId);
        }

        /// <summary>
        /// 获取标有用户拥有访问权限的菜单列表。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <returns>菜单列表</returns>
        public ResponseCollection<SystemMenu> GetSystemMenusWithAllotedByUser(string id)
        {
            return this.InvokeService(
                nameof(GetSystemMenusWithAllotedByUser),
                () => this.Persistence.QueryForList<SystemMenu>(PermissionNamespace, "GetSystemMenusWithAllotedByUser", id).AsSorted<SystemMenu, string>(),
                args: id);
        }

        /// <summary>
        /// 获取标有角色拥有访问权限的菜单列表。
        /// </summary>
        /// <param name="id">角色编号</param>
        /// <returns>菜单列表</returns>
        public ResponseCollection<SystemMenu> GetSystemMenusWithAllotedByRole(string id)
        {
            return this.InvokeService(
                nameof(GetSystemMenusWithAllotedByRole),
                () => this.Persistence.QueryForList<SystemMenu>(PermissionNamespace, "GetSystemMenusWithAllotedByRole", id).AsSorted<SystemMenu, string>(),
                args: id);
        }

        /// <summary>
        /// 获取标有用户组拥有访问权限的菜单列表。
        /// </summary>
        /// <param name="id">用户组编号</param>
        /// <returns>菜单列表</returns>
        public ResponseCollection<SystemMenu> GetSystemMenusWithAllotedByUserGroup(string id)
        {
            return this.InvokeService(
                nameof(GetSystemMenusWithAllotedByUserGroup),
                () => this.Persistence.QueryForList<SystemMenu>(PermissionNamespace, "GetSystemMenusWithAllotedByUserGroup", id).AsSorted<SystemMenu, string>(),
                args: id);
        }

        /// <summary>
        /// 获取用户用户可访问的菜单列表。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <returns>菜单列表</returns>
        public ResponseCollection<SystemMenu> GetAccessibleMenus(string userId)
        {
            return this.InvokeService(
                nameof(GetAccessibleMenus),
                () => this.Persistence.QueryForList<SystemMenu>(PermissionNamespace, "GetAccessibleMenusByUser", userId).AsSorted<SystemMenu, string>(),
                args: userId);
        }

        /// <summary>
        /// 获取当前页可访问的按钮列表。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="navigateUrl">当前页URL</param>
        /// <returns>按钮列表</returns>
        public ResponseCollection<SystemMenu> GetAccessibleButtons(string userId, string navigateUrl)
        {
            return this.InvokeService(
                nameof(GetAccessibleButtons),
                () => this.Persistence.QueryForList<SystemMenu>(PermissionNamespace, "GetAccessibleButtons", new { UserId = userId, NavigateUrl = navigateUrl }),
                true,
                userId,
                navigateUrl);
        }

        #endregion
    }
}
