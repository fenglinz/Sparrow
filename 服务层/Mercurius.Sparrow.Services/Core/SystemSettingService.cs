using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Contracts.Core;
using Mercurius.Sparrow.Entities;
using Mercurius.Sparrow.Entities.Core;
using Mercurius.Sparrow.Services.Support;
using static Mercurius.Sparrow.Repositories.StatementNamespaces.Core;

namespace Mercurius.Sparrow.Services.Core
{
    /// <summary>
    /// 系统设置服务接口实现。
    /// </summary>
    [Module("基础模块")]
    public class SystemSettingService : ServiceSupport, ISystemSettingService
    {
        #region ISystemSettingService接口实现

        /// <summary>
        /// 保存系统配置信息。
        /// </summary>
        /// <param name="setting">系统配置信息</param>
        /// <returns>保存结果</returns>
        public Response SaveSetting(SystemSetting setting)
        {
            return this.InvokeService(
                nameof(SaveSetting),
                () =>
                {
                    this.Persistence.Create(SystemsettingNamespace, "SaveSetting", setting);

                    this.ClearCache<SystemSetting>();

                    if (setting != null && setting.Name == "LogLevel")
                    {
                        this.Cache.Remove(Constants.LogerLevelCacheKey);
                    }
                });
        }

        /// <summary>
        /// 获取系统配置信息。
        /// </summary>
        /// <param name="name">系统配置名称</param>
        /// <returns>系统配置信息</returns>
        public Response<SystemSetting> GetSetting(string name)
        {
            return this.InvokeService(
                nameof(GetSetting),
                () => this.Persistence.QueryForObject<SystemSetting>(SystemsettingNamespace, "GetSetting", name),
                args: name);
        }

        /// <summary>
        /// 获取系统配置信息。
        /// </summary>
        /// <param name="category">系统配置分类</param>
        /// <returns>系统配置信息集合</returns>
        public ResponseCollection<SystemSetting> GetSettings(string category)
        {
            return this.InvokeService(
                nameof(GetSettings),
                () => this.Persistence.QueryForList<SystemSetting>(SystemsettingNamespace, "GetSettings", category),
                args: category);
        }

        #endregion
    }
}
