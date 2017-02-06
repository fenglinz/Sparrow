using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Mercurius.Kernel.Contracts.WebApi.Entities;
using Mercurius.Kernel.Contracts.WebApi.SearchObjects;
using Mercurius.Prime.Core.Services;

namespace Mercurius.Kernel.Contracts.WebApi.Services
{
    /// <summary>
    /// WebApi用户业务逻辑接口。
    /// </summary>
    public interface IUserService
    {
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
        ResponseSet<User> SearchUsers(UserSO so);
    }
}
