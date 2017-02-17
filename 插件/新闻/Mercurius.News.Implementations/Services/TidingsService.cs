// <copyright file="TidingsService.cs" company="武汉链享医药供应链管理有限公司">
// 版权所有 © 武汉链享医药供应链管理有限公司. 保留所有权利.
// </copyright>
// <author>fengl</author>
// <create>2017-01-22</create>

using System;
using Mercurius.News.Contracts.Entities;
using Mercurius.News.Contracts.SearchObjects;
using Mercurius.News.Contracts.Services;
using Mercurius.Prime.Core.Services;
using Mercurius.Prime.Data.Support;

namespace Mercurius.News.Implementations.Services
{
    /// <summary>
    /// 新闻业务逻辑接口实现。 
    /// </summary>
    [Module("")]
    public class TidingsService : ServiceSupport, ITidingsService
    {
        #region 常量
    
        private static readonly StatementNamespace NS = "Mercurius.Plugins.Repositories.News.Tidings";
      
        #endregion

        #region ITidingsService接口实现 
        
        /// <summary>
        /// 添加或者编辑新闻
        /// </summary>
        /// <param name="tidings">新闻</param>
        /// <returns>返回添加或保存结果</returns>
        public Response CreateOrUpdate(Tidings tidings)
        {
            return this.InvokeService(
                nameof(CreateOrUpdate),
                () =>
                {
                    this.Persistence.Update(NS, "CreateOrUpdate", tidings);
                    
                    this.ClearCache<Tidings>();
                },
                tidings);
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

                this.ClearCache<Tidings>();
            }, id);
        }
        
        /// <summary>
        /// 根据主键获取新闻信息。
        /// </summary>
        /// <param name="id">编号</param>
        /// <returns>返回新闻查询结果</returns>
        public Response<Tidings> GetTidingsById(Guid id)
        {
            return this.InvokeService(
                nameof(GetTidingsById),
                () => this.Persistence.QueryForObject<Tidings>(NS, "GetById", id),
                id);
        }
        
        /// <summary>
        /// 查询并分页获取新闻信息。
        /// </summary>
        /// <param name="so">查询条件</param>
        /// <returns>返回新闻的分页查询结果</returns>
        public ResponseSet<Tidings> SearchTidinies(TidingsSO so)
        {
            so = so ?? new TidingsSO();

            return this.InvokePagingService(
                nameof(SearchTidinies),
                (out int totalRecords) => this.Persistence.QueryForPaginatedList<Tidings>(NS, "SearchTidinies", out totalRecords, so),
                so);
        }
      
        #endregion
    }
}
    