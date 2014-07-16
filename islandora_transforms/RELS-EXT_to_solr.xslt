<?xml version="1.0" encoding="UTF-8"?>
<!-- RELS-EXT -->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:foxml="info:fedora/fedora-system:def/foxml#"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
     exclude-result-prefixes="rdf">
  
    <xsl:template match="foxml:datastream[@ID='RELS-EXT']/foxml:datastreamVersion[last()]" name='index_RELS-EXT'>
	    <xsl:param name="content"/>
	    <xsl:param name="prefix">RELS_EXT_</xsl:param>
	    <xsl:param name="suffix">_ms</xsl:param>
	    
	    <xsl:for-each select="$content//rdf:Description/*[@rdf:resource]">
			<field>
			  <xsl:attribute name="name">
			    <xsl:value-of select="concat($prefix, local-name(), '_uri', $suffix)"/>
			  </xsl:attribute>
        <!-- Hack the isMemberOfCollection value apart to not mess with Danny Joris's solr views -->
        <xsl:choose>
          <xsl:when test="local-name()='isMemberOfCollection'">
            <xsl:value-of select="substring-after(@rdf:resource, '/')"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="@rdf:resource"/>
          </xsl:otherwise>
        </xsl:choose>
        <!-- END OF HACK -->
      </field>
	    </xsl:for-each>
	    <xsl:for-each select="$content//rdf:Description/*[not(@rdf:resource)][normalize-space(text())]">
			<field>
		        <xsl:attribute name="name">
			        <xsl:value-of select="concat($prefix, local-name(), '_literal', $suffix)"/>
		        </xsl:attribute>
			    <xsl:value-of select="text()"/>
            </field>
	    </xsl:for-each>
  </xsl:template>
  
</xsl:stylesheet>
