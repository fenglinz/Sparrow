using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Mercurius.News.Interfaces.SearchObjects;
using Mercurius.Prime.Core.Services;

namespace Mercurius.News.Interfaces.Services
{
    /// <summary>
    /// 新闻业务逻辑接口。
    /// </summary>
    public interface INewsService
    {
        /// <summary>
        /// 添加或者编辑新闻
        /// </summary>
        /// <param name="news">新闻</param>
        /// <returns>返回添加或保存结果</returns>
        Response CreateOrUpdate(Entities.News news);

        /// <summary>
        /// 根据主键删除新闻信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回删除结果</returns>
        Response Remove(Guid id);

        /// <summary>
        /// 根据主键获取新闻信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回新闻查询结果</returns>
        Response<Entities.News> GetNewsById(Guid id);

        /// <summary>
        /// 查询并分页获取新闻信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回结果</returns>
        ResponseSet<Entities.News> SearchNews(NewsSO so);
    }
}
