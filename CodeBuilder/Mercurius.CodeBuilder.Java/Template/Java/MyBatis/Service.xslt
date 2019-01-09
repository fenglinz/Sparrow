<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="text" indent="yes"/>
    <xsl:include href="../Common.xslt"/>
  <xsl:template match="root">
<xsl:call-template name="package" />
<xsl:text>
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.csbr.common.annotation.Pageable;
import com.csbr.common.service.Response;
import com.csbr.common.service.ResponseBean;
import com.csbr.common.service.ResponseList;
import com.csbr.common.service.ServiceSupport;

</xsl:text>
<xsl:call-template name="dependencys" />
<xsl:call-template name="serviceDescription" />@Service
public class <xsl:value-of select="./table/@realClassName"/> extends ServiceSupport {

    /** <xsl:value-of select="./table/@description" />数据持久化对象 */
    @Autowired
    private <xsl:value-of select="./table/@className" />Mapper <xsl:value-of select="./table/@camelClassName" />Mapper;
<xsl:if test="count(./table[@hasCreate='true'])=1">
    /**
     * 添加<xsl:value-of select="./table/@description" />信息.
     *
     * @param request<xsl:text> </xsl:text><xsl:value-of select="./table/@description"/>业务逻辑请求数据
     *
     * @return 添加结果
     */
    public Response create(<xsl:value-of select="./table/@className" />Request<xsl:text> </xsl:text>request) {
        Response rs = new Response();
        <xsl:value-of select="./table/@className" /> entity = this.convert(request, <xsl:value-of select="./table/@className" />.class);

        this.<xsl:value-of select="./table/@camelClassName" />Mapper.create(entity);

        return rs;
    }
</xsl:if>
<xsl:if test="count(./table[@hasUpdate='true'])=1">
    /**
     * 更新<xsl:value-of select="./table/@description" />信息.
     *
     * @param request<xsl:text> </xsl:text><xsl:value-of select="./table/@description"/>业务逻辑请求数据
     *
     * @return 更新结果
     */
    public Response update(<xsl:value-of select="./table/@className"/>Request<xsl:text> </xsl:text>request) {
        Response rs = new Response();
        <xsl:value-of select="./table/@className" /> entity = this.convert(request, <xsl:value-of select="./table/@className" />.class);

        this.<xsl:value-of select="./table/@camelClassName" />Mapper.update(entity);

        return rs;
    }
</xsl:if>
<xsl:if test="count(./table[@hasCreateOrUpdate='true'])=1">
    /**
     * 添加或者更新<xsl:value-of select="./table/@description" />信息.
     *
     * @param request<xsl:text> </xsl:text><xsl:value-of select="./table/@description"/>业务逻辑请求数据
     *
     * @return 添加或更新结果
     */
    public Response createOrUpdate(<xsl:value-of select="./table/@className"/>Request<xsl:text> </xsl:text><xsl:value-of select="./table/@camelClassName"/>) {
        Response rs = new Response();
        <xsl:value-of select="./table/@className" /> entity = this.convert(request, <xsl:value-of select="./table/@className" />.class);

        this.<xsl:value-of select="./table/@camelClassName" />Mapper.createOrUpdate(entity);

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
     *
     * @return <xsl:value-of select="./table/@description"/>查询结果
     */
    public ResponseBean&lt;<xsl:value-of select="./table/@className"/>Response&gt; get<xsl:value-of select="./table/@className"/>ById(<xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@basicType"/> id) {
        ResponseBean&lt;<xsl:value-of select="./table/@className"/>Response&gt; rs = new ResponseBean&lt;&gt;();
        <xsl:value-of select="./table/@className" /> entity = this.<xsl:value-of select="./table/@camelClassName" />Mapper.get<xsl:value-of select="./table/@className"/>ById(id);

        rs.setData(this.convert(entity, <xsl:value-of select="./table/@className" />Response.class));

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
        ResponseBean&lt;<xsl:value-of select="./table/@className"/>&gt; rs = new ResponseBean&lt;&gt;();
        <xsl:value-of select="./table/@className" /> entity = this.<xsl:value-of select="./table/@camelClassName" />Mapper.get<xsl:value-of select="./table/@className"/>ById(map);

        rs.setData(this.convert(entity, <xsl:value-of select="./table/@className" />Response.class));

        return rs;
    }
</xsl:otherwise>
  </xsl:choose>
</xsl:if>

  <xsl:if test="count(./table[@hasGetAll='true'])=1">
    /**
     * 获取所有<xsl:value-of select="./table/@description" />信息.
     *
     * @param so 查询对象
     *
     * @return 返回符合条件的<xsl:value-of select="./table/@description"/>查询结果
     */
    public ResponseList&lt;<xsl:value-of select="./table/@className"/>Response&gt; getAll<xsl:value-of select="./table/@pluralClassName"/>(<xsl:value-of select="./table/@className"/><xsl:text>SO </xsl:text>so) {
        ResponseList&lt;<xsl:value-of select="./table/@className"/>Response&gt; rs = new ResponseList&lt;&gt;();
        List&lt;<xsl:value-of select="./table/@className" />&gt; entities = this.<xsl:value-of select="./table/@camelClassName" />Mapper.search<xsl:value-of select="./table/@pluralClassName"/>(so);

        rs.setDatas(this.convert(entities, <xsl:value-of select="./table/@className" />Response.class));

        return rs;
    }
</xsl:if>

    <xsl:if test="count(./table[@hasSearchData='true'])=1">
    /**
     * 查询并分页获取<xsl:value-of select="./table/@description" />信息.
     *
     * @param so 查询对象
     *
     * @return 返回符合条件的<xsl:value-of select="./table/@description" />分页查询结果
     */
    @Pageable
    public ResponseList&lt;<xsl:value-of select="./table/@className"/>Response> search<xsl:value-of select="./table/@pluralClassName"/>(<xsl:value-of select="./table/@className"/><xsl:text>SO </xsl:text>so) {
        ResponseList&lt;<xsl:value-of select="./table/@className"/>Response&gt; rs = new ResponseList&lt;&gt;();
        List&lt;<xsl:value-of select="./table/@className" />&gt; entities = this.<xsl:value-of select="./table/@camelClassName" />Mapper.search<xsl:value-of select="./table/@pluralClassName"/>(so);

        rs.setDatas(this.convert(entities, <xsl:value-of select="./table/@className" />Response.class));

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
