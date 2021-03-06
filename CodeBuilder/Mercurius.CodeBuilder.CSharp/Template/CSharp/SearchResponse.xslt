﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="text" indent="yes"/>
    <xsl:include href="Common.xslt" />
  <xsl:template match="root"><![CDATA[// <copyright ]]>file="<xsl:value-of select="./table/@className" />SO.cs" company="<xsl:value-of select="./copyright"/>"<![CDATA[>
// 版权所有 © ]]><xsl:value-of select="./copyright"/><![CDATA[, 保留所有权利.
// </copyright>]]>
// <![CDATA[<author>]]><xsl:value-of select="./author"/><![CDATA[</author>]]>
// <![CDATA[<create>]]><xsl:value-of select="./buildDate"/><![CDATA[</create>]]>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Mercurius.Prime.Core.Entity;
<xsl:call-template name="dependencys" />
<xsl:call-template name="namespace" />
{
    /// &lt;summary>
    /// <xsl:value-of select="./table/@description" />查询条件。
    /// &lt;/summary>
    public class <xsl:value-of select="./table/@className"/>SO : SearchObject
    {
        #region Properties
        <xsl:for-each select="./table/column[@isSearchCriteria='true']">
        /// <![CDATA[<summary>]]>
        /// <xsl:value-of select="@description" />。
        /// <![CDATA[</summary>]]>
        [Column("<xsl:value-of select="@name"/>")]
        public <xsl:value-of select="@basicType"/><xsl:if test="@basicType!='string' and @basicType!='String'">?</xsl:if><xsl:text> </xsl:text><xsl:value-of select="@propertyName"/> { get; set; }
        </xsl:for-each>
        #endregion
    }
}
    </xsl:template>
</xsl:stylesheet>
