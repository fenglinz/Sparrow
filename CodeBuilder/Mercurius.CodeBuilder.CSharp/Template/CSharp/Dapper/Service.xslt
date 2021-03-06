﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="text" indent="yes"/>
    <xsl:include href="../Common.xslt"/>
  <xsl:template match="root"><![CDATA[// <copyright ]]>file="<xsl:value-of select="./table/@className" />Service.cs" company="<xsl:value-of select="./copyright"/>"<![CDATA[>
// 版权所有 © ]]><xsl:value-of select="./copyright"/><![CDATA[, 保留所有权利.
// </copyright>]]>
// <![CDATA[<author>]]><xsl:value-of select="./author"/><![CDATA[</author>]]>
// <![CDATA[<create>]]><xsl:value-of select="./buildDate"/><![CDATA[</create>]]>

using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Mercurius.Prime.Core;
using Mercurius.Prime.Data;
using Mercurius.Prime.Data.Service;
<xsl:call-template name="dependencys" />
<xsl:call-template name="namespace" />
{
    /// <![CDATA[<summary>]]>
    /// <xsl:value-of select="./table/@description" />业务服务.
    /// <![CDATA[</summary>]]>
    public class <xsl:value-of select="./table/@className"/>Service : ServiceSupport
    {
        #region Fields

        private static readonly StatementNamespace ns = "<xsl:value-of select="./table/@namespace" />.<xsl:value-of select="./table/@className"/>";

        #endregion

        #region Public Methods
<xsl:choose>
    <xsl:when test="count(./table[@hasCreate='true'])=0">
        /// <![CDATA[<summary>]]>
        /// 添加<xsl:value-of select="./table/@description" />.
        /// <![CDATA[</summary>]]>
        /// &lt;param name="items"><xsl:value-of select="./table/@description"/>&lt;/param>
        /// &lt;returns>返回结果&lt;/returns>
        public async Task&lt;Response> Create(params <xsl:value-of select="./table/@className" />Request[] items)
        {
            return await this.Create&lt;<xsl:value-of select="./table/@className" />Request, <xsl:value-of select="./table/@className" />>(items);
        }
    </xsl:when>
    <xsl:otherwise>
        /// <![CDATA[<summary>]]>
        /// 添加<xsl:value-of select="./table/@description" />.
        /// <![CDATA[</summary>]]>
        /// &lt;param name="<xsl:value-of select="./table/@camelClassName" />"><xsl:value-of select="./table/@description"/>&lt;/param>
        /// &lt;returns>返回结果&lt;/returns>
        public async Task&lt;Response> Create(<xsl:value-of select="./table/@className" />Request<xsl:text> </xsl:text><xsl:value-of select="./table/@camelClassName"/>)
        {
            return await this.Execute(ns, "Create", <xsl:value-of select="./table/@camelClassName" />);
        }
    </xsl:otherwise>
</xsl:choose>
<xsl:choose>
    <xsl:when test="count(./table[@hasUpdate='true'])=0">
        /// &lt;summary>
        /// 编辑<xsl:value-of select="./table/@description" />.
        /// &lt;/summary>
        /// &lt;param name="data">更新数据&lt;/param>
        /// &lt;param name="action">更新条件设置回调&lt;/param>
        /// &lt;returns>返回结果&lt;/returns>
        public async Task&lt;Response> Update(object data, Action&lt;Criteria&lt;<xsl:value-of select="./table/@className" />>> action = null)
        {
            return await this.Update&lt;<xsl:value-of select="./table/@className" />Request, <xsl:value-of select="./table/@className" />>(data, action);
        }
    </xsl:when>
    <xsl:otherwise>
        /// &lt;summary>
        /// 编辑<xsl:value-of select="./table/@description" />.
        /// &lt;/summary>
        /// &lt;param name="<xsl:value-of select="./table/@camelClassName"/>"><xsl:value-of select="./table/@description"/>&lt;/param>
        /// &lt;returns>返回结果&lt;/returns>
        public async Task&lt;Response> Update(<xsl:value-of select="./table/@className"/>Request<xsl:text> </xsl:text><xsl:value-of select="./table/@camelClassName"/>)
        {
            return await this.Execute(ns, "Update", <xsl:value-of select="./table/@camelClassName" />);
        }
    </xsl:otherwise>
</xsl:choose>
<xsl:if test="count(./table[@hasCreateOrUpdate='true'])=1">
        /// &lt;summary>
        /// 添加或者编辑<xsl:value-of select="./table/@description" />.
        /// &lt;/summary>
        /// &lt;param name="<xsl:value-of select="./table/@camelClassName"/>"><xsl:value-of select="./table/@description"/>&lt;/param>
        /// &lt;returns>返回添加或保存结果&lt;/returns>
        public async Task&lt;Response> CreateOrUpdate(<xsl:value-of select="./table/@className"/>Request<xsl:text> </xsl:text><xsl:value-of select="./table/@camelClassName"/>)
        {
            return await this.Execute(ns, "CreateOrUpdate", <xsl:value-of select="./table/@camelClassName" />);
        }
</xsl:if>
<xsl:choose>
    <xsl:when test="count(./table[@hasRemove='true'])=0">
        /// &lt;summary>
        /// 删除<xsl:value-of select="./table/@description" />.
        /// &lt;/summary>
        /// &lt;param name="param">删除条件数据&lt;/param>
        /// &lt;param name="action">查询条件设置回调&lt;/param>
        /// &lt;returns>返回结果&lt;/returns>
        public async Task&lt;Response> Remove(object param, Action&lt;Criteria&lt;<xsl:value-of select="./table/@className" />>> action = null)
        {
            return await this.Remove&lt;<xsl:value-of select="./table/@className" />Request, <xsl:value-of select="./table/@className" />>(param, action);
        }
    </xsl:when>
    <xsl:otherwise>
    <xsl:choose>
        <xsl:when test="count(./table/column[@isPrimaryKey='true'])=1">
        /// &lt;summary>
        /// 根据主键删除<xsl:value-of select="./table/@description" />信息.
        /// &lt;/summary>
        /// &lt;param name="id"><xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@description"/>&lt;/param>
        /// &lt;returns>返回删除结果&lt;/returns>
        public async Task&lt;Response> Remove(<xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@basicType"/> id)
        {
            return await this.Execute(ns, "Remove", new { value = id });
        }
        </xsl:when>
        <xsl:otherwise>
        /// &lt;summary>
        /// 根据主键删除<xsl:value-of select="./table/@description" />信息.
        /// &lt;/summary><xsl:for-each select="./table/column[@isPrimaryKey='true']">
        /// &lt;param name="<xsl:value-of select="@fieldName" />"><xsl:value-of select="@description"/>&lt;/param></xsl:for-each>
        /// &lt;returns>返回删除结果&lt;/returns>
        public async Task&lt;Response> Remove(<xsl:for-each select="./table/column[@isPrimaryKey='true']"><xsl:value-of select="@basicType"/><xsl:text> </xsl:text><xsl:value-of select="@fieldName"/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if></xsl:for-each><xsl:text>)</xsl:text>
        {
            <xsl:call-template name="GetByIdParams" />

            return await this.Execute(ns, "Remove", args);
        }
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
</xsl:choose>
<xsl:choose>
    <xsl:when test="count(./table[@hasSingleData='true'])=0">
        /// &lt;summary>
        /// 获取<xsl:value-of select="./table/@description" />.
        /// &lt;/summary><xsl:for-each select="./table/column[@isPrimaryKey='true']">
        /// &lt;param name="<xsl:value-of select="@fieldName"/>"><xsl:value-of select="@description"/>&lt;/param></xsl:for-each>
        /// &lt;param name="selectors">查询返回列&lt;/param>
        /// &lt;returns>返回结果&lt;/returns>
        public async Task&lt;Response&lt;<xsl:value-of select="./table/@className" />Response>> Get<xsl:value-of select="./table/@className" />ById(<xsl:for-each select="./table/column[@isPrimaryKey='true']"><xsl:value-of select="@basicType"/><xsl:text> </xsl:text><xsl:value-of select="@fieldName"/><xsl:text>, </xsl:text></xsl:for-each>params string[] selectors)
        {
            var so = new { <xsl:for-each select="./table/column[@isPrimaryKey='true']"><xsl:value-of select="@propertyName"/> = <xsl:value-of select="@fieldName"/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if></xsl:for-each> };

            return await this.Get<xsl:value-of select="./table/@className" />(so, c => c.Where()<xsl:for-each select="./table/column[@isPrimaryKey='true']">.Equal(e => e.<xsl:value-of select="@propertyName"/>)</xsl:for-each>, selectors);
        }
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="count(./table/column[@isPrimaryKey='true'])=1">
        /// &lt;summary>
        /// 根据主键获取<xsl:value-of select="./table/@description" />信息.
        /// &lt;/summary>
        /// &lt;param name="id"><xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@description"/>&lt;/param>
        /// &lt;returns>返回<xsl:value-of select="./table/@description"/>查询结果&lt;/returns>
        public async Task&lt;Response&lt;<xsl:value-of select="./table/@className"/>Response>> Get<xsl:value-of select="./table/@className"/>ById(<xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@basicType"/> id)
        {
            return await this.QueryForObject&lt;<xsl:value-of select="./table/@className"/>Response, <xsl:value-of select="./table/@className"/>&gt;(ns, "GetById", new { value = id });
        }
        </xsl:when>
        <xsl:otherwise>
        /// &lt;summary>
        /// 根据主键获取数据.
        /// &lt;/summary><xsl:for-each select="./table/column[@isPrimaryKey='true']">
        /// &lt;param name="<xsl:value-of select="@fieldName" />"><xsl:value-of select="@description"/>&lt;/param></xsl:for-each>
        /// &lt;returns>返回<xsl:value-of select="./table/@description"/>查询结果&lt;/returns>
        public async Task&lt;Response&lt;<xsl:value-of select="./table/@className"/>Response>> Get<xsl:value-of select="./table/@className"/><xsl:text>ById(</xsl:text><xsl:for-each select="./table/column[@isPrimaryKey='true']"><xsl:value-of select="@basicType"/><xsl:text> </xsl:text><xsl:value-of select="@fieldName"/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if></xsl:for-each><xsl:text>)</xsl:text>
        {
            <xsl:call-template name="GetByIdParams" />

            return await this.QueryForObject&lt;<xsl:value-of select="./table/@className"/>Response, <xsl:value-of select="./table/@className"/>&gt;(ns, "GetById", args);
        }
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
</xsl:choose>
<xsl:choose>
    <xsl:when test="count(./table[@hasSearchData='true'])=0 and count(./table[@hasGetAll='true'])=0">
        /// &lt;summary>
        /// 查询<xsl:value-of select="./table/@description" />.
        /// &lt;/summary>
        /// &lt;param name="so"><xsl:value-of select="./table/@description"/>查询对象&lt;/param>
        /// &lt;param name="action">查询条件设置回调&lt;/param>
        /// &lt;param name="selectors">查询返回列&lt;/param>
        /// &lt;returns>返回结果&lt;/returns>
        public async Task&lt;ResponseSet&lt;<xsl:value-of select="./table/@className" />Response>> Search<xsl:value-of select="./table/@pluralClassName" />(<xsl:value-of select="./table/@className" />SO so = null, params string[] selectors)
        {
            return await this.QueryForPagedList&lt;<xsl:value-of select="./table/@className" />SO, <xsl:value-of select="./table/@className" />, <xsl:value-of select="./table/@className" />Response>(
                so<xsl:call-template name="SearchConditions"/>,
                selectors
            );
        }
    </xsl:when>
    <xsl:otherwise>
      <xsl:if test="count(./table[@hasGetAll='true'])=1">
        /// &lt;summary>
        /// 查询所有<xsl:value-of select="./table/@description" />信息.
        /// &lt;/summary>
        /// &lt;param name="so">查询条件&lt;/param>
        /// &lt;returns>返回<xsl:value-of select="./table/@description"/>的分页查询结果&lt;/returns>
        public async Task&lt;ResponseSet&lt;<xsl:value-of select="./table/@className"/>Response>> GetAll<xsl:value-of select="./table/@pluralClassName"/>(<xsl:value-of select="./table/@className"/><xsl:text>SO </xsl:text>so)
        {
            so = so ?? new <xsl:value-of select="./table/@className" />SO();

            return await this.QueryForList&lt;<xsl:value-of select="./table/@className" />SO, <xsl:value-of select="./table/@className"/>, <xsl:value-of select="./table/@className" />Response&gt;(ns, "Search<xsl:value-of select="./table/@pluralClassName"/>", so<xsl:call-template name="SearchConditions" />);
        }
      </xsl:if>
      <xsl:if test="count(./table[@hasSearchData='true'])=1">
        /// &lt;summary>
        /// 查询并分页获取<xsl:value-of select="./table/@description" />信息.
        /// &lt;/summary>
        /// &lt;param name="so">查询条件&lt;/param>
        /// &lt;returns>返回<xsl:value-of select="./table/@description"/>的分页查询结果&lt;/returns>
        public async Task&lt;ResponseSet&lt;<xsl:value-of select="./table/@className"/>Response>> Search<xsl:value-of select="./table/@pluralClassName"/>(<xsl:value-of select="./table/@className"/><xsl:text>SO </xsl:text>so)
        {
            so = so ?? new <xsl:value-of select="./table/@className" />SO();

            return await this.QueryForPagedList&lt;<xsl:value-of select="./table/@className"/>SO, <xsl:value-of select="./table/@className" />, <xsl:value-of select="./table/@className"/>Response&gt;(ns, "Search<xsl:value-of select="./table/@pluralClassName"/>", so<xsl:call-template name="SearchConditions" />);
        }
      </xsl:if>
    </xsl:otherwise>
</xsl:choose>
        #endregion

        #region Private Methods

        /// &lt;summary>
        /// 获取<xsl:value-of select="./table/@description" />.
        /// &lt;/summary>
        /// &lt;param name="so"><xsl:value-of select="./table/@description"/>查询对象&lt;/param>
        /// &lt;param name="action">查询条件设置回调&lt;/param>
        /// &lt;param name="selectors">查询返回列&lt;/param>
        /// &lt;returns>返回结果&lt;/returns>
        private async Task&lt;Response&lt;<xsl:value-of select="./table/@className" />Response>> Get<xsl:value-of select="./table/@className" />(object so = null, Action&lt;SelectCriteria&lt;<xsl:value-of select="./table/@className" />>> action = null, params string[] selectors)
        {
            return await this.QueryForObject&lt;<xsl:value-of select="./table/@className" />Response, <xsl:value-of select="./table/@className" />>(so, action, selectors);
        }

        #endregion
    }
}
    </xsl:template>

  <xsl:template name="GetByIdParams"><xsl:text>       </xsl:text>var args = new { <xsl:for-each select="./table/column[@isPrimaryKey='true']"><xsl:value-of select="@propertyName"/> = <xsl:value-of select="@fieldName"/><xsl:if test="position()!=last()">, </xsl:if></xsl:for-each> };</xsl:template>

  <xsl:template name="SearchConditions">
    <xsl:if test="count(./table/column[@isSearchCriteria='true'])>0">, <xsl:text xml:space="preserve">
                </xsl:text>criteria => criteria.Where()<xsl:text xml:space="preserve">
                    </xsl:text><xsl:for-each select="./table/column[@isSearchCriteria='true']"><xsl:choose><xsl:when test="@basicType!='string' and @basicType!='String'">.Equal</xsl:when><xsl:otherwise>.Like</xsl:otherwise></xsl:choose>(e => e.<xsl:value-of select="@propertyName"/>, () => so.<xsl:value-of select="@propertyName"/>.IsNotBlank())<xsl:if test="position()!=last()">
                    <xsl:text xml:space="preserve">
                    </xsl:text></xsl:if></xsl:for-each></xsl:if>
  </xsl:template>
</xsl:stylesheet>
