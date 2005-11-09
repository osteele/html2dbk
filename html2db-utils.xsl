<?xml version="1.0" encoding="utf-8"?>
<!-- Copyright 2004 by Laszlo Systems, Inc.
     Released under the Artistic License.
     Written by Oliver Steele.
     http://osteele.com/sources/xslt/htm2db/
     
    Utility functions
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exslt="http://exslt.org/common"
                xmlns:math="http://exslt.org/math"
                xmlns:xalan="http://xml.apache.org/xalan"
                xmlns:html2db="urn:html2db"
                xmlns:db="urn:docbook"
                xmlns:h="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="db exslt h html2db math xalan"
                extension-element-prefixes="html2db"
                version="1.0">
  
  <!-- Wrap with ", and backslash " and \ -->
  <xsl:template name="quote">
    <xsl:param name="str" select="string(.)"/>
    <xsl:param name="lquo" select="'&quot;'"/>
    <xsl:param name="rquo" select="'&quot;'"/>
    <!-- first " -->
    <xsl:variable name="qpos" select="string-length(substring-before($str, '&quot;'))"/>
    <!-- first \ -->
    <xsl:variable name="bspos" select="string-length(substring-before($str, '\\'))"/>
    <!-- first " or \ -->
    <xsl:variable name="pos">
      <xsl:choose>
        <xsl:when test="$qpos=0"><xsl:value-of select="$bspos"/></xsl:when>
        <xsl:when test="$bspos=0"><xsl:value-of select="$qpos"/></xsl:when>
        <xsl:when test="$qpos&lt;$bspos">
          <xsl:value-of select="$qpos"/>
        </xsl:when>
        <xsl:when test="$bspos">
          <xsl:value-of select="$bspos"/>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    <xsl:value-of select="$lquo"/>
    <xsl:choose>
      <xsl:when test="$pos!=0">
        <xsl:value-of select="substring($str, 1, $pos)"/>
        <xsl:text>\</xsl:text>
        <xsl:value-of select="substring($str, $pos + 1, 1)"/>
        <xsl:call-template name="quote">
          <xsl:with-param name="str" select="substring($str, $pos + 2)"/>
          <xsl:with-param name="lquo" select="''"/>
          <xsl:with-param name="rquo" select="''"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$str"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:value-of select="$rquo"/>
  </xsl:template>
  
</xsl:stylesheet>
