using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mercurius.Prime.Core.Utils;

namespace Mercurius.Prime.Core.Entities
{
    /// <summary>
    /// 具有修改者信息的实体。
    /// </summary>
    public abstract class WithModification : WithCreation
    {
        #region 属性

        /// <summary>
        /// 修改者编号。
        /// </summary>
        [StringLength(36, ErrorMessageResourceType = typeof(Constants),
            ErrorMessageResourceName = "MaxStringLength")]
        public virtual string ModifyUserId { get; set; }

        /// <summary>
        /// 修改时间。
        /// </summary>
        [Display(Name = "修改时间")]
        public virtual DateTime? ModifyDateTime { get; set; }

        #endregion

        #region 业务属性

        /// <summary>
        /// 修改者姓名。
        /// </summary>
        [Display(Name = "修改者")]
        public virtual string ModifyUserName { get; set; }

        #endregion

        #region 公开方法

        /// <summary>
        /// 初始化添加者&amp;修改者信息。
        /// </summary>
        public override void Initialize()
        {
            base.Initialize();

            this.ModifyUserId = WebHelper.GetLogOnUserId();
            this.ModifyDateTime = DateTime.Now;
        }

        #endregion
    }
}
