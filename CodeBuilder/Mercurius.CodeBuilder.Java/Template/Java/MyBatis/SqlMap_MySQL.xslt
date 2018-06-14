<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="xml" indent="yes" encoding="utf-8"
   doctype-public="-//mybatis.org//DTD Mapper 3.0//EN"
   doctype-system="http://mybatis.org/dtd/mybatis-3-mapper.dtd" />
  <xsl:preserve-space elements=" insert select delete update sql"/>
  <xsl:strip-space elements="insert select delete update sql"/>

  <xsl:template match="root">
<mapper>
  <xsl:attribute name="namespace">
    <xsl:value-of select="./table/@namespace" />
    <xsl:text>.</xsl:text>
    <xsl:value-of select="./table/@className" />
    <xsl:text>Mapper</xsl:text>
  </xsl:attribute>
<xsl:text>

</xsl:text>
<xsl:if test="count(./table[@hasCreate='true'])=1"><xsl:call-template name="create" /></xsl:if>
<xsl:text>
</xsl:text>
<xsl:if test="count(./table[@hasUpdate='true'])=1"><xsl:call-template name="update" /></xsl:if>
<xsl:text>
</xsl:text>
<xsl:if test="count(./table[@hasCreateOrUpdate='true'])=1"><xsl:call-template name="createOrUpdate" /></xsl:if>
<xsl:text>
</xsl:text>
<xsl:if test="count(./table[@hasRemove='true'])=1"><xsl:call-template name="delete" /></xsl:if>
<xsl:text>
</xsl:text>
<xsl:if test="count(./table[@hasSingleData='true'])=1"><xsl:call-template name="getByKey" /></xsl:if>
<xsl:text>
</xsl:text>
<xsl:if test="count(./table[@hasSearchData='true'])=1 or count(./table[@hasGetAll='true'])=1"><xsl:call-template name="search" />
<xsl:text>
</xsl:text>
<xsl:call-template name="searchConditions" />
</xsl:if>
<xsl:text>
</xsl:text>
</mapper>
  </xsl:template>
<xsl:template name="create">
  <xsl:text disable-output-escaping="yes">  &lt;!-- 添加</xsl:text><xsl:value-of select="./table/@description"/><xsl:text disable-output-escaping="yes">信息 --&gt;
  </xsl:text>
  <insert id="create">
      <xsl:attribute name="parameterType">
        <xsl:value-of select="./table/@camelClassName"/>
      </xsl:attribute>
      <xsl:text disable-output-escaping="yes">
    &lt;![CDATA[</xsl:text>
      INSERT INTO `<xsl:value-of select="./table/@name" />`
      (
      <xsl:for-each select="./table/column[@isIdentity='false']">
        <xsl:text>  </xsl:text>`<xsl:value-of select="@name"/>`<xsl:if test="position()!=last()">
        <xsl:text>,
      </xsl:text>
        </xsl:if>
      </xsl:for-each>
      )
      VALUES
      (
      <xsl:for-each select="./table/column[@isIdentity='false']">
      <xsl:text>  </xsl:text>#{<xsl:value-of select="@fieldName" />, jdbcType=<xsl:value-of select="@jdbcType" />}<xsl:if test="position()!=last()">
        <xsl:text>,
      </xsl:text>
      </xsl:if>
      </xsl:for-each>
      )
    <xsl:text disable-output-escaping="yes">]]&gt;
  </xsl:text>
  </insert>
    <xsl:text>
</xsl:text>
  </xsl:template>

  <xsl:template name="update">
  <xsl:text disable-output-escaping="yes">  &lt;!-- 更新</xsl:text><xsl:value-of select="./table/@description"/><xsl:text disable-output-escaping="yes">信息 --&gt;
  </xsl:text>
    <update id="update">
      <xsl:attribute name="parameterType">
        <xsl:value-of select="./table/@camelClassName"/>
      </xsl:attribute>
      <xsl:text disable-output-escaping="yes">
    &lt;![CDATA[</xsl:text>
      UPDATE `<xsl:value-of select="./table/@name" />`
      SET
      <xsl:for-each select="./table/column[@isPrimaryKey='false']">
        <xsl:if test="position()=1">
          <xsl:text>  </xsl:text>
        </xsl:if>
        <xsl:text>`</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>`=#{</xsl:text>
        <xsl:value-of select="@fieldName"/>, jdbcType=<xsl:value-of select="@jdbcType" />}<xsl:if test="position()!=last()"><xsl:text>,
        </xsl:text>
        </xsl:if>
      </xsl:for-each>
      WHERE <xsl:for-each select="./table/column[@isPrimaryKey='true']">
        <xsl:text>`</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>`=#{</xsl:text>
        <xsl:value-of select="@fieldName"/>
        <xsl:text>}</xsl:text>
        <xsl:if test="position()!=last()">
          <xsl:text> AND </xsl:text>
        </xsl:if>
      </xsl:for-each>
      <xsl:text>
    </xsl:text>
  <xsl:text disable-output-escaping="yes">]]&gt;
  </xsl:text>
    </update>
    <xsl:text>
</xsl:text>
  </xsl:template>

  <xsl:template name="createOrUpdate">
  <xsl:text disable-output-escaping="yes">  &lt;!-- 添加或修改</xsl:text><xsl:value-of select="./table/@description"/><xsl:text disable-output-escaping="yes">信息 --&gt;
  </xsl:text>
    <update id="createOrUpdate">
      <xsl:attribute name="parameterType">
        <xsl:value-of select="./table/@camelClassName"/>
      </xsl:attribute>
      <xsl:text disable-output-escaping="yes">
    &lt;![CDATA[</xsl:text>
      INSERT INTO `<xsl:value-of select="./table/@name" />`
      (
      <xsl:for-each select="./table/column[@isIdentity='false']">
        <xsl:text>  </xsl:text>`<xsl:value-of select="@name"/>`<xsl:if test="position()!=last()">
        <xsl:text>,
      </xsl:text>
        </xsl:if>
      </xsl:for-each>
      )
      VALUES
      (
      <xsl:for-each select="./table/column[@isIdentity='false']">
        <xsl:text>  </xsl:text>#{<xsl:value-of select="@fieldName" />, jdbcType=<xsl:value-of select="@jdbcType" />}<xsl:if test="position()!=last()">
        <xsl:text>,
      </xsl:text>
        </xsl:if>
      </xsl:for-each>
      )
      ON DUPLICATE KEY
      UPDATE
      <xsl:for-each select="./table/column[@isIdentity='false']">
        <xsl:text>  </xsl:text>`<xsl:value-of select="@name"/>`=#{<xsl:value-of select="@fieldName" />, jdbcType=<xsl:value-of select="@jdbcType" />}<xsl:if test="position()!=last()">
          <xsl:text>,
      </xsl:text>
        </xsl:if>
      </xsl:for-each>
      <xsl:text>
    </xsl:text>
  <xsl:text disable-output-escaping="yes">]]&gt;
  </xsl:text>
    </update>
    <xsl:text>
</xsl:text>
  </xsl:template>

  <xsl:template name="delete">
  <xsl:text disable-output-escaping="yes">  &lt;!-- 删除</xsl:text><xsl:value-of select="./table/@description"/><xsl:text disable-output-escaping="yes">信息 --&gt;
  </xsl:text>
  <delete id="remove">
      <xsl:attribute name="parameterType">
        <xsl:choose>
          <xsl:when test="count(./table/column[@isPrimaryKey='true'])=1">
            <xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@parameterType"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>map</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:text disable-output-escaping="yes">
    &lt;![CDATA[</xsl:text>
      DELETE FROM `<xsl:value-of select="./table/@name" />` WHERE <xsl:choose>
        <xsl:when test="count(./table/column[@isPrimaryKey='true'])=1">
          <xsl:text>`</xsl:text>
          <xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@name"/>
          <xsl:text>`=#{id}</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:for-each select="./table/column[@isPrimaryKey='true']">
            <xsl:text>`</xsl:text>
            <xsl:value-of select="@name"/>
            <xsl:text>`=#{</xsl:text>
            <xsl:value-of select="@fieldName"/>
            <xsl:text>}</xsl:text>
            <xsl:if test="position()!=last()">
              <xsl:text> AND </xsl:text>
            </xsl:if>
          </xsl:for-each>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text>
    </xsl:text>
  <xsl:text disable-output-escaping="yes">]]&gt;
  </xsl:text>
    </delete>
    <xsl:text>
</xsl:text>
  </xsl:template>

  <xsl:template name="getByKey">
  <xsl:text disable-output-escaping="yes">  &lt;!-- 根据主键获取</xsl:text><xsl:value-of select="./table/@description"/><xsl:text disable-output-escaping="yes">信息 --&gt;
  </xsl:text>
    <select>
      <xsl:attribute name="id">
        <xsl:text>get</xsl:text><xsl:value-of select="./table/@className" /><xsl:text>ById</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="parameterType">
        <xsl:choose>
          <xsl:when test="count(./table/column[@isPrimaryKey='true'])=1">
            <xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@parameterType"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>map</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:attribute name="resultType">
        <xsl:value-of select="./table/@camelClassName"/>
      </xsl:attribute>
      <xsl:text disable-output-escaping="yes">
    &lt;![CDATA[</xsl:text>
      <xsl:text>
      SELECT
      </xsl:text>
      <xsl:for-each select="./table/column">
        <xsl:text>  </xsl:text>`<xsl:value-of select="@name"/>` AS `<xsl:value-of select="@fieldName"/>`<xsl:if test="position()!=last()">
          <xsl:text>,
      </xsl:text>
        </xsl:if>
      </xsl:for-each>
      FROM `<xsl:value-of select="./table/@name" />`
      <xsl:text>WHERE </xsl:text>
      <xsl:choose>
        <xsl:when test="count(./table/column[@isPrimaryKey='true'])=1">
          <xsl:for-each select="./table/column[@isPrimaryKey='true']">
            <xsl:text>`</xsl:text>
            <xsl:value-of select="@name"/>
            <xsl:text>`=#{id}</xsl:text>
          </xsl:for-each>
        </xsl:when>
        <xsl:when test="count(./table/column[@isPrimaryKey='true'])>1">
          <xsl:for-each select="./table/column[@isPrimaryKey='true']">
            <xsl:text>`</xsl:text>
            <xsl:value-of select="@name"/>
            <xsl:text>`=#{</xsl:text>
            <xsl:value-of select="@fieldName"/>
            <xsl:text>}</xsl:text>
            <xsl:if test="position()!=last()">
              <xsl:text> AND </xsl:text>
            </xsl:if>
          </xsl:for-each>
        </xsl:when>
      </xsl:choose>
      <xsl:text>
      LIMIT 1
    </xsl:text>
  <xsl:text disable-output-escaping="yes">]]&gt;
  </xsl:text>
    </select>
    <xsl:text>
</xsl:text>
  </xsl:template>

  <xsl:template name="search">
  <xsl:text disable-output-escaping="yes">  &lt;!-- 分页返回满足查询条件的</xsl:text><xsl:value-of select="./table/@description"/><xsl:text disable-output-escaping="yes">信息 --&gt;
  </xsl:text>
    <select>
      <xsl:attribute name="id">search<xsl:value-of select="./table/@pluralClassName"/></xsl:attribute>
      <xsl:attribute name="parameterType"><xsl:value-of select="./table/@camelClassName"/>SO</xsl:attribute>
      <xsl:attribute name="resultType"><xsl:value-of select="./table/@camelClassName"/></xsl:attribute>
      <xsl:text disable-output-escaping="yes">
    &lt;![CDATA[</xsl:text>
      <xsl:text>
      SELECT
      </xsl:text>
      <xsl:for-each select="./table/column">
        <xsl:text>  </xsl:text>`<xsl:value-of select="@name"/>` AS `<xsl:value-of select="@fieldName"/>`<xsl:if test="position()!=last()">
          <xsl:text>,
      </xsl:text>
        </xsl:if>
      </xsl:for-each>
      FROM `<xsl:value-of select="./table/@name" />`
    <xsl:text disable-output-escaping="yes">]]&gt;
    </xsl:text>
      <include refid="searchConditions" />
      <xsl:text disable-output-escaping="yes">
    &lt;![CDATA[</xsl:text>
      <xsl:text>
      ORDER BY </xsl:text><xsl:choose>
        <xsl:when test="count(./table/column[@isPrimaryKey='true'])=1">
          <xsl:for-each select="./table/column[@isPrimaryKey='true']">`<xsl:value-of select="@name"/>` DESC</xsl:for-each>
        </xsl:when>
        <xsl:when test="count(./table/column[@isPrimaryKey='true'])>1">
          <xsl:for-each select="./table/column[@isPrimaryKey='true']">`<xsl:value-of select="@name"/>` DESC<xsl:if test="position()!=last()">,</xsl:if></xsl:for-each>
        </xsl:when></xsl:choose>
    <xsl:text disable-output-escaping="yes">]]&gt;
  </xsl:text>
    </select>
<xsl:text>
</xsl:text>
  </xsl:template>

  <xsl:template name="searchConditions">
  <xsl:text disable-output-escaping="yes">  &lt;!-- 查询条件 --&gt;
  </xsl:text>
    <sql id="searchConditions">
      <xsl:text>
    </xsl:text>
      <where>
        <xsl:for-each select="./table/column[@isSearchCriteria='true']">
          <xsl:text>
      </xsl:text>
          <if>
            <xsl:attribute name="test"><xsl:value-of select="@fieldName" />!=null and <xsl:value-of select="@fieldName" />!=''</xsl:attribute>
            <xsl:text disable-output-escaping="yes">
        &lt;![CDATA[ and </xsl:text>`<xsl:value-of select="@name"/>`=#{<xsl:value-of select="@fieldName"/>}<xsl:text disable-output-escaping="yes"> ]]&gt;</xsl:text>
            <xsl:text>
      </xsl:text>
          </if>
        </xsl:for-each>
            <xsl:text>
    </xsl:text>
      </where>
            <xsl:text>
  </xsl:text>
    </sql>
  </xsl:template>
</xsl:stylesheet>