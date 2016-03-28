using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Sparrow.Contracts.RBAC;
using Mercurius.Sparrow.Entities;
using Mercurius.Sparrow.Entities.RBAC;
using Mercurius.Sparrow.Entities.RBAC.SO;

namespace Mercurius.Sparrow.Backstage.Areas.Admin.Controllers
{
    /// <summary>
    /// 部门管理控制器
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

            // 用于显示下拉框数据
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
        /// 保存修改。
        /// </summary>
        /// <param name="org">组织机构信息</param>
        /// <returns>保存结果</returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateOrUpdate(Organization org)
        {
            org.Initialize();

            var rsp = this.OrganizationService.CreateOrUpdate(org);

            return rsp.IsSuccess ? this.CloseDialogWithAlert("保存成功！") : this.Alert("执行失败，失败原因：" + rsp.ErrorMessage);
        }

        #region 成员管理

        public ActionResult AllotMembers(string id, OrganizationSO so)
        {
            so.OrganizationId = id;

            this.ViewBag.Id = id;
            this.ViewBag.UnAllotUsers = this.OrganizationService.GetUnAllotUsers(so);
            this.ViewBag.Members = this.UserService.SearchUsers(new UserSO { OrganizationId = id });

            return View();
        }


        #endregion
    }
}
