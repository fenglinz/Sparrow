using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Contracts.RBAC;
using Mercurius.Sparrow.Entities;
using Mercurius.Sparrow.Entities.RBAC;
using Mercurius.Sparrow.Services.Support;
using static Mercurius.Sparrow.Repositories.StatementNamespaces.RBAC;

namespace Mercurius.Sparrow.Services.RBAC
{
    /// <summary>
    /// 按钮信息服务接口实现。
    /// </summary>
    [Module("基于角色的访问控制模块")]
    public class ButtonService : ServiceSupport, IButtonService
    {
        #region IButtonService接口实现

        /// <summary>
        /// 新增或更新按钮信息。
        /// </summary>
        /// <param name="button">按钮信息</param>
        /// <returns>执行结果</returns>
        public Response CreateOrUpdate(Button button)
        {
            return this.InvokeService(
                nameof(CreateOrUpdate),
                () =>
                {
                    this.Persistence.Update(ButtonNamespace, "CreateOrUpdate", button);

                    this.ClearCache<Button>();
                    this.ClearCache<SystemMenu>();
                },
                button);
        }

        /// <summary>
        /// 获取指定按钮信息。
        /// </summary>
        /// <param name="id">按钮编号</param>
        /// <returns>按钮信息</returns>
        public Response<Button> GetButton(string id)
        {
            return this.InvokeService(
                nameof(GetButton),
                () => this.Persistence.QueryForObject<Button>(ButtonNamespace, "GetButtons", id),
                id);
        }

        /// <summary>
        /// 获取按钮信息。
        /// </summary>
        /// <returns>按钮信息列表</returns>
        public ResponseCollection<Button> GetButtons()
        {
            return this.InvokeService(nameof(GetButtons), () => this.Persistence.QueryForList<Button>(ButtonNamespace, "GetButtons"));
        }

        /// <summary>
        /// 获取链接未使用的按钮信息。
        /// </summary>
        /// <param name="systemMenuId">链接编号</param>
        /// <returns>按钮信息列表</returns>
        public ResponseCollection<Button> GetUnUsedButtons(string systemMenuId)
        {
            return this.InvokeService(nameof(GetUnUsedButtons),
                () => this.Persistence.QueryForList<Button>(ButtonNamespace, "GetUnUsedButtons", systemMenuId),
                systemMenuId);
        }

        #endregion
    }
}
