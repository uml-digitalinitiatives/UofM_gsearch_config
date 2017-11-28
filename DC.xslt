<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:foxml="info:fedora/fedora-system:def/foxml#"
  xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  exclude-result-prefixes="foxml dc oai_dc xlink">

  <xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>

  <xsl:template match="oai_dc:dc">
    <xsl:param name="prefix">dc.</xsl:param>
    <xsl:param name="suffix"></xsl:param>
    <!-- Create fields for the set of selected elements, named according to the 'local-name' and containing the 'text' -->
    <xsl:for-each select="./*">
      <xsl:if test="string-length(normalize-space(.)) &gt; 0">
        <xsl:element name="field">
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </xsl:element>
      </xsl:if>
    </xsl:for-each>

  </xsl:template>

</xsl:stylesheet>