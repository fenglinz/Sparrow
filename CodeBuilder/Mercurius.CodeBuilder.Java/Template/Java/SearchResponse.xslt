<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="text" indent="yes"/>
    <xsl:include href="Common.xslt" />
  <xsl:template match="root"><xsl:call-template name="package" />
<xsl:call-template name="dependencys" />
import java.sql.Timestamp;

import com.csbr.common.so.SearchBean;
<xsl:call-template name="classDescription" />public class <xsl:value-of select="./table/@className"/>SO extends SearchBean {
  <xsl:call-template name="fields" />
  <xsl:call-template name="setters" />
  <xsl:call-template name="getters" />
}
</xsl:template>

  <xsl:template name="fields">
    <xsl:for-each select="./table/column[@isSearchCriteria='true']">
    <![CDATA[/* ]]><xsl:value-of select="@description" /><![CDATA[ */]]>
    private <xsl:value-of select="@basicType"/><xsl:text> </xsl:text><xsl:value-of select="@fieldName"/>;
</xsl:for-each>
  </xsl:template>

  <xsl:template name="setters">
    <xsl:for-each select="./table/column[@isSearchCriteria='true']">
    <![CDATA[/**]]>
    <![CDATA[ * 返回]]><xsl:value-of select="@description" />
    <![CDATA[ *]]>
    <![CDATA[ * @param ]]><xsl:value-of select="@fieldName"/><xsl:text> </xsl:text><xsl:value-of select="@description" />
    <![CDATA[ */]]>
    public void<xsl:text> set</xsl:text><xsl:value-of select="@propertyName"/>(<xsl:value-of select="@basicType"/><xsl:text> </xsl:text><xsl:value-of select="@fieldName"/>){
        this.<xsl:value-of select="@fieldName"/> = <xsl:value-of select="@fieldName"/>;
    }
</xsl:for-each>
  </xsl:template>

  <xsl:template name="getters">
    <xsl:for-each select="./table/column[@isSearchCriteria='true']">
    <![CDATA[/**]]>
    <![CDATA[ * 设置]]><xsl:value-of select="@description" />
    <![CDATA[ *]]>
    <![CDATA[ * @return ]]><xsl:value-of select="@description" />
    <![CDATA[ */]]>
    public <xsl:value-of select="@basicType"/><xsl:text> get</xsl:text><xsl:value-of select="@propertyName"/>(){
        return this.<xsl:value-of select="@fieldName"/>;
    }
</xsl:for-each>
  </xsl:template>
</xsl:stylesheet>