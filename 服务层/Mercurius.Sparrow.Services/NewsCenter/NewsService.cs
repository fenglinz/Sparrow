using System;
using System.Collections.Generic;
using System.Data;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Entities.NewsCenter;
using Mercurius.Sparrow.Entities.NewsCenter.SO;
using Mercurius.Sparrow.Contracts.NewsCenter;
using Mercurius.Sparrow.Repositories;
using Mercurius.Sparrow.Services.Support;

namespace Mercurius.Sparrow.Services.NewsCenter
{
    /// <summary>
    /// 新闻业务逻辑接口实现。 
    /// </summary>
    [Module("新闻中心")]
    public class NewsService : ServiceSupport, INewsService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Sparrow.Repositories.NewsCenter.News";

        #endregion

        #region INewsService接口实现 

        /// <summary>
        /// 添加或者编辑新闻
        /// </summary>
        /// <param name="news">新闻</param>
        /// <returns>返回添加或保存结果</returns>
        public Response CreateOrUpdate(News news)
        {
            return this.InvokeService(
                nameof(CreateOrUpdate),
                () =>
                {
                    this.Persistence.Update(NS, "CreateOrUpdate", news);

                    this.ClearCache<News>();
                },
                news);
        }

        /// <summary>
        /// 根据主键删除新闻信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回删除结果</returns>
        public Response Remove(Guid id)
        {
            return this.InvokeService(nameof(Remove), () =>
            {
                this.Persistence.Delete(NS, "Remove", id);

                this.ClearCache<News>();
            }, id);
        }

        /// <summary>
        /// 根据主键获取新闻信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回新闻查询结果</returns>
        public Response<News> GetNewsById(Guid id)
        {
            return this.InvokeService(
                nameof(GetNewsById),
                () => this.Persistence.QueryForObject<News>(NS, "GetById", id),
                id);
        }

        /// <summary>
        /// 查询并分页获取新闻信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回新闻的分页查询结果</returns>
        public ResponseSet<News> SearchNews(NewsSO so)
        {
            so = so ?? new NewsSO();

            return this.InvokePagingService(
                nameof(SearchNews),
                (out int totalRecords) => this.Persistence.QueryForPaginatedList<News>(NS, "SearchNews", out totalRecords, so),
                so);
        }

        #endregion
    }
}
