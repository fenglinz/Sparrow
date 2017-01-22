// <copyright file="INewsCommentService.cs" company="武汉链享医药供应链管理有限公司">
// 版权所有 © 武汉链享医药供应链管理有限公司. 保留所有权利.
// </copyright>
// <author>fengl</author>
// <create>2017-01-22</create>

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Mercurius.Prime.Core.Services;
using Mercurius.News.Interfaces.Entities;
using Mercurius.News.Interfaces.SearchObjects;

namespace Mercurius.News.Interfaces.Services
{
    /// <summary>
    /// 新闻评论业务逻辑接口。
    /// </summary>
    public interface INewsCommentService
    {   
        /// <summary>
        /// 添加或者编辑新闻评论
        /// </summary>
        /// <param name="newsComment">新闻评论</param>
        /// <returns>返回添加或保存结果</returns>
        Response CreateOrUpdate(NewsComment newsComment);
        
        /// <summary>
        /// 根据主键删除新闻评论信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回删除结果</returns>
        Response Remove(Guid id);
        
        /// <summary>
        /// 根据主键获取新闻评论信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回新闻评论查询结果</returns>
        Response<NewsComment> GetNewsCommentById(Guid id);
          
        /// <summary>
        /// 查询并分页获取新闻评论信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回结果</returns>
        ResponseSet<NewsComment> SearchNewsCommenies(NewsCommentSO so);
    }
}
  