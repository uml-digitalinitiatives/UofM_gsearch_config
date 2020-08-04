<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template name="toUpper">
    <xsl:param name="str" />
    <xsl:variable name="tempStr">
      <xsl:call-template name="filterNonPrintable">
        <xsl:with-param name="str" select="$str"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:value-of select="translate($tempStr,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
  </xsl:template>
  
  <xsl:template name="toLower">
    <xsl:param name="str" />
    <xsl:variable name="tempStr">
      <xsl:call-template name="filterNonPrintable">
        <xsl:with-param name="str" select="$str"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:value-of select="translate($tempStr,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
  </xsl:template>
  
  <xsl:template name="toProper">
    <xsl:param name="str" />
    <xsl:call-template name="toUpper">
      <xsl:with-param name="str" select="substring($str,1,1)"/>
    </xsl:call-template><xsl:call-template name="toLower">
      <xsl:with-param name="str" select="substring($str,2)"/>
    </xsl:call-template>
  </xsl:template>

  <!-- filter out nonprintable characters like:
  +       8203 - zero-width space -->
  <xsl:template name="filterNonPrintable">
    <xsl:param name="str" />
    <xsl:value-of select="translate($str, '&#8203;', '')" />
  </xsl:template>

</xsl:stylesheet>
