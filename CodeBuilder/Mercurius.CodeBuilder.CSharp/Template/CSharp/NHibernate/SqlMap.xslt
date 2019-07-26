<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns="urn:nhibernate-mapping-2.2" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="xml" indent="yes" standalone="yes" encoding="utf-8" cdata-section-elements="commandText attach" />
  <xsl:preserve-space elements="id property"/>
  <xsl:strip-space elements="id property"/>
  
  <xsl:template match="root">
    <hibernate-mapping xmlns="urn:nhibernate-mapping-2.2">
    <xsl:attribute name="assembly"><xsl:value-of select="./rootNamespace"/></xsl:attribute>
    <xsl:attribute name="namespace"><xsl:value-of select="./table/@namespace" />.<xsl:value-of select="./table/@className" /></xsl:attribute>
      <class>
        <xsl:attribute name="name"><xsl:value-of select="./table/@className"/></xsl:attribute>
        <xsl:attribute name="table"><xsl:value-of select="./table/@table"/></xsl:attribute>
        <xsl:for-each select="./table/column[@isPrimaryKey='true']">
          <id>
            <xsl:attribute name="name">
              <xsl:value-of select="@name" />
            </xsl:attribute>
            <xsl:attribute name="column">
              <xsl:value-of select="@propertyName"/>
            </xsl:attribute>
          </id>
        </xsl:for-each>
        <xsl:for-each select="./table/column[@isPrimaryKey='false']">
          <property>
            <xsl:attribute name="name">
              <xsl:value-of select="@propertyName" />
            </xsl:attribute>
            <xsl:attribute name="column">
              <xsl:value-of select="@name"/>
            </xsl:attribute>
          </property>
        </xsl:for-each>
      </class>
</hibernate-mapping>
  </xsl:template>
</xsl:stylesheet>
