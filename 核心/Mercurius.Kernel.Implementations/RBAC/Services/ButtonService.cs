using Mercurius.Kernel.Contracts.RBAC.Entities;
using Mercurius.Kernel.Contracts.RBAC.Services;
using Mercurius.Prime.Core.Services;
using Mercurius.Prime.Data.Support;

namespace Mercurius.Kernel.Implementations.RBAC.Services
{
    /// <summary>
    /// 按钮信息服务接口实现。
    /// </summary>
    [Module("基于角色的访问控制模块")]
    public class ButtonService : ServiceSupport, IButtonService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Kernel.Repositories.RBAC.Button";

        #endregion

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
                    this.Persistence.Update(NS, "CreateOrUpdate", button);

                    this.ClearCache<Button>();
                    this.ClearCache<SystemMenu>();
                },
                button);
        }

        /// <summary>
        /// 删除按钮信息。
        /// </summary>
        /// <param name="id">按钮编号</param>
        /// <returns>删除结果</returns>
        public Response Remove(string id)
        {
            return this.InvokeService(nameof(Remove), () =>
            {
                this.Persistence.Delete(NS, "Remove", id);

                this.ClearCache<Button>();
            }, id);
        }

        /// <summary>
        /// 获取指定按钮信息。
        /// </summary>
        /// <param name="id">按钮编号</param>
        /// <returns>按钮信息</returns>
        public Response<Button> GetButtonById(string id)
        {
            return this.InvokeService(
                nameof(GetButtonById),
                () => this.Persistence.QueryForObject<Button>(NS, "GetButtonById", id), id);
        }

        /// <summary>
        /// 获取按钮信息。
        /// </summary>
        /// <returns>按钮信息列表</returns>
        public ResponseSet<Button> GetButtons()
        {
            return this.InvokeService(nameof(GetButtons), () => this.Persistence.QueryForList<Button>(NS, "GetButtons"));
        }

        /// <summary>
        /// 获取链接未使用的按钮信息。
        /// </summary>
        /// <param name="systemMenuId">链接编号</param>
        /// <returns>按钮信息列表</returns>
        public ResponseSet<Button> GetButtonsWithAllot(string systemMenuId)
        {
            return this.InvokeService(nameof(GetButtonsWithAllot),
                () => this.Persistence.QueryForList<Button>(NS, "GetButtonsWithAllot", systemMenuId), systemMenuId);
        }

        #endregion
    }
}
