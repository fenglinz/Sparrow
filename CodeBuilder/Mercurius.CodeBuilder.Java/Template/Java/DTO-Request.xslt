﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="text" indent="yes"/>
  <xsl:include href="Common.xslt" />
  <xsl:template match="root">package <xsl:value-of select="./table/@namespace"/>;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

import org.hibernate.validator.constraints.Length;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import com.csbr.common.service.RequestModel;

<xsl:call-template name="requestDescription" />@ApiModel(description = "<xsl:value-of select="./table/@description"/>业务逻辑请求数据模型")
public class <xsl:value-of select="./table/@realClassName" /> extends RequestModel {
    <xsl:call-template name="fields" />
    <xsl:call-template name="setters" />
    <xsl:call-template name="getters" />
}</xsl:template>

  <xsl:template name="fields">
    <xsl:for-each select="./table/column[@igdto='false']">
    <![CDATA[/** ]]><xsl:value-of select="@description" /><![CDATA[ */]]>
    @ApiModelProperty("<xsl:value-of select="@description"/>")<xsl:if test="@validLength='true'">
    @Length(max = <xsl:value-of select="@length" />, message = "<xsl:value-of select="@shortDesc" />长度不能超过<xsl:value-of select="@length" />个字符.")</xsl:if>
    private <xsl:value-of select="@basicType"/><xsl:text> </xsl:text><xsl:value-of select="@fieldName"/>;
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
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>