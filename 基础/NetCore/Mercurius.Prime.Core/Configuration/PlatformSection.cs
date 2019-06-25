using System.Collections.Generic;
using System.Collections.Specialized;
using Microsoft.Extensions.Configuration;

namespace Mercurius.Prime.Core.Configuration
{
    /// <summary>
    /// 平台配置分类信息
    /// </summary>
    public class PlatformSection
    {
        #region Fields

        /// <summary>
        /// 配置对象
        /// </summary>
        private static IConfigurationSection platformSection;

        #endregion

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
        public LogOption Log { get; set; }

        /// <summary>
        /// oauth认证配置信息
        /// </summary>
        public OAuthOption OAuth { get; set; }

        /// <summary>
        /// Swagger配置
        /// </summary>
        public SwaggerOption Swagger { get; set; }

        /// <summary>
        /// 默认数据库连接信息
        /// </summary>
        public ConnectionStringOptions ConnectionStrings { get; set; }

        /// <summary>
        /// 获取redis配置信息
        /// </summary>
        public RedisOption Redis { get; set; }

        /// <summary>
        /// rabbit mq配置信息
        /// </summary>
        public RabbitMQOption RabbitMQ { get; set; }

        /// <summary>
        /// 安全配置信息
        /// </summary>
        public SecurityOption Security { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public IList<KeyValueOption> Settings { get; set; }

        #endregion

        #region Logic Properties

        /// <summary>
        /// 获取配置信息
        /// </summary>
        public static PlatformSection Instance { get; private set; }

        #endregion

        #region Public Methods

        /// <summary>
        /// 初始化配置信息
        /// </summary>
        /// <param name="configuration"></param>
        public static void Initialize(IConfiguration configuration)
        {
            platformSection = configuration.GetSection("Platform");

            Instance = platformSection.Get<PlatformSection>();

            var connections = platformSection.GetSection("ConnectionStrings");

            if (connections != null)
            {
                var children = connections.GetChildren();

                foreach (var item in children)
                {
                    if (item.Key == "Master" || item.Key == "Slave")
                    {
                        continue;
                    }

                    Instance.ConnectionStrings[item.Key] = item.Get<ConnectionStringOptions>();
                }
            }
        }

        #endregion
    }
}
