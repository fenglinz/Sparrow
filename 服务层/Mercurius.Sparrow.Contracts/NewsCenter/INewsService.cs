using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Mercurius.Sparrow.Entities.NewsCenter;
using Mercurius.Sparrow.Entities.NewsCenter.SO;

namespace Mercurius.Sparrow.Contracts.NewsCenter
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
        Response CreateOrUpdate(News news);

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
        Response<News> GetNewsById(Guid id);

        /// <summary>
        /// 查询并分页获取新闻信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回结果</returns>
        ResponseSet<News> SearchNews(NewsSO so);
    }
}
