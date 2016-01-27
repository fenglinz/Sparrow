using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace Mercurius.Sparrow.Entities.Chart
{
    /// <summary>
    /// 图表列信息。
    /// </summary>
    public class Series
    {
        #region 属性

        /// <summary>
        /// 获取或者设置图表标签。
        /// </summary>
        [JsonProperty("name")]
        public virtual object Name { get; set; }

        /// <summary>
        /// 获取或者设置图表值。
        /// </summary>
        [JsonProperty("data")]
        public virtual IList<object> Datas { get; set; }

        #endregion
    }
}
