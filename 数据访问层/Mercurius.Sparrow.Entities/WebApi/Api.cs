using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Entities.Swagger;

namespace Mercurius.Sparrow.Entities.WebApi
{
    /// <summary>
    /// Web API信息。
    /// </summary>
    public class Api : ModificationDomain
    {
        #region 属性

        /// <summary>
        /// 编号。
        /// </summary>
        [Display(Name = "编号")]
        public virtual int Id { get; set; }

        /// <summary>
        /// 父级ID
        /// </summary>
        [Display(Name = "父级ID")]
        public virtual int? ParentId { get; set; }

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
        /// 控制器类型
        /// </summary>
        [Display(Name = "控制器类型")]
        public int? Type { get; set; }

        /// <summary>
        /// 控制器名称
        /// </summary>
        [Display(Name = "控制器名称")]
        public virtual string Controller { get; set; }

        /// <summary>
        /// 描述。
        /// </summary>
        [Display(Name = "描述")]
        [StringLength(2000, ErrorMessage = "描述不能超过{1}个字符。")]
        public virtual string Description { get; set; }

        /// <summary>
        /// 获取或者设置用户是否具有访问权限。
        /// </summary>
        public virtual int CanAccess { get; set; }

        /// <summary>
        /// 排序
        /// </summary>
        [Display(Name = "排序")]
        public virtual int? Sort { get; set; }

        #endregion

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
                    Controller = _item.get.tags[0];
                }
                else if (_item.post != null)
                {
                    HttpVerb = "POST";
                    Description = _item.post.summary;
                    Controller = _item.post.tags[0];
                }
                else if (_item.put != null)
                {
                    HttpVerb = "PUT";
                    Description = _item.put.summary;
                    Controller = _item.put.tags[0];
                }
                else
                {
                    HttpVerb = "DELETE";
                    Description = _item.delete.summary;
                    Controller = _item.delete.tags[0];
                }
            }
        }

        /// <summary>
        /// 转换
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public Api ToNewApi(Api model)
        {
            //this.Id = model.Id > 0 ? model.Id : this.Id;
            this.Route = model.Route;
            this.Description = model.Description;
            this.HttpVerb = model.HttpVerb;
            this.ModifyDateTime = DateTime.Now;
            this.ModifyUserId = WebHelper.GetLogOnUserId() ?? string.Empty;
            this.ModifyUserName = WebHelper.GetLogOnUserName() ?? string.Empty;

            return this;
        }
    }
}
