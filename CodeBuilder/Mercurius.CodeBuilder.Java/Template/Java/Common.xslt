<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:template name="package">package <xsl:value-of select="./table/@namespace"/>;
</xsl:template>
<xsl:template name="dependencys"><xsl:for-each select="./dependencys/dependency">import <xsl:value-of select="."/>;
</xsl:for-each>
</xsl:template>

  <xsl:template name="soDescription">
/**
 * <xsl:value-of select="./table/@description" />查询实体.
 *
 * @author <xsl:value-of select="./author"/>
 * @since <xsl:value-of select="./buildDate"/>
 */
</xsl:template>

  <xsl:template name="entityDescription">
/**
 * <xsl:value-of select="./table/@description" />实体.
 *
 * @author <xsl:value-of select="./author"/>
 * @since <xsl:value-of select="./buildDate"/>
 */
</xsl:template>

  <xsl:template name="mapperDescription">
/**
 * <xsl:value-of select="./table/@description" />实体持久化接口.
 *
 * @author <xsl:value-of select="./author"/>
 * @since <xsl:value-of select="./buildDate"/>
 */
</xsl:template>

  <xsl:template name="serviceDescription">
/**
 * <xsl:value-of select="./table/@description" />业务逻辑.
 *
 * @author <xsl:value-of select="./author"/>
 * @since <xsl:value-of select="./buildDate"/>
 */
</xsl:template>

  <xsl:template name="requestDescription">
/**
 * <xsl:value-of select="./table/@description" />业务逻辑请求数据模型.
 *
 * @author <xsl:value-of select="./author"/>
 * @since <xsl:value-of select="./buildDate"/>
 */
</xsl:template>

  <xsl:template name="responseDescription">
/**
 * <xsl:value-of select="./table/@description" />业务逻辑响应数据模型.
 *
 * @author <xsl:value-of select="./author"/>
 * @since <xsl:value-of select="./buildDate"/>
 */
</xsl:template>

  <xsl:template name="apiDescription">
/**
 * <xsl:value-of select="./table/@description" />Web Api服务控制器.
 *
 * @author <xsl:value-of select="./author"/>
 * @since <xsl:value-of select="./buildDate"/>
 */
</xsl:template>

  <xsl:template name="whiteSpace">
    <xsl:text xml:space="preserve">
    </xsl:text>
  </xsl:template>
</xsl:stylesheet>
