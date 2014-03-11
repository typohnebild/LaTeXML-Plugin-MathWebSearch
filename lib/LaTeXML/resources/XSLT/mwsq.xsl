<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:m="http://www.w3.org/1998/Math/MathML"
    xmlns:mws = "http://search.mathweb.org/ns"
    exclude-result-prefixes="mws"
                version="1.0">

<xsl:output method="xml" indent="yes" cdata-section-elements="data"/>
<xsl:strip-space elements="*"/>

<xsl:template match="m:csymbol[@cd='mws' and @name='qvar']">
  <mws:qvar>
    <xsl:copy-of select="@type"/>
    <xsl:value-of select="."/>
  </mws:qvar>
</xsl:template> 

<xsl:template match="m:annotation-xml[@encoding='MathML-Content']">
  <m:annotation-xml encoding="MWS-Query">
    <mws:expr>
      <xsl:apply-templates/>
    </mws:expr>
  </m:annotation-xml>
</xsl:template>
<!-- in the fallback case, just copy --> 
<xsl:template match="*">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>
