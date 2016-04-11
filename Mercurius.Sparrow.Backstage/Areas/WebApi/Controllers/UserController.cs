using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts.WebApi;
using Mercurius.Sparrow.Entities;
using Mercurius.Sparrow.Entities.WebApi;
using Mercurius.Sparrow.Entities.WebApi.SO;
using Mercurius.Sparrow.Mvc.Extensions;

namespace Mercurius.Sparrow.Backstage.Areas.WebApi.Controllers
{
    /// <summary>
    /// 用户信息管理控制器。
    /// </summary>
    public class UserController : BaseController
    {
        #region 属性

        /// <summary>
        /// Web API用户信息服务对象。
        /// </summary>
        public IUserService UserService { get; set; }

        #endregion

        /// <summary>
        /// 用户管理首页。
        /// </summary>
        /// <returns>首页视图</returns>
        public ActionResult Index(UserSO so)
        {
            var model = this.UserService.SearchUsers(so);

            return View(model);
        }

        /// <summary>
        /// 添加或者修改用户信息页面。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <returns>视图</returns>
        public ActionResult CreateOrUpdate(int? id = null)
        {
            if (id != null)
            {
                var rsp = this.UserService.GetUserById(id.Value);

                return View(rsp.Data);
            }

            return View();
        }

        /// <summary>
        /// 保存修改。
        /// </summary>
        /// <param name="user">用户信息</param>
        /// <returns>保存结果</returns>
        [HttpPost]
        [IgnorePermissionValid]
        [ValidateAntiForgeryToken]
        public ActionResult CreateOrUpdate(User user)
        {
            if (user.IsValid())
            {
                if (user.Password != "******")
                {
                    user.ChangePassword = true;
                }

                user.Password = user.Password.MD5();

                var rsp = this.UserService.CreateOrUpdate(user);

                if (rsp.IsSuccess)
                {
                    return CloseDialogWithAlert("保存成功！");
                }
            }

            return Alert("添加失败！", AlertType.Error);
        }

        /// <summary>
        /// 删除用户信息。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <returns>操作结果</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult Remove(int id)
        {
            var rsp = this.UserService.Remove(id);

            return Json(rsp);
        }

        /// <summary>
        /// 用户授权
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <returns>锁定结果</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult AuthorizeUser(int id)
        {
            return Json(this.UserService.ChangeStatus(id, 1));
        }

        /// <summary>
        /// 锁定用户。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <returns>锁定结果</returns>
        [HttpPost]
        [IgnorePermissionValid]
        public ActionResult LockUser(int id)
        {
            return Json(this.UserService.ChangeStatus(id, 2));
        }
    }
}