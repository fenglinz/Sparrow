﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="text" indent="yes"/>
    <xsl:include href="../Common.xslt"/>
  <xsl:template match="root"><![CDATA[// <copyright ]]>file="<xsl:value-of select="./table/@className" />Service.cs" company="<xsl:value-of select="./copyright"/>"<![CDATA[>
// 版权所有 © ]]><xsl:value-of select="./copyright"/><![CDATA[. 保留所有权利.
// </copyright>]]>
// <![CDATA[<author>]]><xsl:value-of select="./author"/><![CDATA[</author>]]>
// <![CDATA[<create>]]><xsl:value-of select="./buildDate"/><![CDATA[</create>]]>

using System;
using System.Collections.Generic;
using System.Data;
using <xsl:value-of select="./rootNamespace" />.Prime.Core.Services;
using <xsl:value-of select="./rootNamespace" />.Prime.Data.Support;
<xsl:call-template name="dependencys" />
<xsl:call-template name="namespace" />
{
    /// <![CDATA[<summary>]]>
    /// <xsl:value-of select="./table/@description" />业务逻辑接口实现。 
    /// <![CDATA[</summary>]]>
    [Module("<xsl:value-of select="./table/@moduleDescription"/>")]
    public class <xsl:value-of select="./table/@className"/>Service : ServiceSupport, I<xsl:value-of select="./table/@className" />Service
    {
        #region Fields
    <xsl:choose>
      <xsl:when test="./table/@moduleName=''">
        private static readonly StatementNamespace NS = "<xsl:value-of select="./rootNamespace" />.Repositories.<xsl:value-of select="./table/@className"/>";
      </xsl:when>
      <xsl:otherwise>
        private static readonly StatementNamespace NS = "<xsl:value-of select="./rootNamespace" />.Repositories.<xsl:value-of select="./table/@moduleName" />.<xsl:value-of select="./table/@className"/>";
      </xsl:otherwise>
    </xsl:choose>
        #endregion

        #region I<xsl:value-of select="./table/@className" />Service接口实现 
        <xsl:if test="count(./table[@hasCreate='true'])=1">
        /// <![CDATA[<summary>]]>
        /// 添加<xsl:value-of select="./table/@description" />。
        /// <![CDATA[</summary>]]>
        /// &lt;param name="<xsl:value-of select="./table/@camelClassName" />"><xsl:value-of select="./table/@description"/>&lt;/param>
        /// &lt;returns>返回结果&lt;/returns>
        public Response Create(<xsl:value-of select="./table/@className" /><xsl:text> </xsl:text><xsl:value-of select="./table/@camelClassName"/>)
        {
            return this.Update&lt;<xsl:value-of select="./table/@className" />&gt;(NS, "Create", <xsl:value-of select="./table/@camelClassName" />);
        }
        </xsl:if>
        <xsl:if test="count(./table[@hasUpdate='true'])=1">
        /// &lt;summary>
        /// 编辑<xsl:value-of select="./table/@description" />。
        /// &lt;/summary>
        /// &lt;param name="<xsl:value-of select="./table/@camelClassName"/>"><xsl:value-of select="./table/@description"/>&lt;/param>
        /// &lt;returns>返回结果&lt;/returns>
        public Response Update(<xsl:value-of select="./table/@className"/><xsl:text> </xsl:text><xsl:value-of select="./table/@camelClassName"/>)
        {
            return this.Update&lt;<xsl:value-of select="./table/@className" />&gt;(NS, "Update", <xsl:value-of select="./table/@camelClassName" />);
        }
        </xsl:if>
        <xsl:if test="count(./table[@hasCreateOrUpdate='true'])=1">
        /// &lt;summary>
        /// 添加或者编辑<xsl:value-of select="./table/@description" />
        /// &lt;/summary>
        /// &lt;param name="<xsl:value-of select="./table/@camelClassName"/>"><xsl:value-of select="./table/@description"/>&lt;/param>
        /// &lt;returns>返回添加或保存结果&lt;/returns>
        public Response CreateOrUpdate(<xsl:value-of select="./table/@className"/><xsl:text> </xsl:text><xsl:value-of select="./table/@camelClassName"/>)
        {
            return this.Update&lt;<xsl:value-of select="./table/@className" />&gt;(NS, "CreateOrUpdate", <xsl:value-of select="./table/@camelClassName"/>);
        }
        </xsl:if>
        <xsl:if test="count(./table[@hasRemove='true'])=1">
        <xsl:choose>
        <xsl:when test="count(./table/column[@isPrimaryKey='true'])=1">
        /// &lt;summary>
        /// 根据主键删除<xsl:value-of select="./table/@description" />信息。
        /// &lt;/summary>
        /// &lt;param name="id"><xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@description"/>&lt;/param>
        /// &lt;returns>返回删除结果&lt;/returns>
        public Response Remove(<xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@basicType"/> id)
        {
            return this.Delete&lt;<xsl:value-of select="./table/@className" />&gt;(NS, "Remove", id);
        }
        </xsl:when>
        <xsl:otherwise>
        /// &lt;summary>
        /// 根据主键删除<xsl:value-of select="./table/@description" />信息。
        /// &lt;/summary><xsl:for-each select="./table/column[@isPrimaryKey='true']">
        /// &lt;param name="<xsl:value-of select="@fieldName" />"><xsl:value-of select="@description"/>&lt;/param>
          </xsl:for-each>
        /// &lt;returns>返回删除结果&lt;/returns>
        public Response Remove(
          <xsl:for-each select="./table/column[@isPrimaryKey='true']">
            <xsl:value-of select="@basicType"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="@fieldName"/>
            <xsl:if test="position()!=last()">
              <xsl:text>, </xsl:text>
            </xsl:if>
          </xsl:for-each><xsl:text>)</xsl:text>
        {
            var args = <xsl:call-template name="GetByIdParams" />;
             
            return this.Delete&lt;<xsl:value-of select="./table/@className" />&gt;(NS, "Remove", args);
        }
        </xsl:otherwise>
      </xsl:choose></xsl:if>
      <xsl:if test="count(./table[@hasSingleData='true'])=1">
        <xsl:choose>
          <xsl:when test="count(./table/column[@isPrimaryKey='true'])=1">
        /// &lt;summary>
        /// 根据主键获取<xsl:value-of select="./table/@description" />信息。
        /// &lt;/summary>
        /// &lt;param name="id"><xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@description"/>&lt;/param>
        /// &lt;returns>返回<xsl:value-of select="./table/@description"/>查询结果&lt;/returns>
        public Response&lt;<xsl:value-of select="./table/@className"/>> Get<xsl:value-of select="./table/@className"/>ById(<xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@basicType"/> id)
        {
            return this.QueryForObject&lt;<xsl:value-of select="./table/@className"/>>(NS, "GetById", id);
        }
        </xsl:when>
        <xsl:otherwise>
        /// &lt;summary>
        /// 根据主键获取数据。
        /// &lt;/summary><xsl:for-each select="./table/column[@isPrimaryKey='true']">
        /// &lt;param name="<xsl:value-of select="@fieldName" />"><xsl:value-of select="@description"/>&lt;/param></xsl:for-each>
        /// &lt;returns>返回<xsl:value-of select="./table/@description"/>查询结果&lt;/returns>
        public Response&lt;<xsl:value-of select="./table/@className"/>> Get<xsl:value-of select="./table/@className"/><xsl:text>ById(</xsl:text>
            <xsl:for-each select="./table/column[@isPrimaryKey='true']">
              <xsl:value-of select="@basicType"/><xsl:text> </xsl:text>
              <xsl:value-of select="@fieldName"/>
              <xsl:if test="position()!=last()">
                <xsl:text>, </xsl:text>
              </xsl:if>
            </xsl:for-each><xsl:text>)</xsl:text>
        {
            var args = <xsl:call-template name="GetByIdParams" />;

            return this.QueryForObject&lt;<xsl:value-of select="./table/@className"/>>(NS, "GetById", args);
        }
        </xsl:otherwise>
      </xsl:choose>
      </xsl:if>

      <xsl:if test="count(./table[@hasGetAll='true'])=1">
        /// &lt;summary>
        /// 获取所有<xsl:value-of select="./table/@description" />信息。
        /// &lt;/summary>
        /// &lt;param name="so">查询条件&lt;/param>
        /// &lt;returns>返回符合条件的<xsl:value-of select="./table/@description"/>查询结果&lt;/returns>
        public ResponseSet&lt;<xsl:value-of select="./table/@className"/>> GetAll<xsl:value-of select="./table/@pluralClassName"/>(<xsl:value-of select="./table/@className"/><xsl:text>SO </xsl:text>so)
        {
            so = so ?? new <xsl:value-of select="./table/@className" />SO();

            return this.QueryForList&lt;<xsl:value-of select="./table/@className"/>>(NS, "Search<xsl:value-of select="./table/@pluralClassName" />", so);
        }
      </xsl:if>

        <xsl:if test="count(./table[@hasSearchData='true'])=1">
        /// &lt;summary>
        /// 查询并分页获取<xsl:value-of select="./table/@description" />信息。
        /// &lt;/summary>
        /// &lt;param name="so">查询条件&lt;/param>
        /// &lt;returns>返回符合条件的<xsl:value-of select="./table/@description" />分页查询结果&lt;/returns>
        public ResponseSet&lt;<xsl:value-of select="./table/@className"/>> Search<xsl:value-of select="./table/@pluralClassName"/>(<xsl:value-of select="./table/@className"/><xsl:text>SO </xsl:text>so)
        {
            so = so ?? new <xsl:value-of select="./table/@className" />SO();

            return this.QueryForPagedList&lt;<xsl:value-of select="./table/@className"/>>(NS, "Search<xsl:value-of select="./table/@pluralClassName" />", so);
        }
      </xsl:if>
        #endregion
    }
}
    </xsl:template>

  <xsl:template name="GetByIdParams">
      new {
      <xsl:for-each select="./table/column[@isPrimaryKey='true']">
          <xsl:value-of select="@propertyName"/> = <xsl:value-of select="@fieldName"/>
          <xsl:if test="position()!=last()">
            <xsl:text>, </xsl:text>
          </xsl:if>
        </xsl:for-each>}
  </xsl:template>
</xsl:stylesheet>
