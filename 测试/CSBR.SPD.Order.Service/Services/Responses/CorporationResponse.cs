// <copyright file="Corporation.cs" company="武汉链享医药供应链管理有限公司">
// 版权所有 © 武汉链享医药供应链管理有限公司, 保留所有权利.
// </copyright>
// <author>fenglinz</author>
// <create>2019-04-08</create>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CSBR.SPD.Order.Service.Services.Responses
{
    /// <summary>
    /// 公司组织资料业务逻辑响应数据模型.
    /// </summary>
    public class CorporationResponse
    {
        #region Properties

        /// <summary>
        /// 系统唯一标识.
        /// </summary>
        public string Guid { get; set; }

        /// <summary>
        /// 所属租户Guid.
        /// </summary>
        public string TenantGuid { get; set; }

        /// <summary>
        /// 名称.
        /// </summary>
        public string ChineseName { get; set; }

        /// <summary>
        /// 助记码.
        /// </summary>
        public string HelpCode { get; set; }

        /// <summary>
        /// 英文名称.
        /// </summary>
        public string EnglishName { get; set; }

        /// <summary>
        /// 简称.
        /// </summary>
        public string Abbreviation { get; set; }

        /// <summary>
        /// 上级公司Guid.
        /// </summary>
        public string SuperiorCorpGuid { get; set; }

        /// <summary>
        /// 省份.
        /// </summary>
        public string Province { get; set; }

        /// <summary>
        /// 城市.
        /// </summary>
        public string City { get; set; }

        /// <summary>
        /// 区/县/乡.
        /// </summary>
        public string District { get; set; }

        /// <summary>
        /// 地址.
        /// </summary>
        public string Address { get; set; }

        /// <summary>
        /// 注册日期.
        /// </summary>
        public DateTime RegisteredDate { get; set; }

        /// <summary>
        /// 注册资本(万).
        /// </summary>
        public string RegisteredCapital { get; set; }

        /// <summary>
        /// 法人代表.
        /// </summary>
        public string PersonInCharge { get; set; }

        /// <summary>
        /// 法人代表身份证.
        /// </summary>
        public string IdCode { get; set; }

        /// <summary>
        /// 是否具有第三方资质(Y 是；N 否).
        /// </summary>
        public string TplFlag { get; set; }

        /// <summary>
        /// 经营范围.
        /// </summary>
        public string OORange { get; set; }

        /// <summary>
        /// 公司电话.
        /// </summary>
        public string OrganizationTel { get; set; }

        /// <summary>
        /// E-MAIL.
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// 联系人.
        /// </summary>
        public string Contacts { get; set; }

        /// <summary>
        /// 联系电话.
        /// </summary>
        public string ContactTel { get; set; }

        /// <summary>
        /// 是否发送短信提醒.
        /// </summary>
        public string SentMsgFlag { get; set; }

        /// <summary>
        /// 公司传真.
        /// </summary>
        public string OrganizationFax { get; set; }

        /// <summary>
        /// 通信地址.
        /// </summary>
        public string Mailaddr { get; set; }

        /// <summary>
        /// 收款单位.
        /// </summary>
        public string EnterpriseName { get; set; }

        /// <summary>
        /// 收款银行.
        /// </summary>
        public string Bank { get; set; }

        /// <summary>
        /// 收款帐号.
        /// </summary>
        public string BankAccount { get; set; }

        /// <summary>
        /// 是否三证合一(Y 是；N 否).
        /// </summary>
        public string IsLicThreeToOne { get; set; }

        /// <summary>
        /// 企业图标.
        /// </summary>
        public string PictContent { get; set; }

        /// <summary>
        /// 税务名称.
        /// </summary>
        public string TaxName { get; set; }

        /// <summary>
        /// 税务编号.
        /// </summary>
        public string TaxNo { get; set; }

        /// <summary>
        /// 创建时间.
        /// </summary>
        public DateTime CreateDateTime { get; set; }

        /// <summary>
        /// 更新时间.
        /// </summary>
        public DateTime UpdateDateTime { get; set; }

        #endregion
    }
}
