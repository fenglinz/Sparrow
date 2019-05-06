<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="text" indent="yes"/>
  <xsl:include href="Common.xslt" />
  <xsl:template match="root"><![CDATA[// <copyright ]]>file="<xsl:value-of select="./table/@className" />.cs" company="<xsl:value-of select="./copyright"/>"<![CDATA[>
// 版权所有 © ]]><xsl:value-of select="./copyright"/><![CDATA[, 保留所有权利.
// </copyright>]]>
// <![CDATA[<author>]]><xsl:value-of select="./author"/><![CDATA[</author>]]>
// <![CDATA[<create>]]><xsl:value-of select="./buildDate"/><![CDATA[</create>]]>

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
<xsl:call-template name="namespace" />
{<xsl:call-template name="requestDescription" />
    public class <xsl:value-of select="./table/@realClassName" />Request
    {
        #region Properties
<xsl:call-template name="fields" />
        #endregion
    }
}
</xsl:template>

  <xsl:template name="fields">
    <xsl:for-each select="./table/column[@igdto='false']">
        /// &lt;summary>
        /// <xsl:value-of select="@description" />.
        /// &lt;/summary>
        <xsl:if test="(@basicType='string' or @basicType='String') and @length!=-1">[StringLength(<xsl:value-of select="@length" />, ErrorMessage = "<xsl:value-of select="@description" />字符长度不能超过{1}个字符！")]</xsl:if>
        public <xsl:value-of select="@basicType"/><xsl:text> </xsl:text><xsl:value-of select="@propertyName"/> { get; set; }
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>