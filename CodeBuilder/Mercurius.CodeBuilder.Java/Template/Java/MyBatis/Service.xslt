<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="text" indent="yes"/>
    <xsl:include href="../Common.xslt"/>
  <xsl:template match="root">
<xsl:call-template name="package" />
<xsl:text>
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.csbr.common.annotation.Pageable;
import com.csbr.common.service.Response;
import com.csbr.common.service.ResponseBean;
import com.csbr.common.service.ResponseList;

</xsl:text>
<xsl:call-template name="dependencys" />
<xsl:call-template name="classDescription" />@Service
public class <xsl:value-of select="./table/@className"/>Service {

    /** <xsl:value-of select="./table/@description" />数据访问接口 */
    @Autowired
    private <xsl:value-of select="./table/@className" />Mapper <xsl:value-of select="./table/@camelClassName" />Mapper;
<xsl:if test="count(./table[@hasCreate='true'])=1">
    /** 
     * 添加<xsl:value-of select="./table/@description" />信息.
     *
     * @param <xsl:value-of select="./table/@camelClassName" /><xsl:text> </xsl:text><xsl:value-of select="./table/@description"/>
     */
    public Response create(<xsl:value-of select="./table/@className" /><xsl:text> </xsl:text><xsl:value-of select="./table/@camelClassName"/>) {
        Response rs = new Response();

        this.<xsl:value-of select="./table/@camelClassName" />Mapper.create(<xsl:value-of select="./table/@camelClassName"/>);

        return rs;
    }
</xsl:if>
<xsl:if test="count(./table[@hasUpdate='true'])=1">
    /**
     * 编辑<xsl:value-of select="./table/@description" />信息.
     *
     * @param <xsl:value-of select="./table/@camelClassName"/><xsl:text> </xsl:text><xsl:value-of select="./table/@description"/>
     */
    public Response update(<xsl:value-of select="./table/@className"/><xsl:text> </xsl:text><xsl:value-of select="./table/@camelClassName"/>) {
        Response rs = new Response();

        this.<xsl:value-of select="./table/@camelClassName" />Mapper.update(<xsl:value-of select="./table/@camelClassName"/>);

        return rs;
    }
</xsl:if>
<xsl:if test="count(./table[@hasCreateOrUpdate='true'])=1">
    /**
     * 添加或者编辑<xsl:value-of select="./table/@description" />信息.
     *
     * @param <xsl:value-of select="./table/@camelClassName"/><xsl:text> </xsl:text><xsl:value-of select="./table/@description"/>
     */
    public Response createOrUpdate(<xsl:value-of select="./table/@className"/><xsl:text> </xsl:text><xsl:value-of select="./table/@camelClassName"/>) {
        Response rs = new Response();

        this.<xsl:value-of select="./table/@camelClassName" />Mapper.createOrUpdate(<xsl:value-of select="./table/@camelClassName"/>);

        return rs;
    }
</xsl:if>
<xsl:if test="count(./table[@hasRemove='true'])=1">
    <xsl:choose>
    <xsl:when test="count(./table/column[@isPrimaryKey='true'])=1">
    /**
     * 根据主键删除<xsl:value-of select="./table/@description" />信息.
     *
     * @param id <xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@description"/>
     */
    public Response remove(<xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@basicType"/> id) {
        Response rs = new Response();

        this.<xsl:value-of select="./table/@camelClassName" />Mapper.remove(id);

        return rs;
    }
</xsl:when>
<xsl:otherwise>
    /**
     * 根据主键删除<xsl:value-of select="./table/@description" />信息.
     *<xsl:for-each select="./table/column[@isPrimaryKey='true']">
     * @param <xsl:value-of select="@fieldName" /><xsl:text> </xsl:text><xsl:value-of select="@description"/>
</xsl:for-each>
     */
    public Response remove(<xsl:for-each select="./table/column[@isPrimaryKey='true']">
        <xsl:value-of select="@basicType"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="@fieldName"/>
        <xsl:if test="position()!=last()">
          <xsl:text>, </xsl:text>
        </xsl:if>
      </xsl:for-each><xsl:text>) {</xsl:text>
    <xsl:call-template name="GetByIdParams" />
        Response rs = new Response();

        this.<xsl:value-of select="./table/@camelClassName" />Mapper.remove(map);

        return rs;
    }
</xsl:otherwise>
</xsl:choose></xsl:if>
<xsl:if test="count(./table[@hasSingleData='true'])=1">
    <xsl:choose>
      <xsl:when test="count(./table/column[@isPrimaryKey='true'])=1">
    /**
     * 根据主键获取<xsl:value-of select="./table/@description" />信息.
     *
     * @param id <xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@description"/>
     * @return <xsl:value-of select="./table/@description"/>查询结果
     */
    public ResponseBean&lt;<xsl:value-of select="./table/@className"/>&gt; get<xsl:value-of select="./table/@className"/>ById(<xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@basicType"/> id) {
        ResponseBean&lt;<xsl:value-of select="./table/@className"/>&gt; rs = new ResponseBean&lt;<xsl:value-of select="./table/@className"/>&gt;();

        rs.setData(this.<xsl:value-of select="./table/@camelClassName" />Mapper.get<xsl:value-of select="./table/@className"/>ById(id));

        return rs;
    }
</xsl:when>
<xsl:otherwise>
    /**
     * 根据主键获取数据。
     *<xsl:for-each select="./table/column[@isPrimaryKey='true']">
     * @param <xsl:value-of select="@fieldName" /><xsl:text> </xsl:text><xsl:value-of select="@description"/></xsl:for-each>
     */
    public ResponseBean&lt;<xsl:value-of select="./table/@className"/>&gt; get<xsl:value-of select="./table/@className"/><xsl:text>ById(</xsl:text>
        <xsl:for-each select="./table/column[@isPrimaryKey='true']">
          <xsl:value-of select="@basicType"/><xsl:text> </xsl:text>
          <xsl:value-of select="@fieldName"/>
          <xsl:if test="position()!=last()">
            <xsl:text>, </xsl:text>
          </xsl:if>
        </xsl:for-each><xsl:text>) {</xsl:text>
       <xsl:call-template name="GetByIdParams" />
        ResponseBean&lt;<xsl:value-of select="./table/@className"/>&gt; rs = new ResponseBean&lt;<xsl:value-of select="./table/@className"/>&gt;();

        rs.setData(this.<xsl:value-of select="./table/@camelClassName" />Mapper.get<xsl:value-of select="./table/@className"/>ById(map));

        return rs;
    }
</xsl:otherwise>
  </xsl:choose>
</xsl:if>

  <xsl:if test="count(./table[@hasGetAll='true'])=1">
    /**
     * 获取所有<xsl:value-of select="./table/@description" />信息.
     *
     * @param so 查询条件
     *
     * @return 返回符合条件的<xsl:value-of select="./table/@description"/>查询结果
     */
    public ResponseList&lt;<xsl:value-of select="./table/@className"/>> getAll<xsl:value-of select="./table/@pluralClassName"/>(<xsl:value-of select="./table/@className"/><xsl:text>SO </xsl:text>so) {
        ResponseList&lt;<xsl:value-of select="./table/@className"/>&gt; rs = new ResponseList&lt;&gt;();

        rs.setDatas(this.<xsl:value-of select="./table/@camelClassName" />Mapper.search<xsl:value-of select="./table/@pluralClassName"/>(so));

        return rs;
    }
</xsl:if>

    <xsl:if test="count(./table[@hasSearchData='true'])=1">
    /**
     * 查询并分页获取<xsl:value-of select="./table/@description" />信息.
     *
     * @param so 查询条件
     *
     * @return 返回符合条件的<xsl:value-of select="./table/@description" />分页查询结果
     */
    @Pageable
    public ResponseList&lt;<xsl:value-of select="./table/@className"/>> search<xsl:value-of select="./table/@pluralClassName"/>(<xsl:value-of select="./table/@className"/><xsl:text>SO </xsl:text>so) {
        ResponseList&lt;<xsl:value-of select="./table/@className"/>&gt; rs = new ResponseList&lt;&gt;();

        rs.setDatas(this.<xsl:value-of select="./table/@camelClassName" />Mapper.search<xsl:value-of select="./table/@pluralClassName"/>(so));

        return rs;
    }
</xsl:if>
}</xsl:template>

<xsl:template name="GetByIdParams">
        java.util.HashMap map = new java.util.HashMap();

        <xsl:for-each select="./table/column[@isPrimaryKey='true']">map.put("<xsl:value-of select="@fieldName"/>", <xsl:value-of select="@fieldName"/>);
        </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
