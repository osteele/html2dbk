<?xml version="1.0" encoding="utf-8"?>
<!-- Copyright 2004 by Laszlo Systems, Inc.
     Released under the Artistic License.
     Written by Oliver Steele.
     http://osteele.com/sources/xslt/htm2db/
     
     This is an minimal embedding stylesheet.  Make a copy of
     this file and customize it with parameter definitions and
     template overrides to customize the transformation.
     See example.xsl for an example.
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:h="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="h"
                version="1.0">
  
  <xsl:import href="html2db.xsl"/>
  
  <xsl:template match="h:div[@class='abstract']">
    <abstract>
      <xsl:apply-templates/>
    </abstract>
  </xsl:template>
  
  <xsl:template match="h:p[@class='note']">
    <note>
      <para>
        <xsl:apply-templates/>
      </para>
    </note>
  </xsl:template>
  
  <xsl:template match="h:pre[@class='example']">
    <informalexample>
      <xsl:apply-imports/>
    </informalexample>
  </xsl:template>

</xsl:stylesheet>
