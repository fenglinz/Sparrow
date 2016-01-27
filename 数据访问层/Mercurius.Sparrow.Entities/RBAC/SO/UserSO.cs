using System;

namespace Mercurius.Sparrow.Entities.RBAC.SO
{
    /// <summary>
    /// 用户信息搜索条件。
    /// </summary>
    public class UserSO : SearchObject
    {
        #region 属性

        /// <summary>
        /// 获取或者设置排除的报告人。
        /// </summary>
        public virtual string ExcludeReporter { get; set; }

        /// <summary>
        /// 获取或者设置用户所在部门编号。
        /// </summary>
        public virtual string OrganizationId { get; set; }

        /// <summary>
        /// 获取或者设置查询分类。
        /// </summary>
        public virtual string SearchCategory { get; set; }

        /// <summary>
        /// 获取或者设置查询值。
        /// </summary>
        public virtual string SearchValue { get; set; }

        #endregion
    }
}
