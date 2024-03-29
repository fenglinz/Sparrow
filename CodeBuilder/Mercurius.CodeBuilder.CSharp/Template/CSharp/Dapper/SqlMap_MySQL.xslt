﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.mercurius.com/CommandText.xsd" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="xml" indent="yes" standalone="yes" encoding="utf-8" cdata-section-elements="commandText attach" />
  <xsl:preserve-space elements="commandText attach"/>
  <xsl:strip-space elements="commandText attach"/>
  
  <xsl:template match="root">
    <statements xmlns="http://www.mercurius.com/CommandText.xsd">
      <xsl:attribute name="namespace">
        <xsl:value-of select="./table/@namespace" />.<xsl:value-of select="./table/@className" />
      </xsl:attribute>
    <xsl:if test="count(./table[@hasCreate='true'])=1">
    <xsl:call-template name="create" />
    </xsl:if>
    <xsl:text>
    </xsl:text>
    <xsl:if test="count(./table[@hasUpdate='true'])=1">
    <xsl:call-template name="update" />
    </xsl:if>
    <xsl:text>
    </xsl:text>
    <xsl:if test="count(./table[@hasCreateOrUpdate='true'])=1">
    <xsl:call-template name="createOrUpdate" />
    </xsl:if>
    <xsl:text>
    </xsl:text>
    <xsl:if test="count(./table[@hasRemove='true'])=1">
    <xsl:call-template name="delete" />
    </xsl:if>
    <xsl:text>
    </xsl:text>
    <xsl:if test="count(./table[@hasSingleData='true'])=1">
    <xsl:call-template name="getByKey" />
    </xsl:if>
    <xsl:text>
    </xsl:text>
    <xsl:if test="count(./table[@hasSearchData='true'])=1 or count(./table[@hasGetAll='true'])=1">
    <xsl:call-template name="search" />
    <xsl:text>
    </xsl:text>
    </xsl:if>
</statements>
  </xsl:template>

  <xsl:template name="create">
    <xsl:comment>
      <xsl:text> 添加</xsl:text>
      <xsl:value-of select="./table/@description"/>
      <xsl:text>信息。 </xsl:text>
    </xsl:comment>
    <xsl:text>
    </xsl:text>
    <commandText name="Create" commandType="Text">
      INSERT INTO `<xsl:value-of select="./table/@name" />`
      (
       <xsl:for-each select="./table/column[@isAddColumn='true']"><xsl:text> </xsl:text>`<xsl:value-of select="@name"/>`<xsl:if test="position()!=last()"><xsl:text>,
       </xsl:text>
       </xsl:if>
       </xsl:for-each>
      )
      VALUES
      (
       <xsl:for-each select="./table/column[@isAddColumn='true']"><xsl:text> </xsl:text>@<xsl:value-of select="@propertyName" /><xsl:if test="position()!=last()"><xsl:text>,
       </xsl:text>
       </xsl:if>
       </xsl:for-each>
      )
      <attach name="Check" commandType="Text" mode="Scalar">
        SELECT 1 AS Rows FROM DUAL WHERE EXISTS(SELECT * FROM `<xsl:value-of select="./table/@name" />` WHERE <xsl:for-each select="./table/column[@isPrimaryKey='true']">
        <xsl:text>`</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>`=@</xsl:text>
        <xsl:value-of select="@propertyName"/>
        <xsl:if test="position()!=last()">
          <xsl:text> AND </xsl:text>
        </xsl:if>
      </xsl:for-each>)
      </attach>
    </commandText>
    <xsl:text>
    </xsl:text>
  </xsl:template>

  <xsl:template name="update">
    <xsl:comment>
      <xsl:text> 更新</xsl:text>
      <xsl:value-of select="./table/@description"/>
      <xsl:text>信息。 </xsl:text>
    </xsl:comment>
    <xsl:text>
    </xsl:text>
    <commandText name="Update" commandType="Text">
      UPDATE `<xsl:value-of select="./table/@name" />`
      SET
      <xsl:for-each select="./table/column[@isUpdateColumn='true']">
        <xsl:if test="position()=1">
          <xsl:text>  </xsl:text>
        </xsl:if>
        <xsl:text>`</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>`=@</xsl:text>
        <xsl:value-of select="@propertyName"/>
        <xsl:if test="position()!=last()">
        <xsl:text>,
        </xsl:text>
        </xsl:if>
      </xsl:for-each>
      WHERE <xsl:for-each select="./table/column[@isPrimaryKey='true']">
        <xsl:text>`</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>`=@</xsl:text>
        <xsl:value-of select="@propertyName"/>
        <xsl:if test="position()!=last()">
          <xsl:text> AND </xsl:text>
        </xsl:if>
      </xsl:for-each>
      <xsl:text>
      </xsl:text>
      <attach name="Check" commandType="Text" mode="Scalar">
        SELECT 1 AS Rows FROM DUAL WHERE EXISTS(SELECT * FROM `<xsl:value-of select="./table/@name" />` WHERE <xsl:for-each select="./table/column[@isPrimaryKey='true']">
        <xsl:text>`</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>`=@</xsl:text>
        <xsl:value-of select="@propertyName"/>
        <xsl:if test="position()!=last()">
          <xsl:text> AND </xsl:text>
        </xsl:if>
      </xsl:for-each>)
      </attach>
    </commandText>
    <xsl:text>
    </xsl:text>
  </xsl:template>

  <xsl:template name="createOrUpdate">
    <xsl:comment><xsl:text> 添加或者更新</xsl:text><xsl:value-of select="./table/@description"/><xsl:text>信息。 </xsl:text></xsl:comment>
    <xsl:text>
    </xsl:text>
    <commandText name="CreateOrUpdate" commandType="Text">
      INSERT INTO `<xsl:value-of select="./table/@name" />`
      (
        <xsl:for-each select="./table/column[@isIdentity='false']"><xsl:text></xsl:text>`<xsl:value-of select="@name"/>`<xsl:if test="position()!=last()"><xsl:text>,
        </xsl:text>
        </xsl:if>
        </xsl:for-each>
      )
      VALUES
      (
        <xsl:for-each select="./table/column[@isAddColumn='true']"><xsl:text></xsl:text>@<xsl:value-of select="@propertyName" /><xsl:if test="position()!=last()"><xsl:text>,
        </xsl:text>
        </xsl:if>
        </xsl:for-each>
      )
      ON DUPLICATE KEY
      UPDATE
        <xsl:for-each select="./table/column[@isUpdateColumn='true']"><xsl:text></xsl:text>`<xsl:value-of select="@name"/>`=@<xsl:value-of select="@propertyName" /><xsl:if test="position()!=last()"><xsl:text>,
        </xsl:text>
        </xsl:if>
        </xsl:for-each>
    </commandText>
    <xsl:text>
    </xsl:text>
  </xsl:template>
  
  <xsl:template name="delete">
    <xsl:comment>
      <xsl:text> 删除</xsl:text>
      <xsl:value-of select="./table/@description"/>
      <xsl:text>信息。 </xsl:text>
    </xsl:comment>
    <xsl:text>
    </xsl:text>
    <commandText name="Remove" commandType="Text">
      DELETE FROM `<xsl:value-of select="./table/@name" />` WHERE <xsl:choose>
      <xsl:when test="count(./table/column[@isPrimaryKey='true'])=1">
        <xsl:text>`</xsl:text>
        <xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@name"/>
        <xsl:text>`=@value</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:for-each select="./table/column[@isPrimaryKey='true']">
          <xsl:text>`</xsl:text>
          <xsl:value-of select="@name"/>
          <xsl:text>`=@</xsl:text>
          <xsl:value-of select="@propertyName"/>
          <xsl:if test="position()!=last()">
            <xsl:text> AND </xsl:text>
          </xsl:if>
        </xsl:for-each>
      </xsl:otherwise>
      </xsl:choose>
      <xsl:text>
      </xsl:text>
    </commandText>
    <xsl:text>
    </xsl:text>
  </xsl:template>

  <xsl:template name="getByKey">
    <xsl:comment>
      <xsl:text> 根据主键获取</xsl:text>
      <xsl:value-of select="./table/@description"/>
      <xsl:text>信息。 </xsl:text>
    </xsl:comment>
    <xsl:text>
    </xsl:text>
    <commandText name="GetById" commandType="Text">
      <xsl:text>
      SELECT
      </xsl:text>
      <xsl:for-each select="./table/column"><xsl:text>  </xsl:text>`<xsl:value-of select="@name"/>` AS `<xsl:value-of select="@propertyName"/>`<xsl:if test="position()!=last()"><xsl:text>,
      </xsl:text>
      </xsl:if>
      </xsl:for-each>
      FROM `<xsl:value-of select="./table/@name" />`
      <xsl:text>WHERE </xsl:text>
      <xsl:choose>
        <xsl:when test="count(./table/column[@isPrimaryKey='true'])=1">
          <xsl:for-each select="./table/column[@isPrimaryKey='true']">
            <xsl:text>`</xsl:text><xsl:value-of select="@name"/>
            <xsl:text>`=@value</xsl:text>
          </xsl:for-each>
        </xsl:when>
        <xsl:when test="count(./table/column[@isPrimaryKey='true'])>1">
          <xsl:for-each select="./table/column[@isPrimaryKey='true']">
            <xsl:text>`</xsl:text><xsl:value-of select="@name"/>
            <xsl:text>`=@</xsl:text><xsl:value-of select="@fieldName"/>
            <xsl:if test="position()!=last()">
              <xsl:text> AND </xsl:text>
            </xsl:if>
          </xsl:for-each>
        </xsl:when>
      </xsl:choose>
      <xsl:text>
      LIMIT 1
      </xsl:text>
    </commandText>
    <xsl:text>
    </xsl:text>
  </xsl:template>

  <xsl:template name="search">
    <xsl:comment>
      <xsl:text> 分页返回满足查询条件的</xsl:text>
      <xsl:value-of select="./table/@description"/>
      <xsl:text>信息。 </xsl:text>
    </xsl:comment>
    <xsl:text>
    </xsl:text>
    <commandText>
      <xsl:attribute name="name">Search<xsl:value-of select="./table/@pluralClassName"/></xsl:attribute>
      <xsl:attribute name="commandType">Text</xsl:attribute>
      <xsl:text>
      SELECT
      </xsl:text>
      <xsl:for-each select="./table/column"><xsl:text>  </xsl:text>`<xsl:value-of select="@name"/>` AS `<xsl:value-of select="@propertyName"/>`<xsl:if test="position()!=last()"><xsl:text>,
      </xsl:text>
      </xsl:if>
      </xsl:for-each>
      FROM `<xsl:value-of select="./table/@name" />`
    </commandText>
  </xsl:template>
</xsl:stylesheet>
