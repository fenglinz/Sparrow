using System.Web.Mvc;
using Mercurius.Kernel.Contracts.RBAC.Entities;
using Mercurius.Kernel.Contracts.RBAC.Services;
using Mercurius.Kernel.WebCores.Filters;

namespace Mercurius.Sparrow.Backstage.Areas.Admin.Controllers
{
    /// <summary>
    /// 组织机构管理控制器
    /// </summary>
    public class OrganizationController : BaseController
    {
        #region 属性

        /// <summary>
        /// 用户信息服务对象。
        /// </summary>
        public IUserService UserService { get; set; }

        /// <summary>
        /// 组织信息服务对象。
        /// </summary>
        public IOrganizationService OrganizationService { get; set; }

        #endregion

        /// <summary>
        /// 显示组织机构信息。
        /// </summary>
        /// <returns>组织机构信息界面</returns>
        public ActionResult Index()
        {
            this.ViewBag.Organizations = this.OrganizationService.GetOrganizations();

            return this.View();
        }

        /// <summary>
        /// 进入添加或修改组织信息界面
        /// </summary>
        /// <param name="id">组织机构编号</param>
        /// <param name="parentId">父级编号</param>
        /// <returns>组织机构详情界面</returns>
        public ActionResult CreateOrUpdate(string id, string parentId = "0")
        {
            this.ViewBag.ParentId = string.IsNullOrWhiteSpace(parentId) ? "0" : parentId;

            // 用于显示下拉框数据
            this.ViewBag.OrganizationList = this.OrganizationService.GetOrganizations();

            if (!string.IsNullOrWhiteSpace(id))
            {
                var rspOrg = this.OrganizationService.GetOrganizationById(id);

                if (!rspOrg.IsSuccess)
                {
                    this.ViewBag.ErrorMessage = rspOrg.ErrorMessage;
                }

                this.ViewBag.ParentId = rspOrg.Data?.ParentId;

                return this.View(rspOrg.Data);
            }

            return this.View();
        }

        /// <summary>
        /// 保存修改。
        /// </summary>
        /// <param name="org">组织机构信息</param>
        /// <returns>保存结果</returns>
        [HttpPost]
        [IgnorePermissionValid]
        [ValidateAntiForgeryToken]
        public ActionResult CreateOrUpdate(Organization org)
        {
            org.Initialize();

            var rsp = this.OrganizationService.CreateOrUpdate(org);

            return rsp.IsSuccess ? this.CloseDialogWithAlert("保存成功！") : this.Alert("保存失败，失败原因：" + rsp.ErrorMessage, AlertType.Error);
        }

        /// <summary>
        /// 删除组织机构信息。
        /// </summary>
        /// <param name="id">组织机构编号</param>
        /// <returns>删除结果信息</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult Remove(string id)
        {
            var rsp = this.OrganizationService.Remove(id);

            return Json(rsp);
        }
    }
}
