using System.Collections.Generic;
using Microsoft.Extensions.Configuration;

namespace Mercurius.Prime.Core.Configuration
{
    /// <summary>
    /// 平台配置分类信息
    /// </summary>
    public class PlatformConfig
    {
        #region Properties

        /// <summary>
        /// 上床文件保存目录
        /// </summary>
        public string SavedUploadFilesRoot { get; set; } = "uploads";

        /// <summary>
        /// 每页显示的记录数
        /// </summary>
        public int PageSize { get; set; } = 20;

        /// <summary>
        /// 日志配置信息
        /// </summary>
        public LogConfig Log { get; set; }

        /// <summary>
        /// oauth认证配置信息
        /// </summary>
        public OAuthConfig OAuth { get; set; }

        /// <summary>
        /// Swagger配置
        /// </summary>
        public SwaggerConfig Swagger { get; set; }

        /// <summary>
        /// 数据库连接信息
        /// </summary>
        public ConnectionStrings ConnectionStrings { get; set; }

        /// <summary>
        /// 获取redis配置信息
        /// </summary>
        public RedisConfig Redis { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public IList<KeyValueConfig> Settings { get; set; }

        #endregion

        #region Logic Properties

        /// <summary>
        /// 获取配置信息
        /// </summary>
        public static PlatformConfig Instance { get; private set; }

        #endregion

        #region Public Methods

        /// <summary>
        /// 初始化配置信息
        /// </summary>
        /// <param name="configuration"></param>
        public static void Initialize(IConfiguration configuration)
        {
            Instance = configuration.GetSection("Platform").Get<PlatformConfig>();
        }

        #endregion
    }
}
