using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Contracts.WebApi;
using Mercurius.Sparrow.Entities.WebApi;
using Mercurius.Sparrow.Entities.WebApi.SO;
using Mercurius.Sparrow.Repositories;
using Mercurius.Sparrow.Services.Support;

namespace Mercurius.Sparrow.Services.WebApi
{
    /// <summary>
    /// WebApi用户业务逻辑接口实现。 
    /// </summary>
    [Module("Web Api模块")]
    public class UserService : ServiceSupport, IUserService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Sparrow.Repositories.WebApi.User";

        #endregion

        #region IUserService接口实现 
        
        /// <summary>
        /// 添加或者编辑WebApi用户
        /// </summary>
        /// <param name="user">WebApi用户</param>
        /// <returns>返回添加或保存结果</returns>
        public Response CreateOrUpdate(User user)
        {
            return this.InvokeService(
                nameof(CreateOrUpdate),
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

            return this.InvokeService(nameof(ChangeStatus),
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
            return this.InvokeService(nameof(Remove), () =>
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

            return this.InvokeService(nameof(ValidateAccount), () => this.Persistence.QueryForObject<User>(NS, "ValidateAccount", args), args, false);
        }

        /// <summary>
        /// 根据主键获取WebApi用户信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回WebApi用户查询结果</returns>
        public Response<User> GetUserById(int id)
        {
            return this.InvokeService(
                nameof(GetUserById),
                () => this.Persistence.QueryForObject<User>(NS, "GetById", id),
                id);
        }


        /// <summary>
        /// 根据账号获取用户信息。
        /// </summary>
        /// <param name="account">账号</param>
        /// <returns>用户信息</returns>
        public Response<User> GetUserByAccount(string account)
        {
            return this.InvokeService(
                nameof(GetUserByAccount),
                () => this.Persistence.QueryForObject<User>(NS, "GetUserByAccount", account),
                account);
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
                nameof(SearchUsers),
                (out int totalRecords) => this.Persistence.QueryForPaginatedList<User>(NS, "SearchUsers", out totalRecords, so),
                so);
        }

        #endregion
    }
}
