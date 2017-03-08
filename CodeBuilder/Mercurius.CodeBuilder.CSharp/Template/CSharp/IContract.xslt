<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="text" indent="yes"/>
  <xsl:include href="Common.xslt" />
  <xsl:template match="root"><![CDATA[// <copyright ]]>file="I<xsl:value-of select="./table/@className" />Service.cs" company="<xsl:value-of select="./copyright"/>"<![CDATA[>
// 版权所有 © ]]><xsl:value-of select="./copyright"/><![CDATA[. 保留所有权利.
// </copyright>]]>
// <![CDATA[<author>]]><xsl:value-of select="./author"/><![CDATA[</author>]]>
// <![CDATA[<create>]]><xsl:value-of select="./buildDate"/><![CDATA[</create>]]>

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using YlY2PRO.PlatForm.Core.Services;
<xsl:call-template name="dependencys" />
<xsl:call-template name="namespace" />
{
    /// <![CDATA[<summary>]]>
    /// <xsl:value-of select="./table/@description" />业务逻辑接口。
    /// <![CDATA[</summary>]]>
    public interface I<xsl:value-of select="./table/@className"/>Service
    {   <xsl:if test="count(./table[@hasCreate='true'])=1">
        /// <![CDATA[<summary>]]>
        /// 添加<xsl:value-of select="./table/@description" />。
        /// <![CDATA[</summary>]]>
        /// &lt;param name="<xsl:value-of select="./table/@camelClassName"/>"><xsl:value-of select="./table/@description"/>&lt;/param>
        /// &lt;returns>返回添加结果&lt;/returns>
        Response Create(<xsl:value-of select="./table/@className" /><xsl:text> </xsl:text><xsl:value-of select="./table/@camelClassName"/>);
        </xsl:if>
        <xsl:if test="count(./table[@hasUpdate='true'])=1">
        /// &lt;summary>
        /// 编辑<xsl:value-of select="./table/@description" />。
        /// &lt;/summary>
        /// &lt;param name="<xsl:value-of select="./table/@camelClassName"/>"><xsl:value-of select="./table/@description"/>&lt;/param>
        /// &lt;returns>返回编辑结果&lt;/returns>
        Response Update(<xsl:value-of select="./table/@className"/><xsl:text> </xsl:text><xsl:value-of select="./table/@camelClassName"/>);
        </xsl:if>
        <xsl:if test="count(./table[@hasCreateOrUpdate='true'])=1">
        /// &lt;summary>
        /// 添加或者编辑<xsl:value-of select="./table/@description" />
        /// &lt;/summary>
        /// &lt;param name="<xsl:value-of select="./table/@camelClassName"/>"><xsl:value-of select="./table/@description"/>&lt;/param>
        /// &lt;returns>返回添加或保存结果&lt;/returns>
        Response CreateOrUpdate(<xsl:value-of select="./table/@className"/><xsl:text> </xsl:text><xsl:value-of select="./table/@camelClassName"/>);
        </xsl:if>
        <xsl:if test="count(./table[@hasRemove='true'])=1">
        <xsl:choose>
        <xsl:when test="count(./table/column[@isPrimaryKey='true'])=1">
        /// &lt;summary>
        /// 根据主键删除<xsl:value-of select="./table/@description" />信息。
        /// &lt;/summary>
        /// &lt;param name="id"><xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@description"/>&lt;/param>
        /// &lt;returns>返回删除结果&lt;/returns>
        Response Remove(<xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@basicType"/> id);
        </xsl:when>
        <xsl:otherwise>
        /// &lt;summary>
        /// 根据主键删除<xsl:value-of select="./table/@description" />信息。
        /// &lt;/summary><xsl:for-each select="./table/column[@isPrimaryKey='true']">
        /// &lt;param name="<xsl:value-of select="@fieldName" />"><xsl:value-of select="@description"/>&lt;/param>
        </xsl:for-each>
        /// &lt;returns>返回删除结果&lt;/returns>
        Response Remove(<xsl:for-each select="./table/column[@isPrimaryKey='true']"><xsl:value-of select="@basicType"/><xsl:text> </xsl:text><xsl:value-of select="@fieldName"/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if></xsl:for-each><xsl:text>);</xsl:text></xsl:otherwise></xsl:choose></xsl:if>

      <xsl:if test="count(./table[@hasSingleData='true'])=1">
      <xsl:choose>
        <xsl:when test="count(./table/column[@isPrimaryKey='true'])=1">
        /// &lt;summary>
        /// 根据主键获取<xsl:value-of select="./table/@description" />信息。
        /// &lt;/summary>
        /// &lt;param name="id"><xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@description"/>&lt;/param>
        /// &lt;returns>返回<xsl:value-of select="./table/@description"/>查询结果&lt;/returns>
        Response&lt;<xsl:value-of select="./table/@className"/>> Get<xsl:value-of select="./table/@className"/>ById(<xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@basicType"/> id);
        </xsl:when><xsl:otherwise>
        /// &lt;summary>
        /// 根据主键获取<xsl:value-of select="./table/@description" />信息。
        /// &lt;/summary><xsl:for-each select="./table/column[@isPrimaryKey='true']">
        /// &lt;param name="<xsl:value-of select="@fieldName" />"><xsl:value-of select="@description"/>&lt;/param></xsl:for-each>
        /// &lt;returns>返回<xsl:value-of select="./table/@description"/>查询结果&lt;/returns>
        Response&lt;<xsl:value-of select="./table/@className"/>> Get<xsl:value-of select="./table/@className"/><xsl:text>ById(</xsl:text><xsl:for-each select="./table/column[@isPrimaryKey='true']"><xsl:value-of select="@basicType"/><xsl:text> </xsl:text><xsl:value-of select="@fieldName"/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if></xsl:for-each><xsl:text>);</xsl:text></xsl:otherwise></xsl:choose>
      </xsl:if>

      <xsl:if test="count(./table[@hasSearchData='true'])=1">
        /// &lt;summary>
        /// 查询并分页获取<xsl:value-of select="./table/@description" />信息。
        /// &lt;/summary>
        /// &lt;param name="so">查询条件&lt;/param>
        /// &lt;returns>返回结果&lt;/returns>
        ResponseSet&lt;<xsl:value-of select="./table/@className"/>> Search<xsl:value-of select="./table/@pluralClassName"/>(<xsl:value-of select="./table/@className"/><xsl:text>SO </xsl:text>so);</xsl:if>
    }
}
  </xsl:template>
</xsl:stylesheet>
