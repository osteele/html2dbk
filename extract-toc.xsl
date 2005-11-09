<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xalanredirect="org.apache.xalan.xslt.extensions.Redirect"
                exclude-result-prefixes=""
                extension-element-prefixes="xalanredirect"
                xmlns:h="http://www.w3.org/1999/xhtml"
                version="1.0">
  
  <xsl:output method="html"/>
  
  <xsl:template match="/">
    <xsl:apply-templates select="h:html/h:body/*"/>
  </xsl:template>
  
  <xsl:template match="h:div[@class='toc']">
    <xalanredirect:write file="categories.html">
      <xsl:apply-templates/>
    </xalanredirect:write>
  </xsl:template>
  
  <xsl:template match="h:div[@class='toc']//text()[string(.)='Table of Contents']">
    <xsl:value-of select="/h:html/h:head/h:title/text()"/>
  </xsl:template>
  
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="h:a[string()='']">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
      <xsl:text> </xsl:text>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
