<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.csbr.com/CommandText.xsd" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="xml" indent="yes" standalone="yes" encoding="utf-8" cdata-section-elements="CommandText" />
  <xsl:preserve-space elements="CommandText"/>
  <xsl:strip-space elements="CommandText"/>
  
  <xsl:template match="root">
    <CommandTexts xmlns="http://www.csbr.com/CommandText.xsd">
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
    <xsl:if test="count(./table[@hasSearchData='true'])=1">
    <xsl:call-template name="search" />
    <xsl:text>
    </xsl:text>
    <xsl:call-template name="searchCount" />
    <xsl:text>
    </xsl:text>
    </xsl:if>
</CommandTexts>
  </xsl:template>

  <xsl:template name="create">
    <xsl:comment>
      <xsl:text> 添加</xsl:text>
      <xsl:value-of select="./table/@description"/>
      <xsl:text>信息。 </xsl:text>
    </xsl:comment>
    <xsl:text>
    </xsl:text>
    <CommandText name="Create" commandType="Text">
      INSERT INTO `<xsl:value-of select="./table/@name" />`
      (
        <xsl:for-each select="./table/column[@isIdentity='false']"><xsl:text> </xsl:text>`<xsl:value-of select="@name"/>`<xsl:if test="position()!=last()"><xsl:text>,
        </xsl:text>
        </xsl:if>
        </xsl:for-each>
      )
      VALUES
      (
        <xsl:for-each select="./table/column[@isIdentity='false']"><xsl:text> </xsl:text>@<xsl:value-of select="@propertyName" /><xsl:if test="position()!=last()"><xsl:text>,
        </xsl:text>
        </xsl:if>
        </xsl:for-each>
      )
    </CommandText>
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
    <CommandText name="Update" commandType="Text">
      UPDATE `<xsl:value-of select="./table/@name" />`
      SET
      <xsl:for-each select="./table/column[@isPrimaryKey='false']">
        <xsl:if test="position()=1">
          <xsl:text>    </xsl:text>
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
    </CommandText>
    <xsl:text>
    </xsl:text>
  </xsl:template>

  <xsl:template name="createOrUpdate">
    <xsl:comment><xsl:text> 添加或者更新</xsl:text><xsl:value-of select="./table/@description"/><xsl:text>信息。 </xsl:text></xsl:comment>
    <xsl:text>
    </xsl:text>
    <CommandText name="CreateOrUpdate" commandType="Text">
      INSERT INTO `<xsl:value-of select="./table/@name" />`
      (
        <xsl:for-each select="./table/column[@isIdentity='false']"><xsl:text></xsl:text>`<xsl:value-of select="@name"/>`<xsl:if test="position()!=last()"><xsl:text>,
        </xsl:text>
        </xsl:if>
        </xsl:for-each>
      )
      VALUES
      (
        <xsl:for-each select="./table/column[@isIdentity='false']"><xsl:text></xsl:text>@<xsl:value-of select="@propertyName" /><xsl:if test="position()!=last()"><xsl:text>,
        </xsl:text>
        </xsl:if>
        </xsl:for-each>
      )
      ON DUPLICATE KEY
      UPDATE
        <xsl:for-each select="./table/column[@isIdentity='false']"><xsl:text></xsl:text>`<xsl:value-of select="@name"/>`=@<xsl:value-of select="@propertyName" /><xsl:if test="position()!=last()"><xsl:text>,
        </xsl:text>
        </xsl:if>
        </xsl:for-each>
    </CommandText>
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
    <CommandText name="Remove" commandType="Text">
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
    </CommandText>
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
    <CommandText name="GetById" commandType="Text">
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
    </CommandText>
    <xsl:text>
    </xsl:text>
  </xsl:template>

  <xsl:template name="searchCount">
    <xsl:comment>
      <xsl:text> 返回满足查询条件的记录数。 </xsl:text>
    </xsl:comment>
    <xsl:text>
    </xsl:text>
    <CommandText>
      <xsl:attribute name="name">Search<xsl:value-of select="./table/@pluralClassName" />Count</xsl:attribute>
      <xsl:attribute name="commandType">Text</xsl:attribute>
      SELECT COUNT(*) FROM `<xsl:value-of select="./table/@name" />`
      <xsl:text></xsl:text>
    </CommandText>
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
    <CommandText>
      <xsl:attribute name="name">Search<xsl:value-of select="./table/@pluralClassName"/></xsl:attribute>
      <xsl:attribute name="commandType">Text</xsl:attribute>
      <xsl:text>
      SELECT
      </xsl:text>
      <xsl:for-each select="./table/column"><xsl:text>  </xsl:text>`<xsl:value-of select="@name"/>` AS `<xsl:value-of select="@propertyName"/>`<xsl:if test="position()!=last()"><xsl:text>,
      </xsl:text>
      </xsl:if>
      </xsl:for-each>
      FROM `<xsl:value-of select="./table/@name" />`<xsl:text>
      ORDER BY </xsl:text><xsl:choose>
        <xsl:when test="count(./table/column[@isPrimaryKey='true'])=1">
          <xsl:for-each select="./table/column[@isPrimaryKey='true']">`<xsl:value-of select="@name"/>` DESC</xsl:for-each>
        </xsl:when>
        <xsl:when test="count(./table/column[@isPrimaryKey='true'])>1">
          <xsl:for-each select="./table/column[@isPrimaryKey='true']">
            `<xsl:value-of select="@name"/>` DESC<xsl:if test="position()!=last()">,</xsl:if>
          </xsl:for-each>
        </xsl:when>
      </xsl:choose>
      LIMIT @OffsetRows, @PageSize
      <xsl:text>
      </xsl:text>
    </CommandText>
  </xsl:template>
</xsl:stylesheet>
