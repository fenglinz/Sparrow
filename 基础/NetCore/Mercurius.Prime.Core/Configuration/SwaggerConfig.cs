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
    public class SwaggerConfig
    {
        #region Properties

        /// <summary>
        /// 文档标题
        /// </summary>
        public string Title { get; set; } = "接口文档|Swagger";

        /// <summary>
        /// 接口文档说明
        /// </summary>
        public string Description { get; set; } = "接口文档说明";

        #endregion
    }
}
