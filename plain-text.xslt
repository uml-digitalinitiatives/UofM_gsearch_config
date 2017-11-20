<?xml version="1.0" encoding="UTF-8"?>
<!-- OCR glob into one field for indexing-->
<xsl:stylesheet version="1.0"
  xmlns:foxml="info:fedora/fedora-system:def/foxml#"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exts="xalan://dk.defxws.fedoragsearch.server.GenericOperationsImpl"
            exclude-result-prefixes="exts">
  <!-- Datastreams: OCR, TEXT, FULL_TEXT, ocr, text, full_text, fullText
      will probably need to have many templates match and feed into one?
      this file would then be re-named match all text datastreams
  -->
  <xsl:param name="DSID"/>

  <xsl:template match="OCR|TEXT|FULL_TEXT" name="plain-text">
    <xsl:element name="field">
      <xsl:attribute name="name">
        <!--<xsl:value-of select="concat($DSID, '_t')"/>-->
        <!-- Index all of these datastreams as OCR_t -->
        <xsl:text>OCR_t</xsl:text>
      </xsl:attribute>
      <xsl:value-of select="text()"/>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>