using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Sparrow.Contracts.RBAC;
using Mercurius.Sparrow.Entities;
using Mercurius.Sparrow.Entities.RBAC;

namespace Mercurius.Sparrow.Backstage.Areas.Admin.Controllers
{
    /// <summary>
    /// 部门管理控制器
    /// </summary>
    public class OrganizationController : BaseController
    {
        #region 属性

        /// <summary>
        /// 获取或设置组织信息
        /// </summary>
        public IOrganizationService OrganizationService { get; set; }

        #endregion

        public ActionResult Index()
        {
            var orgInfos = this.OrganizationService.GetOrganizations();

            this.ViewBag.Organizations = orgInfos;

            return this.View();
        }

        /// <summary>
        /// 进入添加或修改组织信息界面
        /// </summary>
        /// <param name="id"></param>
        /// <param name="parentId"></param>
        /// <returns></returns>
        public ActionResult CreateOrUpdate(string id, string parentId = "0")
        {
            this.ViewBag.ParentId = string.IsNullOrWhiteSpace(parentId) ? "0" : parentId;

            //用于显示下拉框数据
            this.ViewBag.OrganizationList = this.OrganizationService.GetOrganizations();

            if (!string.IsNullOrWhiteSpace(id))
            {
                //获取指定ID组织信息
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
        /// 新增，编辑执行
        /// </summary>
        /// <param name="org"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateOrUpdate(Organization org)
        {
            //判断新增，修改
            if (string.IsNullOrWhiteSpace(org.Id))
            {
                org.Id = Guid.NewGuid().ToString();
            }

            org.Initialize();

            //验证通过
            if (org.IsValid())
            {
                var rsp = this.OrganizationService.CreateOrUpdate(org);
                if (!rsp.IsSuccess)
                {
                    return this.Alert("执行失败，失败原因：" + rsp.ErrorMessage);
                }
            }
            else
            {
                return this.Alert(this.ConvertToHtml(org.GetErrorMessage()));
            }

            return this.CloseDialogWithAlert("执行成功！");
        }
    }
}
