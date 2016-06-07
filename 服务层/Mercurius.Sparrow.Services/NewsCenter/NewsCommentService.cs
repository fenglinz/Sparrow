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
    /// 新闻评论业务逻辑接口实现。 
    /// </summary>
    [Module("新闻中心")]
    public class NewsCommentService : ServiceSupport, INewsCommentService
    {
        #region 常量

        private static readonly StatementNamespace NS = "Mercurius.Sparrow.Repositories.NewsCenter.NewsComment";

        #endregion

        #region INewsCommentService接口实现 

        /// <summary>
        /// 添加或者编辑新闻评论
        /// </summary>
        /// <param name="newsComment">新闻评论</param>
        /// <returns>返回添加或保存结果</returns>
        public Response CreateOrUpdate(NewsComment newsComment)
        {
            return this.InvokeService(
                nameof(CreateOrUpdate),
                () =>
                {
                    this.Persistence.Update(NS, "CreateOrUpdate", newsComment);

                    this.ClearCache<NewsComment>();
                },
                newsComment);
        }

        /// <summary>
        /// 根据主键删除新闻评论信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回删除结果</returns>
        public Response Remove(Guid id)
        {
            return this.InvokeService(nameof(Remove), () =>
            {
                this.Persistence.Delete(NS, "Remove", id);

                this.ClearCache<NewsComment>();
            }, id);
        }

        /// <summary>
        /// 根据主键获取新闻评论信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回新闻评论查询结果</returns>
        public Response<NewsComment> GetNewsCommentById(Guid id)
        {
            return this.InvokeService(
                nameof(GetNewsCommentById),
                () => this.Persistence.QueryForObject<NewsComment>(NS, "GetById", id),
                id);
        }

        /// <summary>
        /// 查询并分页获取新闻评论信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回新闻评论的分页查询结果</returns>
        public ResponseSet<NewsComment> SearchNewscommenies(NewsCommentSO so)
        {
            so = so ?? new NewsCommentSO();

            return this.InvokePagingService(
                nameof(SearchNewscommenies),
                (out int totalRecords) => this.Persistence.QueryForPaginatedList<NewsComment>(NS, "SearchNewscommenies", out totalRecords, so),
                so);
        }

        #endregion
    }
}
