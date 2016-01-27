<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:template name="dependencys">
    <xsl:for-each select="./dependencys/dependency">using <xsl:value-of select="."/>;
</xsl:for-each>
  </xsl:template>
  
  <xsl:template name="namespace">
namespace <xsl:value-of select="./table/@namespace"/>
  </xsl:template>
  <xsl:template name="classDescription">/// <![CDATA[<summary>]]>
    /// <xsl:value-of select="./table/@description" />。
    /// <![CDATA[</summary>]]></xsl:template>

  <xsl:template name="whiteSpace">
    <xsl:text xml:space="preserve">
    </xsl:text>
  </xsl:template>
</xsl:stylesheet>
