using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Mercurius.Infrastructure;
using Mercurius.Siskin.Contracts;
using Mercurius.Siskin.Contracts.WebApi;
using Mercurius.Siskin.Entities.WebApi;
using Mercurius.Siskin.Entities.WebApi.SO;
using Mercurius.Siskin.Repositories;
using Mercurius.Siskin.Services.Support;

namespace Mercurius.Siskin.Services.WebApi
{
    /// <summary>
    /// WebApi用户业务逻辑接口实现。 
    /// </summary>
    public class UserService : ServiceSupport, IUserService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Siskin.Repositories.WebApi.User";
        private static readonly StatementNamespace ApiNS = "Mercurius.Siskin.Repositories.WebApi.Api";

        #endregion

        #region IUserService接口实现 

        /// <summary>
        /// 添加WebApi用户。
        /// </summary>
        /// <param name="user">WebApi用户</param>
        /// <returns>返回结果</returns>
        public Response Create(User user)
        {
            return this.InvokeService(
                "Create",
                () =>
                {
                    this.Persistence.Create(NS, "Create", user);

                    this.ClearCache<User>();
                },
                user);
        }

        /// <summary>
        /// 编辑WebApi用户。
        /// </summary>
        /// <param name="user">WebApi用户</param>
        /// <returns>返回结果</returns>
        public Response Update(User user)
        {
            return this.InvokeService(
                "Update",
                () =>
                {
                    this.Persistence.Update(NS, "Update", user);

                    this.ClearCache<User>();
                },
                user);
        }

        /// <summary>
        /// 添加或者编辑WebApi用户
        /// </summary>
        /// <param name="user">WebApi用户</param>
        /// <returns>返回添加或保存结果</returns>
        public Response CreateOrUpdate(User user)
        {
            return this.InvokeService(
                "CreateOrUpdate",
                () =>
                {
                    this.Persistence.Update(NS, "CreateOrUpdate", user);

                    this.ClearCache<User>();
                },
                user);
        }

        /// <summary>
        /// 修改用户状态。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <param name="status">用户状态</param>
        /// <returns>返回操作结果</returns>
        public Response ChangeStatus(int id, int status)
        {
            var args = new { Id = id, Status = status };

            return this.InvokeService("ChangeStatus",
                () =>
                {
                    this.Persistence.Update(NS, "ChangeStatus", args);

                    this.ClearCache<User>();
                }, args);
        }

        /// <summary>
        /// 根据主键删除WebApi用户信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回删除结果</returns>
        public Response Remove(int id)
        {
            return this.InvokeService("Remove", () =>
            {
                this.Persistence.Delete(NS, "Remove", id);

                this.ClearCache<User>();
            }, id);
        }

        /// <summary>
        /// 验证用户信息。
        /// </summary>
        /// <param name="account">账号</param>
        /// <param name="password">密码</param>
        /// <returns>用户信息</returns>
        public Response<User> ValidateAccount(string account, string password)
        {
            var args = new { Account = account, Password = password.MD5() };

            return this.InvokeService("ValidateAccount", () => this.Persistence.QueryForObject<User>(NS, "ValidateAccount", args), false, args: args);
        }

        /// <summary>
        /// 根据主键获取WebApi用户信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回WebApi用户查询结果</returns>
        public Response<User> GetUserById(int id)
        {
            return this.InvokeService(
                "GetUserById",
                () => this.Persistence.QueryForObject<User>(NS, "GetById", id),
                args: id);
        }


        /// <summary>
        /// 根据账号获取用户信息。
        /// </summary>
        /// <param name="account">账号</param>
        /// <returns>用户信息</returns>
        public Response<User> GetUserByAccount(string account)
        {
            return this.InvokeService(
                "GetUserByAccount",
                () => this.Persistence.QueryForObject<User>(NS, "GetUserByAccount", account),
                args: account);
        }

        /// <summary>
        /// 查询并分页获取WebApi用户信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回WebApi用户的分页查询结果</returns>
        public ResponseCollection<User> SearchUsers(UserSO so)
        {
            so = so ?? new UserSO();

            return this.InvokePagingService(
                "SearchUsers",
                (out int totalRecords) => this.Persistence.QueryForPaginatedList<User>(NS, "SearchUsers", out totalRecords, so),
                args: so);
        }

        /// <summary>
        ///  获取用户所有权限,并验证用户是否有权限访问该路由
        /// </summary>
        /// <param name="route">访问的路由</param>
        /// <returns></returns>
        public Response HasPower(string route)
        {
            var user = WebHelper.GetLogOnUserId();
            if (string.IsNullOrEmpty(user))
            {
                return new Response { ErrorMessage = "未授权用户" };
            }

            var permission = this.InvokeService("GetUserPower", () => this.Persistence.QueryForList<Api>(ApiNS, "GetUserPower", user), args: user);
            if (!permission.IsSuccess || permission.Datas.IsEmpty())
            {
                return new Response { ErrorMessage = permission.ErrorMessage ?? "用户不存在" };
            }

            var power = permission.Datas.Select(x => x.Route.Equals(route, StringComparison.InvariantCultureIgnoreCase)).FirstOrDefault();

            return power ? new Response() : new Response { ErrorMessage = "无权限访问" };
        }

        #endregion

        #region 重写基类方法

        protected override string GetModelName()
        {
            return "Web Api模块";
        }

        #endregion

    }
}
