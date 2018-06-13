<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:template name="package">package <xsl:value-of select="./table/@namespace"/>;
</xsl:template>
<xsl:template name="dependencys"><xsl:for-each select="./dependencys/dependency">import <xsl:value-of select="."/>;
</xsl:for-each>
</xsl:template>

  <xsl:template name="classDescription">
/**
 * <xsl:value-of select="./table/@description" />.
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
