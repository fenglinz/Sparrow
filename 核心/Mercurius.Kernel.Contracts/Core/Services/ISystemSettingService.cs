﻿using Mercurius.Kernel.Contracts.Core.Entities;
using Mercurius.Prime.Core.Services;

namespace Mercurius.Kernel.Contracts.Core.Services
{
    /// <summary>
    /// 系统参数设置服务接口。
    /// </summary>
    public interface ISystemSettingService
    {
        /// <summary>
        /// 保存系统配置信息。
        /// </summary>
        /// <param name="setting">系统配置信息</param>
        /// <returns>保存结果</returns>
        Response SaveSetting(SystemSetting setting);

        /// <summary>
        /// 获取系统配置信息。
        /// </summary>
        /// <param name="name">系统配置名称</param>
        /// <returns>系统配置信息</returns>
        Response<SystemSetting> GetSetting(string name);

        /// <summary>
        /// 获取系统配置信息。
        /// </summary>
        /// <param name="category">系统配置分类</param>
        /// <returns>系统配置信息集合</returns>
        ResponseSet<SystemSetting> GetSettings(string category);
    }
}
