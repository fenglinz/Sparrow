using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mercurius.Prime.Core.Configuration
{
    /// <summary>
    /// swagger配置信息
    /// </summary>
    public class SwaggerElement : ConfigurationElement
    {
        #region Properties

        /// <summary>
        /// swagger访问目录.
        /// </summary>
        [ConfigurationProperty("path", DefaultValue = "/api/docs")]
        public string Path { get => base["path"]?.ToString(); set => base["path"] = value; }

        [ConfigurationProperty("title", DefaultValue = "接口文档|Swagger")]
        public string Title { get => base["title"]?.ToString(); set => base["title"] = value; }

        /// <summary>
        /// 接口文档说明
        /// </summary>
        [ConfigurationProperty("description", DefaultValue = "接口文档说明")]
        public string Description { get => base["description"]?.ToString(); set => base["description"] = value; }

        #endregion
    }
}
