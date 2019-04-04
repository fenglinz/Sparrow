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
  <xsl:template name="classDescription">
    /// &lt;summary&gt;
    /// <xsl:value-of select="./table/@description" />。
    /// &lt;/summary>&gt;</xsl:template>

  <xsl:template name="soDescription">
    /// &lt;summary&gt;
    /// <xsl:value-of select="./table/@description" />查询实体.
    /// &lt;/sumary&gt;</xsl:template>

  <xsl:template name="entityDescription">
    /// &lt;summary&gt;
    /// <xsl:value-of select="./table/@description" />实体.
    /// &lt;/summary&gt;</xsl:template>

  <xsl:template name="mapperDescription">
    /// &lt;summary&gt;
    /// <xsl:value-of select="./table/@description" />实体持久化接口.
    /// &lt;/summary&gt;</xsl:template>

  <xsl:template name="serviceDescription">
    /// &lt;summary&gt;
    /// <xsl:value-of select="./table/@description" />业务逻辑.
    /// &lt;/summary&gt;</xsl:template>

  <xsl:template name="requestDescription">
    /// &lt;summary&gt;
    /// <xsl:value-of select="./table/@description" />业务逻辑请求数据模型.
    /// &lt;/summary&gt;</xsl:template>

  <xsl:template name="responseDescription">
    /// &lt;summary&gt;
    /// <xsl:value-of select="./table/@description" />业务逻辑响应数据模型.
    /// &lt;/summary&gt;</xsl:template>

  <xsl:template name="apiDescription">
    /// &lt;summary&gt;
    /// <xsl:value-of select="./table/@description" />Web Api服务控制器.
    /// &lt;/summary&gt;</xsl:template>

  <xsl:template name="whiteSpace">
    <xsl:text xml:space="preserve">
    </xsl:text>
  </xsl:template>
</xsl:stylesheet>
