<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="text" indent="yes"/>
  <xsl:include href="./Common.xslt"/>
  <xsl:template match="root">
    <xsl:call-template name="package" />
    <xsl:text>
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

import com.csbr.common.service.Response;
import com.csbr.common.service.ResponseBean;
import com.csbr.common.service.ResponseList;

</xsl:text>
<xsl:call-template name="dependencys" />
<xsl:call-template name="apiDescription" />@RestController
@RequestMapping("<xsl:value-of select="./webApiPrefix"/>/<xsl:value-of select="./table/@className"/>")
@Api(description = "<xsl:value-of select="./table/@description"/>Web Api服务", tags = "<xsl:value-of select="./table/@description"/>")
public class <xsl:value-of select="./table/@realClassName"/> {

    /** <xsl:value-of select="./table/@description" />服务对象 */
    @Autowired
    private <xsl:value-of select="./table/@className"/>Service <xsl:value-of select="./table/@camelClassName"/>Service;
<xsl:if test="count(./table[@hasCreate='true'])=1"><xsl:call-template name="create" /></xsl:if>
<xsl:if test="count(./table[@hasUpdate='true'])=1"><xsl:call-template name="update" /></xsl:if>
<xsl:if test="count(./table[@hasRemove='true'])=1"><xsl:call-template name="remove" /></xsl:if>
<xsl:if test="count(./table[@hasSingleData='true'])=1"><xsl:call-template name="getById" /></xsl:if>
<xsl:if test="count(./table[@hasGetAll='true'])=1"><xsl:call-template name="getAll" /></xsl:if>
<xsl:if test="count(./table[@hasSearchData='true'])=1"><xsl:call-template name="search" /></xsl:if>
}
</xsl:template>

  <xsl:template name="create">
    /**
     * 添加<xsl:value-of select="./table/@description"/>信息.
     *
     * @param request<xsl:text xml:space="preserve"> </xsl:text><xsl:value-of select="./table/@description"/>请求数据模型
     *
     * @return 添加结果
     */
    @PostMapping("/add")
    @ApiOperation("添加<xsl:value-of select="./table/@description"/>信息")
    public Response add(@ApiParam(value = "<xsl:value-of select="./table/@description"/>请求数据模型", required = true) @Valid @RequestBody <xsl:value-of select="./table/@className"/>Request<xsl:text xml:space="preserve"> </xsl:text>request) {
        return this.<xsl:value-of select="./table/@camelClassName"/>Service.create(request);
    }
  </xsl:template>

  <xsl:template name="update">
    /**
    * 更新<xsl:value-of select="./table/@description"/>信息.
    *
    * @param id <xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@description"/>
    * @param request<xsl:text xml:space="preserve"> </xsl:text><xsl:value-of select="./table/@description"/>请求数据模型
    *
    * @return 更新结果
    */
    @PutMapping("/{id}")
    @ApiOperation("更新<xsl:value-of select="./table/@description"/>信息")
    public Response put(
        @ApiParam(value = "<xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@description"/>", required = true) @PathVariable("id") <xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@basicType"/> id,
        @ApiParam(value = "<xsl:value-of select="./table/@description"/>请求数据模型", required = true) @Valid @RequestBody <xsl:value-of select="./table/@className"/>Request<xsl:text xml:space="preserve"> </xsl:text>request
    ) {
        request.set<xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@propertyName" />(id);

        return this.<xsl:value-of select="./table/@camelClassName"/>Service.update(request);
    }
  </xsl:template>

  <xsl:template name="remove">
    /**
    * 删除<xsl:value-of select="./table/@description"/>信息.
    *
    * @param id <xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@description"/>
    *
    * @return 删除结果
    */
    @DeleteMapping("/{id}")
    @ApiOperation("删除<xsl:value-of select="./table/@description"/>信息")
    public Response remove(@ApiParam(value = "<xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@description"/>", required = true) @PathVariable("id") <xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@basicType"/> id) {
        return this.<xsl:value-of select="./table/@camelClassName"/>Service.remove(id);
    }
  </xsl:template>

  <xsl:template name="getById">
    /**
    * 获取<xsl:value-of select="./table/@description"/>信息.
    *
    * @param id <xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@description"/>
    *
    * @return 获取结果
    */
    @GetMapping("/{id}")
    @ApiOperation("获取<xsl:value-of select="./table/@description"/>信息")
    public ResponseBean&lt;<xsl:value-of select="./table/@className"/>Response&gt; get(@ApiParam(value = "<xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@description"/>", required = true) @PathVariable("id") <xsl:value-of select="./table/column[@isPrimaryKey='true'][1]/@basicType"/> id) {
        return this.<xsl:value-of select="./table/@camelClassName"/>Service.get<xsl:value-of select="./table/@className"/>ById(id);
    }
  </xsl:template>

  <xsl:template name="getAll">
    /**
    * 获取所有<xsl:value-of select="./table/@description"/>信息.
    *
    * @param so <xsl:value-of select="./table/@description"/>查询对象
    *
    * @return 获取结果
    */
    @PostMapping("/all")
    @ApiOperation("获取<xsl:value-of select="./table/@description"/>信息")
    public ResponseList&lt;<xsl:value-of select="./table/@className"/>Response&gt; all(@ApiParam(value = "<xsl:value-of select="./table/@description"/>查询对象", required = true) @RequestBody <xsl:value-of select="./table/@className" />SO<xsl:text> so</xsl:text>) {
        return this.<xsl:value-of select="./table/@camelClassName"/>Service.getAll<xsl:value-of select="./table/@pluralClassName"/>(so);
    }
  </xsl:template>

  <xsl:template name="search">
    /**
    * 分页查询<xsl:value-of select="./table/@description"/>信息.
    *
    * @param so <xsl:value-of select="./table/@description"/>查询对象
    *
    * @return 获取结果
    */
    @PostMapping("/search")
    @ApiOperation("获取<xsl:value-of select="./table/@description"/>信息")
    public ResponseList&lt;<xsl:value-of select="./table/@className"/>Response&gt; search(@ApiParam(value = "<xsl:value-of select="./table/@description"/>查询对象", required = true) @RequestBody <xsl:value-of select="./table/@className" />SO<xsl:text> so</xsl:text>) {
        return this.<xsl:value-of select="./table/@camelClassName"/>Service.search<xsl:value-of select="./table/@pluralClassName"/>(so);
    }
  </xsl:template>
</xsl:stylesheet>