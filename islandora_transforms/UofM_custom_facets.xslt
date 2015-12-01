<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:m="http://www.loc.gov/mods/v3"
  xmlns:foxml="info:fedora/fedora-system:def/foxml#">

 <!-- you need this template, but it is already loaded in UofM_MODS_to_solr.xslt -->
 <!-- <xsl:include href="islandora_transforms/library/xslt-date-template.xslt" /> -->

  <xsl:template match="foxml:datastream[@ID='MODS']/foxml:datastreamVersion[last()]">
    <xsl:param name="content"/>
    <xsl:param name="prefix">mods_</xsl:param>
    <xsl:param name="suffix">_ms</xsl:param>
    <xsl:apply-templates select="$content/m:mods/m:originInfo/m:dateIssued" mode="date_facet"/>
    <xsl:apply-templates select="$content/m:mods/m:extension" />

  </xsl:template>

  <xsl:template match="m:extension">
    <xsl:apply-templates select="m:dateCreated" mode="date_facet" />
  </xsl:template>

  <!--<xsl:template match="m:dateIssued">
    <xsl:if test="parent::node()/name() = 'originInfo'">
      <xsl:apply-templates mode="date_facet"/>
    </xsl:if>
  </xsl:template>-->

  <xsl:template match="m:dateCreated|m:dateIssued" mode="date_facet">
    <xsl:if test="string-length(normalize-space(text())) &gt; 0">
      <xsl:element name="field">
        <xsl:attribute name="name">mods_custom_date_facet_dts</xsl:attribute>
        <xsl:call-template name="get_ISO8601_date">
          <xsl:with-param name="date" select="normalize-space(text())"/>
        </xsl:call-template>
     </xsl:element>
   </xsl:if>
 </xsl:template>

</xsl:stylesheet>

