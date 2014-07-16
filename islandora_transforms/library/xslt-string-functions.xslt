<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template name="toUpper">
    <xsl:param name="str" />
    <xsl:value-of select="translate($str,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
  </xsl:template>
  
  <xsl:template name="toLower">
    <xsl:param name="str" />
    <xsl:value-of select="translate($str,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
  </xsl:template>
  
  <xsl:template name="toProper">
    <xsl:param name="str" />
    <xsl:call-template name="toUpper">
      <xsl:with-param name="str" select="substring($str,1,1)"/>
    </xsl:call-template><xsl:call-template name="toLower">
      <xsl:with-param name="str" select="substring($str,2)"/>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
    