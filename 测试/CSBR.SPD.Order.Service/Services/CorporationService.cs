// <copyright file="CorporationService.cs" company="武汉链享医药供应链管理有限公司">
// 版权所有 © 武汉链享医药供应链管理有限公司, 保留所有权利.
// </copyright>
// <author>fenglinz</author>
// <create>2019-04-06</create>

using System;
using System.Collections.Generic;
using System.Data;
using Mercurius.Prime.Core;
using Mercurius.Prime.Data;
using Mercurius.Prime.Data.Service;
using CSBR.SPD.Order.Repository.Entities;
using CSBR.SPD.Order.Repository.SearchObjects;
using CSBR.SPD.Order.Service.Services.Requests;
using CSBR.SPD.Order.Service.Services.Responses;

namespace CSBR.SPD.Order.Service.Services
{
    /// <summary>
    /// 公司组织资料业务逻辑接口实现.
    /// </summary>
    public class CorporationService : ServiceSupport
    {
        #region Fields

        private static readonly StatementNamespace ns = "CSBR.SPD.Order.Service.Services.Corporation";

        #endregion

        #region Public Methods

        /// <summary>
        /// 添加公司组织资料.
        /// </summary>
        /// <param name="items">公司组织资料</param>
        /// <returns>返回结果</returns>
        public Response Create(params CorporationRequest[] items)
        {
            return this.Create<CorporationRequest, Corporation>(items);
        }

        /// <summary>
        /// 编辑公司组织资料.
        /// </summary>
        /// <param name="data">更新数据</param>
        /// <param name="action">更新条件设置回调</param>
        /// <returns>返回结果</returns>
        public Response Update(object data, Action<Criteria<Corporation>> action = null)
        {
            return this.Update<CorporationRequest, Corporation>(data, action);
        }

        /// <summary>
        /// 删除公司组织资料.
        /// </summary>
        /// <param name="param">删除条件数据</param>
        /// <param name="action">查询条件设置回调</param>
        /// <returns>返回结果</returns>
        public Response Remove(object param, Action<Criteria<Corporation>> action = null)
        {
            return this.Remove<CorporationRequest, Corporation>(param, action);
        }

        /// <summary>
        /// 获取公司组织资料.
        /// </summary>
        /// <param name="so">公司组织资料查询对象</param>
        /// <param name="action">查询条件设置回调</param>
        /// <param name="selectors">查询返回列</param>
        /// <returns>返回结果</returns>
        public Response<CorporationResponse> GetCorporation(object so = null, Action<SelectCriteria> action = null, IEnumerable<string> selectors = null)
        {
            return this.QueryForObject<CorporationResponse, Corporation>(selectors, so, action);
        }

        /// <summary>
        /// 查询公司组织资料.
        /// </summary>
        /// <param name="so">公司组织资料查询对象</param>
        /// <param name="action">查询条件设置回调</param>
        /// <param name="selectors">查询返回列</param>
        /// <returns>返回结果</returns>
        public ResponseSet<CorporationResponse> SearchCorporations(CorporationSO so = null, Action<SelectCriteria> action = null, IEnumerable<string> selectors = null)
        {
            return this.QueryForPagedList<CorporationResponse, Corporation>(selectors, so, action);
        }
        
        #endregion
    }
}
    