// <copyright file="Corporation.cs" company="武汉链享医药供应链管理有限公司">
// 版权所有 © 武汉链享医药供应链管理有限公司, 保留所有权利.
// </copyright>
// <author>fenglinz</author>
// <create>2019-04-08</create>

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace CSBR.SPD.Order.Service.Services.Requests
{
    /// <summary>
    /// 公司组织资料业务逻辑请求数据模型.
    /// </summary>
    public class CorporationRequest
    {
        #region Properties

        /// <summary>
        /// 系统唯一标识.
        /// </summary>
        [Required(AllowEmptyStrings = false, ErrorMessage = "系统唯一标识不能为空！")]
        [StringLength(32, ErrorMessage = "系统唯一标识字符长度不能超过{1}个字符！")]
        public string Guid { get; set; }

        /// <summary>
        /// 所属租户Guid.
        /// </summary>
        [StringLength(32, ErrorMessage = "所属租户Guid字符长度不能超过{1}个字符！")]
        public string TenantGuid { get; set; }

        /// <summary>
        /// 名称.
        /// </summary>
        [StringLength(100, ErrorMessage = "名称字符长度不能超过{1}个字符！")]
        public string ChineseName { get; set; }

        /// <summary>
        /// 助记码.
        /// </summary>
        [StringLength(50, ErrorMessage = "助记码字符长度不能超过{1}个字符！")]
        public string HelpCode { get; set; }

        /// <summary>
        /// 英文名称.
        /// </summary>
        [StringLength(100, ErrorMessage = "英文名称字符长度不能超过{1}个字符！")]
        public string EnglishName { get; set; }

        /// <summary>
        /// 简称.
        /// </summary>
        [StringLength(100, ErrorMessage = "简称字符长度不能超过{1}个字符！")]
        public string Abbreviation { get; set; }

        /// <summary>
        /// 上级公司Guid.
        /// </summary>
        [StringLength(32, ErrorMessage = "上级公司Guid字符长度不能超过{1}个字符！")]
        public string SuperiorCorpGuid { get; set; }

        /// <summary>
        /// 省份.
        /// </summary>
        [StringLength(20, ErrorMessage = "省份字符长度不能超过{1}个字符！")]
        public string Province { get; set; }

        /// <summary>
        /// 城市.
        /// </summary>
        [StringLength(20, ErrorMessage = "城市字符长度不能超过{1}个字符！")]
        public string City { get; set; }

        /// <summary>
        /// 区/县/乡.
        /// </summary>
        [StringLength(20, ErrorMessage = "区/县/乡字符长度不能超过{1}个字符！")]
        public string District { get; set; }

        /// <summary>
        /// 地址.
        /// </summary>
        [StringLength(100, ErrorMessage = "地址字符长度不能超过{1}个字符！")]
        public string Address { get; set; }

        /// <summary>
        /// 注册日期.
        /// </summary>
        
        public DateTime RegisteredDate { get; set; }

        /// <summary>
        /// 注册资本(万).
        /// </summary>
        [StringLength(30, ErrorMessage = "注册资本(万)字符长度不能超过{1}个字符！")]
        public string RegisteredCapital { get; set; }

        /// <summary>
        /// 法人代表.
        /// </summary>
        [StringLength(20, ErrorMessage = "法人代表字符长度不能超过{1}个字符！")]
        public string PersonInCharge { get; set; }

        /// <summary>
        /// 法人代表身份证.
        /// </summary>
        [StringLength(20, ErrorMessage = "法人代表身份证字符长度不能超过{1}个字符！")]
        public string IdCode { get; set; }

        /// <summary>
        /// 是否具有第三方资质(Y 是；N 否).
        /// </summary>
        [StringLength(1, ErrorMessage = "是否具有第三方资质(Y 是；N 否)字符长度不能超过{1}个字符！")]
        public string TplFlag { get; set; }

        /// <summary>
        /// 经营范围.
        /// </summary>
        [StringLength(3000, ErrorMessage = "经营范围字符长度不能超过{1}个字符！")]
        public string OORange { get; set; }

        /// <summary>
        /// 公司电话.
        /// </summary>
        [StringLength(20, ErrorMessage = "公司电话字符长度不能超过{1}个字符！")]
        public string OrganizationTel { get; set; }

        /// <summary>
        /// E-MAIL.
        /// </summary>
        [StringLength(60, ErrorMessage = "E-MAIL字符长度不能超过{1}个字符！")]
        public string Email { get; set; }

        /// <summary>
        /// 联系人.
        /// </summary>
        [StringLength(20, ErrorMessage = "联系人字符长度不能超过{1}个字符！")]
        public string Contacts { get; set; }

        /// <summary>
        /// 联系电话.
        /// </summary>
        [StringLength(40, ErrorMessage = "联系电话字符长度不能超过{1}个字符！")]
        public string ContactTel { get; set; }

        /// <summary>
        /// 是否发送短信提醒.
        /// </summary>
        [StringLength(1, ErrorMessage = "是否发送短信提醒字符长度不能超过{1}个字符！")]
        public string SentMsgFlag { get; set; }

        /// <summary>
        /// 公司传真.
        /// </summary>
        [StringLength(20, ErrorMessage = "公司传真字符长度不能超过{1}个字符！")]
        public string OrganizationFax { get; set; }

        /// <summary>
        /// 通信地址.
        /// </summary>
        [StringLength(60, ErrorMessage = "通信地址字符长度不能超过{1}个字符！")]
        public string Mailaddr { get; set; }

        /// <summary>
        /// 收款单位.
        /// </summary>
        [StringLength(60, ErrorMessage = "收款单位字符长度不能超过{1}个字符！")]
        public string EnterpriseName { get; set; }

        /// <summary>
        /// 收款银行.
        /// </summary>
        [StringLength(60, ErrorMessage = "收款银行字符长度不能超过{1}个字符！")]
        public string Bank { get; set; }

        /// <summary>
        /// 收款帐号.
        /// </summary>
        [StringLength(40, ErrorMessage = "收款帐号字符长度不能超过{1}个字符！")]
        public string BankAccount { get; set; }

        /// <summary>
        /// 是否三证合一(Y 是；N 否).
        /// </summary>
        [StringLength(1, ErrorMessage = "是否三证合一(Y 是；N 否)字符长度不能超过{1}个字符！")]
        public string IsLicThreeToOne { get; set; }

        /// <summary>
        /// 企业图标.
        /// </summary>
        
        public string PictContent { get; set; }

        /// <summary>
        /// 税务名称.
        /// </summary>
        [StringLength(100, ErrorMessage = "税务名称字符长度不能超过{1}个字符！")]
        public string TaxName { get; set; }

        /// <summary>
        /// 税务编号.
        /// </summary>
        [StringLength(50, ErrorMessage = "税务编号字符长度不能超过{1}个字符！")]
        public string TaxNo { get; set; }

        #endregion
    }
}
