<?xml version="1.0" encoding="UTF-8"?>
<!-- RELS-EXT -->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:foxml="info:fedora/fedora-system:def/foxml#"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
     exclude-result-prefixes="rdf foxml">

  <xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>

  <xsl:param name="DSID"/>

  <xsl:template match="rdf:RDF">
    <xsl:param name="prefix" select="concat(translate($DSID, '-', '_'),'_')"/>
    <xsl:param name="suffix">_ms</xsl:param>

    <xsl:apply-templates select="rdf:Description/*" mode="RELS-EXT-INT">
      <xsl:with-param name="prefix" select="$prefix" />
      <xsl:with-param name="suffix" select="$suffix" />
    </xsl:apply-templates>

  </xsl:template>

  <xsl:template match="*[@rdf:resource]" mode="RELS-EXT-INT">
    <xsl:param name="prefix"/>
    <xsl:param name="suffix">_ms</xsl:param>
    
    <xsl:variable name="value">
      <xsl:choose>
        <xsl:when test="local-name() = 'isMemberOfCollection'">
          <xsl:value-of select="substring-after(@rdf:resource, '/')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="@rdf:resource"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="string-length(normalize-space($value) &gt; 0">
      <xsl:element name="field">
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, local-name(), '_uri', $suffix)"/>
        </xsl:attribute>
        <!-- Hack the isMemberOfCollection value apart to not mess with Danny Joris's solr views -->
        <xsl:value-of select="$value"/>
        <!-- END OF HACK -->
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <xsl:template match="*[not(@rdf:resource)]" mode="RELS-EXT-INT">
    <xsl:param name="prefix"/>
    <xsl:param name="suffix">_ms</xsl:param>

    <xsl:if test="string-length(text()) &gt; 0">
      <xsl:element name="field">
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, local-name(), '_literal', $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <xsl:template match="text()"/>

</xsl:stylesheet>
