<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns="http://ibatis.apache.org/mapping" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="xml" indent="yes" standalone="yes" encoding="utf-8" cdata-section-elements="insert select delete update sql" />
  <xsl:preserve-space elements="alias statements insert select delete update sql isNotNull"/>
  <xsl:strip-space elements="alias statements insert select delete update sql isNotNull"/>
  
  <xsl:template match="root">
    <sqlMap xmlns="http://ibatis.apache.org/mapping">
      <xsl:attribute name="namespace">
        <xsl:value-of select="./table/@namespace"/>
        <xsl:text>.</xsl:text>
        <xsl:value-of select="./table/@className"/>
      </xsl:attribute>
      <alias>
        <xsl:call-template name="typeAlias" />
      </alias>
      <xsl:text>
      </xsl:text>
      <statements>
        <xsl:text>
        </xsl:text>
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
        <xsl:call-template name="searchConditions" />
        </xsl:if>
      </statements>
    </sqlMap>
  </xsl:template>

  <xsl:template name="typeAlias">
    <xsl:for-each select="./dependencys/dependency">
      <typeAlias>
        <xsl:attribute name="alias">
          <xsl:value-of select="@className"/>
        </xsl:attribute>
        <xsl:attribute name="type">
          <xsl:value-of select="."/>
          <xsl:text>.</xsl:text>
          <xsl:value-of select="@className"/>
          <xsl:text>,</xsl:text>
          <xsl:value-of select="@assembly"/>
        </xsl:attribute>
      </typeAlias>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="create">
    <xsl:comment>
      <xsl:text> 添加</xsl:text>
      <xsl:value-of select="./table/@description"/>
      <xsl:text>信息。 </xsl:text>
    </xsl:comment>
    <xsl:text>
    </xsl:text>
    <insert id="Create">
      <xsl:attribute name="parameterClass">
        <xsl:value-of select="./table/@className"/>
      </xsl:attribute>
        INSERT INTO <xsl:value-of select="./table/@name" />
        (
      <xsl:for-each select="./table/column[@isIdentity='false']">
        <xsl:if test="position()=1">
          <xsl:text>    </xsl:text>
        </xsl:if>
        <xsl:text>[</xsl:text>
        <xsl:value-of select="@name" />
        <xsl:text>]</xsl:text>
        <xsl:if test="position()!=last()">
          <xsl:text>,
          </xsl:text>
        </xsl:if>
      </xsl:for-each>
        )
        VALUES
        (
      <xsl:for-each select="./table/column[@isIdentity='false']">
        <xsl:if test="position()=1">
          <xsl:text>    </xsl:text>
        </xsl:if>
        <xsl:text>#</xsl:text>
        <xsl:value-of select="@propertyName" />
        <xsl:text>#</xsl:text>
        <xsl:if test="position()!=last()">
          <xsl:text>,
          </xsl:text>
        </xsl:if>
      </xsl:for-each>
        )
    </insert>
    
  </xsl:template>

  <xsl:template name="update">
    <xsl:comment>
      <xsl:text> 更新</xsl:text>
      <xsl:value-of select="./table/@description"/>
      <xsl:text>信息。 </xsl:text>
    </xsl:comment>
    <xsl:text>
    </xsl:text>
    <update id="Update">
      <xsl:attribute name="parameterClass">
        <xsl:value-of select="./table/@className"/>
      </xsl:attribute>
        UPDATE <xsl:value-of select="./table/@name" />
        SET
      <xsl:for-each select="./table/column[@isPrimaryKey='false']">
        <xsl:if test="position()=1">
          <xsl:text>    </xsl:text>
        </xsl:if>
        <xsl:text>[</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>]=#</xsl:text>
        <xsl:value-of select="@propertyName"/>
        <xsl:text>#</xsl:text>
        <xsl:if test="position()!=last()">
          <xsl:text>,
          </xsl:text>
        </xsl:if>
      </xsl:for-each>
        WHERE <xsl:for-each select="./table/column[@isPrimaryKey='true']">
        <xsl:text>[</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>]=#</xsl:text>
        <xsl:value-of select="@propertyName"/>
        <xsl:text>#</xsl:text>
        <xsl:if test="position()!=last()">
          <xsl:text> AND </xsl:text>
        </xsl:if>
      </xsl:for-each>
      <xsl:text>
      </xsl:text>
    </update>
    <xsl:text>
    </xsl:text>
  </xsl:template>

  <xsl:template name="createOrUpdate">
    <xsl:comment>
      <xsl:text> 添加或者更新</xsl:text>
      <xsl:value-of select="./table/@description"/>
      <xsl:text>信息。 </xsl:text>
    </xsl:comment>
    <update id="CreateOrUpdate">
      <xsl:attribute name="parameterClass">
        <xsl:value-of select="./table/@className"/>
      </xsl:attribute>
        IF EXISTS(SELECT * FROM <xsl:value-of select="./table/@name" /> WHERE <xsl:choose><xsl:when test="count(./table/column[@isPrimaryKey='true'])=1"><xsl:text>[</xsl:text><xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@name"/>]=#<xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@propertyName" />#</xsl:when><xsl:otherwise><xsl:for-each select="./table/column[@isPrimaryKey='true']">
          <xsl:text>[</xsl:text>
          <xsl:value-of select="@name"/>
          <xsl:text>]=#</xsl:text>
          <xsl:value-of select="@propertyName"/>
          <xsl:text>#</xsl:text>
          <xsl:if test="position()!=last()">
            <xsl:text> AND </xsl:text>
          </xsl:if>
        </xsl:for-each></xsl:otherwise></xsl:choose>)
          UPDATE <xsl:value-of select="./table/@name" />
          SET
          <xsl:for-each select="./table/column[@isPrimaryKey='false']">
          <xsl:if test="position()=1">
            <xsl:text>  </xsl:text>
          </xsl:if>
          <xsl:text>[</xsl:text>
          <xsl:value-of select="@name"/>
          <xsl:text>]=#</xsl:text>
          <xsl:value-of select="@propertyName"/>
          <xsl:text>#</xsl:text>
          <xsl:if test="position()!=last()">
            <xsl:text>,
            </xsl:text>
          </xsl:if>
          </xsl:for-each>
          WHERE <xsl:for-each select="./table/column[@isPrimaryKey='true']">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="@name"/>
            <xsl:text>]=#</xsl:text>
            <xsl:value-of select="@propertyName"/>
            <xsl:text>#</xsl:text>
            <xsl:if test="position()!=last()">
              <xsl:text> AND </xsl:text>
            </xsl:if>
          </xsl:for-each>
        ELSE
          INSERT INTO <xsl:value-of select="./table/@name" />
          (
          <xsl:for-each select="./table/column[@isIdentity='false']">
          <xsl:if test="position()=1">
            <xsl:text>  </xsl:text>
          </xsl:if>
          <xsl:text>[</xsl:text>
          <xsl:value-of select="@name" />
          <xsl:text>]</xsl:text>
          <xsl:if test="position()!=last()">
            <xsl:text>,
            </xsl:text>
          </xsl:if>
          </xsl:for-each>
          )
          VALUES
          (
          <xsl:for-each select="./table/column[@isIdentity='false']">
          <xsl:if test="position()=1">
            <xsl:text>  </xsl:text>
          </xsl:if>
          <xsl:text>#</xsl:text>
          <xsl:value-of select="@propertyName" />
          <xsl:text>#</xsl:text>
          <xsl:if test="position()!=last()">
            <xsl:text>,
            </xsl:text>
          </xsl:if>
          </xsl:for-each>
          )
    </update>
  </xsl:template>
  
  <xsl:template name="delete">
    <xsl:comment>
      <xsl:text> 删除</xsl:text>
      <xsl:value-of select="./table/@description"/>
      <xsl:text>信息。 </xsl:text>
    </xsl:comment>
    <xsl:text>
    </xsl:text>
    <delete id="Remove">
      <xsl:attribute name="parameterClass">
        <xsl:choose>
          <xsl:when test="count(./table/column[@isPrimaryKey='true'])=1">
            <xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@basicType"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>Params</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
        DELETE FROM <xsl:value-of select="./table/@name" /> WHERE <xsl:choose>
        <xsl:when test="count(./table/column[@isPrimaryKey='true'])=1">
          <xsl:text>[</xsl:text>
          <xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@name"/>
          <xsl:text>]=#value#</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:for-each select="./table/column[@isPrimaryKey='true']">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="@name"/>
            <xsl:text>]=#</xsl:text>
            <xsl:value-of select="@propertyName"/>
            <xsl:text>#</xsl:text>
            <xsl:if test="position()!=last()">
              <xsl:text> AND </xsl:text>
            </xsl:if>
          </xsl:for-each>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text>
      </xsl:text>
    </delete>
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
    <select id="GetById">
      <xsl:attribute name="parameterClass">
        <xsl:choose>
          <xsl:when test="count(./table/column[@isPrimaryKey='true'])=1">
            <xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@basicType"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>Params</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:attribute name="resultClass">
        <xsl:value-of select="./table/@className"/>
      </xsl:attribute>
      <xsl:text>
        SELECT TOP 1 
      </xsl:text>
      <xsl:for-each select="./table/column">
        <xsl:if test="position()=1">
          <xsl:text>    </xsl:text>
        </xsl:if>
        <xsl:text>[</xsl:text>
        <xsl:value-of select="@name"/>
        <xsl:text>] AS </xsl:text>
        <xsl:value-of select="@propertyName"/>
        <xsl:if test="position()!=last()">
          <xsl:text>,
          </xsl:text>
        </xsl:if>
      </xsl:for-each>
        FROM <xsl:value-of select="./table/@name" />
      <xsl:text>
        WHERE </xsl:text>
      <xsl:choose>
        <xsl:when test="count(./table/column[@isPrimaryKey='true'])=1">
          <xsl:for-each select="./table/column[@isPrimaryKey='true']">
            <xsl:text>[</xsl:text><xsl:value-of select="@name"/>
            <xsl:text>]=#value#</xsl:text>
          </xsl:for-each>
        </xsl:when>
        <xsl:when test="count(./table/column[@isPrimaryKey='true'])>1">
          <xsl:for-each select="./table/column[@isPrimaryKey='true']">
            <xsl:text>[</xsl:text><xsl:value-of select="@name"/>
            <xsl:text>]=#</xsl:text><xsl:value-of select="@fieldName"/><xsl:text>#</xsl:text>
            <xsl:if test="position()!=last()">
              <xsl:text> AND </xsl:text>
            </xsl:if>
          </xsl:for-each>
        </xsl:when>
      </xsl:choose>
      <xsl:text>
      </xsl:text>
    </select>
    <xsl:text>
    </xsl:text>
  </xsl:template>

  <xsl:template name="searchCount">
    <xsl:comment>
      <xsl:text> 返回满足查询条件的记录数。 </xsl:text>
    </xsl:comment>
    <xsl:text>
    </xsl:text>
    <select>
      <xsl:attribute name="id">Search<xsl:value-of select="./table/@pluralClassName" />Count</xsl:attribute>
      <xsl:attribute name="parameterClass"><xsl:value-of select="./table/@className"/>SO</xsl:attribute>
      <xsl:attribute name="resultClass">int</xsl:attribute>
        SELECT COUNT(*) FROM <xsl:value-of select="./table/@name" />
      <xsl:text>
      </xsl:text>
      <include refid="searchConditions" />
    </select>
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
    <select>
      <xsl:attribute name="id">Search<xsl:value-of select="./table/@pluralClassName"/></xsl:attribute>
      <xsl:attribute name="parameterClass"><xsl:value-of select="./table/@className"/>SO</xsl:attribute>
      <xsl:attribute name="resultClass"><xsl:value-of select="./table/@className"/></xsl:attribute>
      <xsl:text>
        WITH CTE AS(
          SELECT
      </xsl:text>
          <xsl:text>    </xsl:text><xsl:for-each select="./table/column"><xsl:text>  </xsl:text>[<xsl:value-of select="@name"/>] AS <xsl:value-of select="@propertyName"/>,
          </xsl:for-each>
                <xsl:text>  ROW_NUMBER() OVER(ORDER BY </xsl:text><xsl:choose><xsl:when test="count(./table/column[@isPrimaryKey='true'])=1"><xsl:for-each select="./table/column[@isPrimaryKey='true']">[<xsl:value-of select="@name"/>] DESC</xsl:for-each></xsl:when><xsl:when test="count(./table/column[@isPrimaryKey='true'])>1"><xsl:for-each select="./table/column[@isPrimaryKey='true']">[<xsl:value-of select="@name"/>] DESC<xsl:if test="position()!=last()">,</xsl:if></xsl:for-each></xsl:when></xsl:choose>) AS RowIndex
          FROM <xsl:value-of select="./table/@name" />
      <xsl:text>
      </xsl:text>
      <include refid="searchConditions" />
        )
        SELECT * FROM CTE
        WHERE RowIndex BETWEEN (#PageIndex#-1)*#PageSize#+1 AND #PageIndex#*#PageSize#
        ORDER BY RowIndex ASC
    </select>
  </xsl:template>

  <xsl:template name="searchConditions">
    <xsl:comment>
      <xsl:text> 查询条件。 </xsl:text>
    </xsl:comment>
    <xsl:text>
    </xsl:text>
    <sql id="searchConditions">
      <dynamic prepend="WHERE">
        <isNotNull property=".">
          <xsl:for-each select="./table/column[@isSearchCriteria='true']">
            <isNotNull>
              <xsl:attribute name="property">
                <xsl:value-of select="@propertyName"/>
              </xsl:attribute>
              <xsl:if test="position()!=1">
                <xsl:attribute name="prepend">
                  <xsl:text>AND</xsl:text>
                </xsl:attribute>
              </xsl:if>
              [<xsl:value-of select="@name"/>]=#<xsl:value-of select="@propertyName"/>#
            </isNotNull>
          </xsl:for-each>
        </isNotNull>
      </dynamic>
    </sql>
  </xsl:template>
</xsl:stylesheet>
