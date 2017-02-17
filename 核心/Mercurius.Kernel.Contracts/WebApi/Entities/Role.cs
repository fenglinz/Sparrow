using System.ComponentModel.DataAnnotations;
using Mercurius.Prime.Core.Entities;

namespace Mercurius.Kernel.Contracts.WebApi.Entities
{
    /// <summary>
    /// Web API角色。
    /// </summary>
    [Table("WebApi.Role")]
    public class Role : WithModification
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
    }
}
  