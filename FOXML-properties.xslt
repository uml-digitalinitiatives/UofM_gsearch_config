<?xml version="1.0" encoding="UTF-8"?>
<!-- FOXML properties -->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:foxml="info:fedora/fedora-system:def/foxml#"
     exclude-result-prefixes="foxml">

  <xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>

  <xsl:param name="pid"/>

  <xsl:template match="foxml:objectProperties">
    <xsl:element name="field">
      <xsl:attribute name="name">PID</xsl:attribute>
      <xsl:value-of select="$pid"/>
    </xsl:element>
    <xsl:apply-templates select="child::*" mode="FOXML-properties"/>
  </xsl:template>

  <xsl:template match="foxml:property[substring-after(@NAME, '#')='createdDate' or substring-after(@NAME, '#')='lastModifiedDate']" mode="FOXML-properties">
    <xsl:param name="prefix">fgs_</xsl:param>
    <xsl:param name="suffix">_dt</xsl:param>
    <xsl:if test="string-length(@VALUE) &gt; 0">
      <xsl:element name="field">
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, substring-after(@NAME,'#'), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="@VALUE"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

<!-- Index the fedora properties -->
  <xsl:template match="foxml:property" mode="FOXML-properties">
    <xsl:param name="prefix">fgs_</xsl:param>
    <xsl:param name="suffix">_s</xsl:param>
    <xsl:if test="string-length(@VALUE) &gt; 0">
      <xsl:element name="field">
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, substring-after(@NAME,'#'), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="@VALUE"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>