using Mercurius.Core.Interfaces.Entities;
using Mercurius.Core.Interfaces.SearchObjects;
using Mercurius.Prime.Core.Services;

namespace Mercurius.Core.Interfaces.Services
{
    /// <summary>
    /// 用户服务接口。
    /// </summary>
    public interface IUserService
    {
        /// <summary>
        /// 添加或者修改用户信息。
        /// </summary>
        /// <param name="user">用户信息</param>
        /// <param name="departments">所属部门编号列表</param>
        /// <param name="roles">所属角色编号列表</param>
        /// <returns>保存结果</returns>
        Response CreateOrUpdate(User user, string[] departments, string[] roles);

        /// <summary>
        /// 删除用户信息。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <returns>删除结果</returns>
        Response Remove(string id);

        /// <summary>
        /// 更新用户状态。
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="status">用户状态</param>
        /// <returns>执行结果</returns>
        Response ChangeStatus(string userId, int status);

        /// <summary>
        /// 更新用户密码。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <param name="oldPassword">用户旧密码</param>
        /// <param name="newPassword">用户新密码</param>
        Response ChangePassword(string id, string oldPassword, string newPassword);

        /// <summary>
        /// 获取用户信息。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <returns>用户信息</returns>
        Response<User> GetUserById(string id);

        /// <summary>
        /// 获取用户信息。
        /// </summary>
        /// <param name="account">登录账号</param>
        /// <returns>用户信息</returns>
        Response<User> GetUserByAccount(string account);

        /// <summary>
        /// 验证登录用户。
        /// </summary>
        /// <param name="account">登录账号</param>
        /// <param name="password">登录密码</param>
        /// <returns>用户信息</returns>
        Response<User> ValidateUser(string account, string password);

        /// <summary>
        /// 获取报告者和直接下属信息。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <returns>报告者和直接下属信息</returns>
        ResponseSet<User> GetRepoterAndSubordinates(string id);

        /// <summary>
        /// 查询用户信息。
        /// </summary>
        /// <param name="so">用户信息查询对象</param>
        /// <returns>用户信息列表</returns>
        ResponseSet<User> SearchUsers(UserSO so);
    }
}
