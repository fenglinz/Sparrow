using Mercurius.Prime.Core.Services;

namespace Mercurius.Kernel.Contracts.Dynamic.SearchObjects
{
    /// <summary>
    /// 扩展属性查询条件。
    /// </summary>
    public class ExtensionPropertySO : SearchObject
    {
        #region 属性

        /// <summary>
        /// 分类。
        /// </summary>
        public virtual string Category { get; set; }

        #endregion
    }
}
