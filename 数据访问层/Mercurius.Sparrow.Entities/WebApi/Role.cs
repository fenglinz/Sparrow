using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace Mercurius.Siskin.Entities.WebApi
{
    /// <summary>
    /// Web API角色。
    /// </summary>
    public class Role : ModificationDomain
    {
        #region 属性
    
        /// <summary>
        /// 编号。
        /// </summary>
        [Display(Name = "编号")]
        public virtual int Id { get; set; }
        
        /// <summary>
        /// 名称。
        /// </summary>
        [Display(Name = "名称")]
        [StringLength(50, ErrorMessage = "名称不能超过{1}个字符。")]
        public virtual string Name { get; set; }
        
        /// <summary>
        /// 描述。
        /// </summary>
        [Display(Name = "描述")]
        [StringLength(2000, ErrorMessage = "描述不能超过{1}个字符。")]
        public virtual string Description { get; set; }

        #endregion

        #region 业务属性

        public IList<int> RolePermissions { get; set; }

        #endregion
    }
}
  