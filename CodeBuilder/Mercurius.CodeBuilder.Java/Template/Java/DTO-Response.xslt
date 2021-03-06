﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="text" indent="yes"/>
  <xsl:include href="Common.xslt" />
  <xsl:template match="root">package <xsl:value-of select="./table/@namespace"/>;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import com.csbr.common.service.ResponseModel;
<xsl:call-template name="responseDescription" />@ApiModel(description = "<xsl:value-of select="./table/@description"/>业务逻辑响应数据模型")
public class <xsl:value-of select="./table/@realClassName" /> extends ResponseModel {
<xsl:call-template name="fields" />
    <xsl:call-template name="setters" />
    <xsl:call-template name="getters" />
}</xsl:template>

  <xsl:template name="fields">
    <xsl:for-each select="./table/column[@igdto='false']">
    <![CDATA[/** ]]><xsl:value-of select="@description" /><![CDATA[ */]]>
    @ApiModelProperty("<xsl:value-of select="@description"/>")
    private <xsl:value-of select="@basicType"/><xsl:text> </xsl:text><xsl:value-of select="@fieldName"/>;
<xsl:if test="@isAssociate='true'">
    <![CDATA[/** ]]><xsl:value-of select="@associateDesc"/><![CDATA[ */]]>
    @ApiModelProperty("<xsl:value-of select="@associateDesc"/>")
    private String <xsl:value-of select="@associateField"/>;
</xsl:if>
</xsl:for-each>
  </xsl:template>

  <xsl:template name="setters">
    <xsl:for-each select="./table/column[@igdto='false']">
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
    <xsl:for-each select="./table/column[@igdto='false']">
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