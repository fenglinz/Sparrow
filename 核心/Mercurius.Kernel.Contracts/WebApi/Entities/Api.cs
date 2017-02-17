using System.ComponentModel.DataAnnotations;
using Mercurius.Kernel.Contracts.Swagger.Entities;
using Mercurius.Prime.Core.Entities;

namespace Mercurius.Kernel.Contracts.WebApi.Entities
{
    /// <summary>
    /// Web API信息。
    /// </summary>
    [Table("WebApi.Api")]
    public class Api : WithModification
    {
        #region 属性

        /// <summary>
        /// 编号。
        /// </summary>
        [Display(Name = "编号")]
        public virtual int Id { get; set; }

        /// <summary>
        /// Http路由。
        /// </summary>
        [Display(Name = "Http路由")]
        [StringLength(500, ErrorMessage = "Http路由不能超过{1}个字符。")]
        public virtual string Route { get; set; }

        /// <summary>
        /// Http谓词。
        /// </summary>
        [Display(Name = "Http谓词")]
        [StringLength(50, ErrorMessage = "Http谓词不能超过{1}个字符。")]
        public virtual string HttpVerb { get; set; }

        /// <summary>
        /// 描述。
        /// </summary>
        [Display(Name = "描述")]
        [StringLength(2000, ErrorMessage = "描述不能超过{1}个字符。")]
        public virtual string Description { get; set; }

        #endregion

        #region 业务属性

        /// <summary>
        /// 是否拥有权限。
        /// </summary>
        public bool HasPermission { get; set; }

        private PathItem _item;

        public PathItem Item
        {
            get
            {
                return _item;
            }
            set
            {
                _item = value;
                if (value == null) return;
                if (_item.get != null)
                {
                    HttpVerb = "GET";
                    Description = _item.get.summary;
                }
                else if (_item.post != null)
                {
                    HttpVerb = "POST";
                    Description = _item.post.summary;
                }
                else if (_item.put != null)
                {
                    HttpVerb = "PUT";
                    Description = _item.put.summary;
                }
                else
                {
                    HttpVerb = "DELETE";
                    Description = _item.delete.summary;
                }
            }
        }

        #endregion
    }
}
