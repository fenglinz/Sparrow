using Mercurius.Prime.Core.Services;

namespace Mercurius.Kernel.Contracts.WebApi.SearchObjects
{
    /// <summary>
    /// WebApi用户查询条件。
    /// </summary>
    public class UserSO : SearchObject
    {
        #region 属性

        /// <summary>
        /// 账号。
        /// </summary>
        public virtual string Account { get; set; }

        /// <summary>
        /// 使用者描述。
        /// </summary>
        public virtual string Description { get; set; }

        /// <summary>
        /// 状态。
        /// </summary>
        public virtual int? Status { get; set; }

        #endregion
    }
}
