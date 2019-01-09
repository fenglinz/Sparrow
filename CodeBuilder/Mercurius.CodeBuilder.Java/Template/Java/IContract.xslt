<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="text" indent="yes"/>
  <xsl:include href="Common.xslt" />
  <xsl:template match="root">
<xsl:call-template name="package" />
<xsl:text>
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

</xsl:text>
<xsl:call-template name="dependencys" />
<xsl:call-template name="mapperDescription" />@Mapper
@Repository
public interface <xsl:value-of select="./table/@realClassName"/> {
<xsl:if test="count(./table[@hasCreate='true'])=1">
    <![CDATA[/**]]>
    <![CDATA[ * ]]><xsl:value-of select="./table/@description" />.
    <![CDATA[ *]]>
    <![CDATA[ * @param ]]><xsl:value-of select="./table/@camelClassName"/><xsl:text> </xsl:text><xsl:value-of select="./table/@description"/>
    <![CDATA[ */]]>
    void create(<xsl:value-of select="./table/@className" /><xsl:text> </xsl:text><xsl:value-of select="./table/@camelClassName"/>);
</xsl:if>
    <xsl:if test="count(./table[@hasUpdate='true'])=1">
    <![CDATA[/**]]>
    <![CDATA[ * 编辑]]><xsl:value-of select="./table/@description" />.
    <![CDATA[ *]]>
    <![CDATA[ * @param ]]><xsl:value-of select="./table/@camelClassName"/><xsl:text> </xsl:text><xsl:value-of select="./table/@description"/>
    <![CDATA[ */]]>
    void update(<xsl:value-of select="./table/@className"/><xsl:text> </xsl:text><xsl:value-of select="./table/@camelClassName"/>);
</xsl:if>
    <xsl:if test="count(./table[@hasCreateOrUpdate='true'])=1">
    <![CDATA[/**]]>
    <![CDATA[ * 添加或者编辑]]><xsl:value-of select="./table/@description" />.
    <![CDATA[ *]]>
    <![CDATA[ * @param ]]><xsl:value-of select="./table/@camelClassName"/><xsl:text> </xsl:text><xsl:value-of select="./table/@description"/>
    <![CDATA[ */]]>
    void createOrUpdate(<xsl:value-of select="./table/@className"/><xsl:text> </xsl:text><xsl:value-of select="./table/@camelClassName"/>);
</xsl:if>
    <xsl:if test="count(./table[@hasRemove='true'])=1">
    <xsl:choose>
    <xsl:when test="count(./table/column[@isPrimaryKey='true'])=1">
    <![CDATA[/**]]>
    <![CDATA[ * 根据主键删除]]><xsl:value-of select="./table/@description" />信息.
    <![CDATA[ *]]>
    <![CDATA[ * @param id ]]><xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@description"/>
    <![CDATA[ */]]>
    void remove(<xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@basicType"/> id);
</xsl:when>
    <xsl:otherwise>
    <![CDATA[/**]]>
    <![CDATA[ * ]]><xsl:value-of select="./table/@description" />信息.
    <![CDATA[ *]]>
    <![CDATA[ * @param map]]><xsl:for-each select="./table/column[@isPrimaryKey='true']">
    <![CDATA[ *   @key ]]><xsl:value-of select="@fieldName" /><xsl:text> </xsl:text><xsl:value-of select="@description"/>
    </xsl:for-each>
    <![CDATA[ */]]>
    void remove(java.util.HashMap map);
</xsl:otherwise>
</xsl:choose></xsl:if>

<xsl:if test="count(./table[@hasSingleData='true'])=1">
  <xsl:choose>
    <xsl:when test="count(./table/column[@isPrimaryKey='true'])=1">
    <![CDATA[/**]]>
    <![CDATA[ * 根据主键获取]]><xsl:value-of select="./table/@description" />信息.
    <![CDATA[ *]]>
    <![CDATA[ * @param id ]]><xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@description"/>
    <![CDATA[ *]]>
    <![CDATA[ * @return ]]>返回<xsl:value-of select="./table/@description"/>查询结果
    <![CDATA[ */]]>
    <xsl:value-of select="./table/@className"/> get<xsl:value-of select="./table/@className"/>ById(<xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@basicType"/> id);
</xsl:when><xsl:otherwise>
    <![CDATA[/**]]>
    <![CDATA[ * 获取]]><xsl:value-of select="./table/@description" />信息.
    <![CDATA[ *]]>
    <![CDATA[ * @param map]]><xsl:for-each select="./table/column[@isPrimaryKey='true']">
    <![CDATA[ *   @key ]]><xsl:value-of select="@fieldName" /><xsl:text> </xsl:text><xsl:value-of select="@description"/></xsl:for-each>
    <![CDATA[ *]]>
    <![CDATA[ * @return ]]><xsl:value-of select="./table/@description"/>查询结果
    <![CDATA[ */]]>
    <xsl:value-of select="./table/@className"/> get<xsl:value-of select="./table/@className"/><xsl:text>ById(java.util.HashMap map);
</xsl:text></xsl:otherwise></xsl:choose>
</xsl:if>

  <xsl:if test="count(./table[@hasSearchData='true'])>0 or count(./table[@hasGetAll='true'])>0">
    <![CDATA[/**]]>
    <![CDATA[ * 查询]]><xsl:value-of select="./table/@description" />信息.
    <![CDATA[ *]]>
    <![CDATA[ * @param so 查询条件]]>
    <![CDATA[ *]]>
    <![CDATA[ * @return ]]><xsl:value-of select="./table/@description" />查询结果
    <![CDATA[ */]]>
    List&lt;<xsl:value-of select="./table/@className"/>&gt; search<xsl:value-of select="./table/@pluralClassName"/>(<xsl:value-of select="./table/@className"/><xsl:text>SO </xsl:text>so);</xsl:if>
}</xsl:template>
</xsl:stylesheet>
