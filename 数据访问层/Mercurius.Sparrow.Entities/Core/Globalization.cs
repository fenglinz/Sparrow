using System;
using Mercurius.Infrastructure.Ado;

namespace Mercurius.Sparrow.Entities.Core
{
    /// <summary>
    /// 全球化信息。
    /// </summary>
    [Table("Globalization")]
    public class Globalization : Domain
    {
        #region 属性

        /// <summary>
        /// 资源Id
        /// </summary>
        public virtual string Id { get; set; }

        /// <summary>
        /// MVC区域
        /// </summary>
        public virtual string Area { get; set; }

        /// <summary>
        /// MVC控制器
        /// </summary>
        public virtual string Controller { get; set; }

        /// <summary>
        /// MVC视图
        /// </summary>
        public virtual string View { get; set; }

        /// <summary>
        /// 资源Key
        /// </summary>
        public virtual string Key { get; set; }

        /// <summary>
        /// 资源Value
        /// </summary>
        public virtual string Value { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        public virtual string Remark { get; set; }

        #endregion
    }
}
