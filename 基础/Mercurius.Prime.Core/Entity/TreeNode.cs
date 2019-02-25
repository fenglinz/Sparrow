using System.Collections.Generic;
using Newtonsoft.Json;

namespace Mercurius.Prime.Core.Entity
{
    /// <summary>
    /// 树节点信息。
    /// </summary>
    public class TreeNode
    {
        #region 属性

        /// <summary>
        /// 树节点编号。
        /// </summary>
        [JsonProperty("id")]
        public string Id { get; set; }

        /// <summary>
        /// 树节点显示文本。
        /// </summary>
        [JsonProperty("text")]
        public string Text { get; set; }

        /// <summary>
        /// 树节点时候选中。
        /// </summary>
        [JsonProperty("checked")]
        public bool Checked { get; set; }

        /// <summary>
        /// 树的子节点。
        /// </summary>
        [JsonProperty("nodes", NullValueHandling = NullValueHandling.Ignore)]
        public IEnumerable<TreeNode> Children { get; set; }

        #endregion
    }
}
