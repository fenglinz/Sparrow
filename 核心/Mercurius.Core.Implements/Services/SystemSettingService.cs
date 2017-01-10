using Mercurius.Core.Interfaces.Entities;
using Mercurius.Core.Interfaces.Services;
using Mercurius.EntityBase;
using Mercurius.ServiceBase;
using Mercurius.RepositoryBase;

namespace Mercurius.Core.Implements.Services
{
    /// <summary>
    /// 系统设置服务接口实现。
    /// </summary>
    [Module("基础模块")]
    public class SystemSettingService : ServiceSupport, ISystemSettingService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Repositories.Core.SystemSetting";

        #endregion

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
                    this.Persistence.Create(NS, "SaveSetting", setting);

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
                () => this.Persistence.QueryForObject<SystemSetting>(NS, "GetSetting", name),
                name);
        }

        /// <summary>
        /// 获取系统配置信息。
        /// </summary>
        /// <param name="category">系统配置分类</param>
        /// <returns>系统配置信息集合</returns>
        public ResponseSet<SystemSetting> GetSettings(string category)
        {
            return this.InvokeService(
                nameof(GetSettings),
                () => this.Persistence.QueryForList<SystemSetting>(NS, "GetSettings", category),
                category);
        }

        #endregion
    }
}
