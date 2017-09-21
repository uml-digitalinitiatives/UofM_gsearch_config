<?xml version="1.0" encoding="UTF-8"?>
<!-- for all inline xml glob all the text nodes into one field-->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:foxml="info:fedora/fedora-system:def/foxml#"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="foxml xhtml">
  <!-- have the template match whatever datastream needs this type of processing -->

  <xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>

  <xsl:template match="xhtml:html/xhtml:body">
    <xsl:param name="prefix">text_nodes_</xsl:param>
    <xsl:param name="suffix">_hlt</xsl:param>

    <xsl:element name="field">
      <xsl:attribute name="name">
        <xsl:value-of select="concat($prefix, 'HOCR' , $suffix)"/>
      </xsl:attribute>
      <xsl:apply-templates mode="index_text_nodes_as_a_text_field"/>
    </xsl:element>
  </xsl:template>

  <!-- Only output non-empty text nodes (followed by a single space) -->
  <xsl:template match="text()" mode="index_text_nodes_as_a_text_field">
    <xsl:if test="normalize-space(.)">
      <xsl:value-of select="normalize-space(.)"/>
      <xsl:text> </xsl:text>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>