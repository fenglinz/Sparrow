<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="text" indent="yes"/>
  <xsl:include href="../Common.xslt" />
  <xsl:template match="root"><![CDATA[// <copyright ]]>file="<xsl:value-of select="./table/@className" />.cs" company="<xsl:value-of select="./copyright"/>"<![CDATA[>
// 版权所有 © ]]><xsl:value-of select="./copyright"/><![CDATA[, 保留所有权利.
// </copyright>]]>
// <![CDATA[<author>]]><xsl:value-of select="./author"/><![CDATA[</author>]]>
// <![CDATA[<create>]]><xsl:value-of select="./buildDate"/><![CDATA[</create>]]>

using System;
using System.Collections.Generic;
<xsl:call-template name="namespace" />
{<xsl:call-template name="entityDescription" />
    public class <xsl:value-of select="./table/@className" />
    {
        #region Properties
<xsl:call-template name="properties" />
        #endregion
    }
}
  </xsl:template>

  <xsl:template name="properties">
    <xsl:for-each select="./table/column">
        /// <![CDATA[<summary>]]>
        /// <xsl:value-of select="@description" />.
        /// <![CDATA[</summary>]]>
        <xsl:choose><xsl:when test="(@basicType='string' or @basicType='String') and @length!='-1'">public virtual <xsl:value-of select="@basicType"/><xsl:text> </xsl:text><xsl:value-of select="@propertyName"/> { get; set; }</xsl:when><xsl:otherwise>public virtual <xsl:value-of select="@basicType"/><xsl:if test="(@basicType!='string' and @basicType!='String') and @nullable='true'">?</xsl:if><xsl:text> </xsl:text><xsl:value-of select="@propertyName"/> { get; set; }</xsl:otherwise></xsl:choose>
<xsl:text>
</xsl:text>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
