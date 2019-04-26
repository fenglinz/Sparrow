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
using System.Linq;
using System.Text;
<xsl:call-template name="namespace" />
{<xsl:call-template name="responseDescription" />
    public class <xsl:value-of select="./table/@realClassName" />Response
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
        public <xsl:value-of select="@basicType"/><xsl:if test="(@basicType!='string' and @basicType!='String') and @nullable='true'">?</xsl:if><xsl:text> </xsl:text><xsl:value-of select="@propertyName"/> { get; set; }
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>