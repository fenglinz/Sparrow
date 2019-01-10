<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="text" indent="yes"/>
  <xsl:include href="Common.xslt" />
  <xsl:template match="root">package <xsl:value-of select="./table/@namespace"/>;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;
<xsl:call-template name="entityDescription" />public class <xsl:value-of select="./table/@realClassName" /> {
<xsl:call-template name="fields" />
    <xsl:call-template name="setters" />
    <xsl:call-template name="getters" />
}</xsl:template>

  <xsl:template name="fields">
    <xsl:for-each select="./table/column">
    <![CDATA[/** ]]><xsl:value-of select="@description" /><![CDATA[ */]]><xsl:if test="@nullable='false'">
    @NotBlank(message = "<xsl:value-of select="@description"/>不能为空！")</xsl:if><xsl:if test="@validLength='true'">
    @Length(max = <xsl:value-of select="@length" />, message = "<xsl:value-of select="@shortDesc" />长度不能超过<xsl:value-of select="@length" />个字符.")</xsl:if>
    private <xsl:value-of select="@basicType"/><xsl:text> </xsl:text><xsl:value-of select="@fieldName"/>;
<xsl:if test="@isAssociate='true'">
    <![CDATA[/** ]]><xsl:value-of select="@associateDesc"/><![CDATA[ */]]>
    private String <xsl:value-of select="@associateField"/>;
</xsl:if>
</xsl:for-each>
  </xsl:template>

  <xsl:template name="setters">
    <xsl:for-each select="./table/column">
    <![CDATA[/**]]>
    <![CDATA[ * 设置]]><xsl:value-of select="@description" />
    <![CDATA[ *]]>
    <![CDATA[ * @param ]]><xsl:value-of select="@fieldName"/><xsl:text> </xsl:text><xsl:value-of select="@description" />
    <![CDATA[ */]]>
    public void<xsl:text> set</xsl:text><xsl:value-of select="@propertyName"/>(<xsl:value-of select="@basicType"/><xsl:text> </xsl:text><xsl:value-of select="@fieldName"/>) {
        this.<xsl:value-of select="@fieldName"/> = <xsl:value-of select="@fieldName"/>;
    }
<xsl:if test="@isAssociate='true'">
    <![CDATA[/**]]>
    <![CDATA[ * 设置]]><xsl:value-of select="@associateDesc" />
    <![CDATA[ *]]>
    <![CDATA[ * @param ]]><xsl:value-of select="@associateField"/><xsl:text> </xsl:text><xsl:value-of select="@associateDesc" />
    <![CDATA[ */]]>
    private String set<xsl:value-of select="@associatePropName"/>(String <xsl:value-of select="@associateField" />) {
        this.<xsl:value-of select="@associateField" /> = <xsl:value-of select="@associateField" />;
    }
</xsl:if>
</xsl:for-each>
  </xsl:template>

  <xsl:template name="getters">
    <xsl:for-each select="./table/column">
    <![CDATA[/**]]>
    <![CDATA[ * 返回]]><xsl:value-of select="@description" />
    <![CDATA[ *]]>
    <![CDATA[ * @return ]]><xsl:value-of select="@description" />
    <![CDATA[ */]]>
    public <xsl:value-of select="@basicType"/><xsl:text> get</xsl:text><xsl:value-of select="@propertyName"/>() {
        return this.<xsl:value-of select="@fieldName"/>;
    }
<xsl:if test="@isAssociate='true'">
    <![CDATA[/**]]>
    <![CDATA[ * 返回]]><xsl:value-of select="@associateDesc" />
    <![CDATA[ *]]>
    <![CDATA[ * @return ]]><xsl:value-of select="@associateDesc" />
    <![CDATA[ */]]>
    private String get<xsl:value-of select="@associatePropName"/>() {
        return this.<xsl:value-of select="@associateField" />;
    }
</xsl:if>
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>