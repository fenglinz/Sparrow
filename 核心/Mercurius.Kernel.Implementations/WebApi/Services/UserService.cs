using Mercurius.Kernel.Contracts.WebApi.Entities;
using Mercurius.Kernel.Contracts.WebApi.SearchObjects;
using Mercurius.Kernel.Contracts.WebApi.Services;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Services;
using Mercurius.Prime.Data.Support;

namespace Mercurius.WebApi.Implementations.WebApi.Services
{
    /// <summary>
    /// WebApi用户业务逻辑接口实现。 
    /// </summary>
    [Module("Web Api模块")]
    public class UserService : ServiceSupport, IUserService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Kernel.Repositories.WebApi.User";

        #endregion

        #region IUserService接口实现 

        /// <summary>
        /// 添加或者编辑WebApi用户
        /// </summary>
        /// <param name="user">WebApi用户</param>
        /// <returns>返回添加或保存结果</returns>
        public Response CreateOrUpdate(User user)
        {
            return this.Update<User>(NS, "CreateOrUpdate", user);
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

            return this.Update<User>(NS, "ChangeStatus", args);
        }

        /// <summary>
        /// 根据主键删除WebApi用户信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回删除结果</returns>
        public Response Remove(int id)
        {
            return this.Delete<User>(NS, "Remove", id);
        }

        /// <summary>
        /// 设置刷新令牌。
        /// </summary>
        /// <param name="account">账号</param>
        /// <param name="refreshToken">刷新令牌</param>
        /// <param name="token">token值</param>
        /// <returns>操作结果</returns>
        public Response SetRefreshToken(string account, string refreshToken, string token)
        {
            var args = new { Account = account, RefreshToken = refreshToken, Token = token };

            return this.Update(NS, "SetRefreshToken", args);
        }

        /// <summary>
        /// 清除刷新令牌。
        /// </summary>
        /// <param name="refreshToken">刷新令牌</param>
        /// <returns>操作结果</returns>
        public Response<string> GetToken(string refreshToken)
        {
            return this.QueryForObject<string>(NS, "GetToken", refreshToken);
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

            return this.QueryForObject<User>(NS, "ValidateAccount", args);
        }

        /// <summary>
        /// 根据主键获取WebApi用户信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回WebApi用户查询结果</returns>
        public Response<User> GetUserById(int id)
        {
            return this.QueryForObject<User>(NS, "GetById", id);
        }


        /// <summary>
        /// 根据账号获取用户信息。
        /// </summary>
        /// <param name="account">账号</param>
        /// <returns>用户信息</returns>
        public Response<User> GetUserByAccount(string account)
        {
            return this.QueryForObject<User>(NS, "GetUserByAccount", account);
        }

        /// <summary>
        /// 查询并分页获取WebApi用户信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回WebApi用户的分页查询结果</returns>
        public ResponseSet<User> SearchUsers(UserSO so)
        {
            return this.QueryForPagedList<User>(NS, "SearchUsers",  so);
        }

        #endregion
    }
}
