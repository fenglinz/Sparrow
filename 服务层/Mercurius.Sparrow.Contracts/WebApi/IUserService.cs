using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Mercurius.Sparrow.Entities.WebApi;
using Mercurius.Sparrow.Entities.WebApi.SO;

namespace Mercurius.Sparrow.Contracts.WebApi
{
    /// <summary>
    /// WebApi用户业务逻辑接口。
    /// </summary>
    public interface IUserService
    {
        /// <summary>
        /// 添加WebApi用户。
        /// </summary>
        /// <param name="user">WebApi用户</param>
        /// <returns>返回添加结果</returns>
        Response Create(User user);

        /// <summary>
        /// 编辑WebApi用户。
        /// </summary>
        /// <param name="user">WebApi用户</param>
        /// <returns>返回编辑结果</returns>
        Response Update(User user);

        /// <summary>
        /// 添加或者编辑WebApi用户
        /// </summary>
        /// <param name="user">WebApi用户</param>
        /// <returns>返回添加或保存结果</returns>
        Response CreateOrUpdate(User user);

        /// <summary>
        /// 修改用户状态。
        /// </summary>
        /// <param name="id">用户编号</param>
        /// <param name="status">用户状态</param>
        /// <returns>返回操作结果</returns>
        Response ChangeStatus(int id, int status);

        /// <summary>
        /// 根据主键删除WebApi用户信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回删除结果</returns>
        Response Remove(int id);

        /// <summary>
        /// 验证用户信息。
        /// </summary>
        /// <param name="account">账号</param>
        /// <param name="password">密码</param>
        /// <returns>用户信息</returns>
        Response<User> ValidateAccount(string account, string password);

        /// <summary>
        /// 根据主键获取WebApi用户信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回WebApi用户查询结果</returns>
        Response<User> GetUserById(int id);

        /// <summary>
        /// 根据账号获取用户信息。
        /// </summary>
        /// <param name="account">账号</param>
        /// <returns>用户信息</returns>
        Response<User> GetUserByAccount(string account);

        /// <summary>
        /// 查询并分页获取WebApi用户信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回结果</returns>
        ResponseCollection<User> SearchUsers(UserSO so);

        /// <summary>
        ///  获取用户所有权限,并验证用户是否有权限访问该路由
        /// </summary>
        /// <param name="route">访问的路由</param>
        /// <returns></returns>
        Response HasPower(string route);
    }
}
