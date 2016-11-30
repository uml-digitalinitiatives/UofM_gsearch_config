<xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
        xmlns:res="http://www.w3.org/2005/sparql-results#"
        xmlns:xalan="http://xml.apache.org/xalan"
        xmlns:set="http://exslt.org/sets"
        xmlns:encoder="xalan://java.net.URLEncoder"
        xmlns:string="xalan://java.lang.String">
  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
  <xsl:param name="debug" select="true"/>

  <!-- traverse the graph -->
  <xsl:template name="_traverse_graph">
    <xsl:param name="risearch">http://fedoraAdmin:islandora@localhost:8080/fedora/risearch</xsl:param>
    <xsl:param name="to_traverse_in"/>
    <xsl:param name="traversed_in"/>
    <xsl:param name="query"/>
    
    <xsl:variable name="traverse" select="xalan:nodeset($to_traverse_in)"/>
    <xsl:if test="$debug">
      <xsl:message>Traverse:
        <xsl:for-each select="$traverse//*[/uri]">
          <xsl:value-of select="name()"/>:<xsl:value-of select="*/uri"/>
        </xsl:for-each>
      </xsl:message>
    </xsl:if>
    <xsl:variable name="traversed" select="xalan:nodeset($traversed_in)"/>
    <xsl:if test="$debug">
      <xsl:message>Traversed:
        <xsl:for-each select="$traversed//*[/uri]">
          <xsl:value-of select="name()"/>:<xsl:value-of select="./uri"/>
        </xsl:for-each>
      </xsl:message>
    </xsl:if>
    <xsl:variable name="difference" select="xalan:nodeset(set:difference($traverse, $traversed))"/>
    <xsl:if test="$debug">
      <xsl:message>Difference:
        <xsl:value-of select="count($difference/res:result)"/>
        <xsl:for-each select="$difference//*[/uri]">
          <xsl:value-of select="name()"/>:<xsl:value-of select="./uri"/>
        </xsl:for-each>
      </xsl:message>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="count($difference/res:result) = 0">
        <!-- There is nothing to traverse which has not already been traversed... -->
        <xsl:if test="$debug">
          <xsl:message>
            To index:
            <xsl:for-each select="$traversed//*[/uri]">
              <xsl:value-of select="./uri"/>
            </xsl:for-each>
          </xsl:message>
        </xsl:if>
        <xsl:copy-of select="$traversed/res:result"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="to_traverse">
          <xsl:for-each select="$difference/res:result">
            <xsl:if test="$debug">
              <xsl:message>diff: <xsl:value-of select="res:obj/@uri"/></xsl:message>
            </xsl:if>
            <xsl:if test="string-length(res:binding[@name = 'obj']/res:uri) &gt; 0">
              <xsl:variable name="new_query" select="string:replaceAll($query, '%PID_URI%', res:binding[@name = 'obj']/res:uri)"/>
              <xsl:variable name="query_results">
                <xsl:call-template name="perform_traversal_query">
                  <xsl:with-param name="risearch" select="$risearch"/>
                  <xsl:with-param name="query" select="$new_query" />
                  <xsl:with-param name="lang">sparql</xsl:with-param>
                </xsl:call-template>
              </xsl:variable>
              <xsl:copy-of select="xalan:nodeset($query_results)/res:sparql/res:results/res:result"/>
            </xsl:if>
          </xsl:for-each>
        </xsl:variable>
  
        <xsl:call-template name="_traverse_graph">
          <xsl:with-param name="risearch" select="$risearch"/>
          <xsl:with-param name="to_traverse_in" select="set:distinct(xalan:nodeset($to_traverse))"/>
          <xsl:with-param name="traversed_in">
            <xsl:copy-of select="$traversed/res:result | $difference/res:result"/>
          </xsl:with-param>
          <xsl:with-param name="query" select="$query"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="perform_traversal_query">
      <xsl:param name="risearch">http://localhost:8080/fedora/risearch</xsl:param>
      <xsl:param name="query"/>
      <xsl:param name="lang">itql</xsl:param>
      <xsl:param name="additional_params"/>
      <xsl:variable name="encoded_query" select="encoder:encode(normalize-space($query))"/>
      <xsl:variable name="query_url" select="concat($risearch, '?query=', $encoded_query, '&amp;lang=', $lang, $additional_params)"/>
      <xsl:value-of select="$query_url"/>
      <xsl:copy-of select="document($query_url)"/>
  </xsl:template>

</xsl:stylesheet>