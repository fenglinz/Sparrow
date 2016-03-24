﻿using Mercurius.Sparrow.Entities.RBAC;

namespace Mercurius.Sparrow.Contracts.RBAC
{
    /// <summary>
    /// 按钮信息服务接口。
    /// </summary>
    public interface IButtonService
    {
        /// <summary>
        /// 新增或更新按钮信息。
        /// </summary>
        /// <param name="button">按钮信息</param>
        /// <returns>执行结果</returns>
        Response CreateOrUpdate(Button button);

        /// <summary>
        /// 获取指定按钮信息。
        /// </summary>
        /// <param name="id">按钮编号</param>
        /// <returns>按钮信息</returns>
        Response<Button> GetButton(string id);

        /// <summary>
        /// 获取按钮信息。
        /// </summary>
        /// <returns>按钮信息列表</returns>
        ResponseCollection<Button> GetButtons();

        /// <summary>
        /// 获取链接未使用的按钮信息。
        /// </summary>
        /// <param name="systemMenuId">链接编号</param>
        /// <returns>按钮信息列表</returns>
        ResponseCollection<Button> GetUnUsedButtons(string systemMenuId);
    }
}
