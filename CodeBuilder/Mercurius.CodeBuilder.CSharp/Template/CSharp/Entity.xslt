<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="text" indent="yes"/>
  <xsl:include href="Common.xslt" />
  <xsl:template match="root"><![CDATA[// <copyright ]]>file="<xsl:value-of select="./table/@className" />.cs" company="<xsl:value-of select="./copyright"/>"<![CDATA[>
// 版权所有 © ]]><xsl:value-of select="./copyright"/><![CDATA[. 保留所有权利.
// </copyright>]]>
// <![CDATA[<author>]]><xsl:value-of select="./author"/><![CDATA[</author>]]>
// <![CDATA[<create>]]><xsl:value-of select="./buildDate"/><![CDATA[</create>]]>

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using CSBR.Prime.Core.Entities;
<xsl:call-template name="namespace" />
{
    <xsl:call-template name="classDescription" />
    [Table("<xsl:value-of select="./table/@table"/>"<xsl:if test="./table/@table='true'">, IsView = true</xsl:if>)]
    public class <xsl:value-of select="./table/@className" />
    {
        #region 属性
    <xsl:call-template name="properties" />
        #endregion
    }
}
  </xsl:template>

  <xsl:template name="properties">
    <xsl:for-each select="./table/column">
        /// <![CDATA[<summary>]]>
        /// <xsl:value-of select="@description" />。
        /// <![CDATA[</summary>]]>
        <xsl:if test="@nullable='false'">[Required(AllowEmptyStrings = false, ErrorMessage = "<xsl:value-of select="@description" />不能为空！")]</xsl:if><xsl:if test="(@basicType='string' or @basicType='String') and @length!=-1">[StringLength(<xsl:value-of select="@length" />, ErrorMessage = "<xsl:value-of select="@description" />字符长度不能超过{1}个字符！")]</xsl:if>
        [Column("<xsl:value-of select="@name"/>"<xsl:if test="@isPrimaryKey='true'">, IsPrimaryKey = true</xsl:if><xsl:if test="@isNewGuid='true'">, IsNewGuid = true</xsl:if><xsl:if test="@nullable='true'">, IsNullable = true</xsl:if>)]<xsl:choose><xsl:when test="(@basicType='string' or @basicType='String') and @length!='-1'">
        public <xsl:value-of select="@basicType"/><xsl:text> </xsl:text><xsl:value-of select="@propertyName"/> { get; set; }
        </xsl:when>
        <xsl:otherwise>
        public <xsl:value-of select="@basicType"/><xsl:if test="(@basicType!='string' and @basicType!='String') and @nullable='true'">?</xsl:if><xsl:text> </xsl:text><xsl:value-of select="@propertyName"/> { get; set; }
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
