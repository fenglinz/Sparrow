using System;
using System.ComponentModel.DataAnnotations;

namespace Mercurius.Prime.Core.Entity
{
    /// <summary>
    /// 具有创建信息的实体。
    /// </summary>
    public abstract class CreationEntityBase : EntityBase
    {
        #region 属性

        /// <summary>
        /// 创建者编号。
        /// </summary>
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string CreateUserId { get; set; }

        /// <summary>
        /// 创建时间。
        /// </summary>
        [Display(Name = "创建时间")]
        public virtual DateTime? CreateDateTime { get; set; }

        #endregion

        #region 业务属性

        /// <summary>
        /// 创建者姓名。
        /// </summary>
        [Display(Name = "创建者")]
        public virtual string CreateUserName { get; set; }

        #endregion

        #region 公开方法

        /// <summary>
        /// 初始化创建者信息。
        /// </summary>
        public virtual void Initialize()
        {
            this.CreateUserId = WebHelper.GetLogOnUserId();
            this.CreateDateTime = DateTime.Now;
        }

        #endregion
    }
}
