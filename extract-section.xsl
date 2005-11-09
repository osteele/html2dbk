<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:h="http://www.w3.org/1999/xhtml"
                version="1.0">
  
  <xsl:output method="html"/>
  
  <xsl:template match="/">
    <xsl:apply-templates select="h:html/h:body//h:div[@class='section']"/>
  </xsl:template>
  
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
