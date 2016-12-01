<xsl:stylesheet version="1.0"
  xmlns:xalan="http://xml.apache.org/xalan"
  xmlns:sparql="http://www.w3.org/2005/sparql-results#"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="library/traverse-graph.xslt"/>

  <!-- Pull both ancestors and Parent Collections -->
  <xsl:template name="get-ancestors-and-collections">
    <!--Pass in the pid-->
    <xsl:param name="PID" />

    <!--Construct the full pid uri-->
    <xsl:variable name="FULL_PID" select="concat('info:fedora/',$PID)"/>

    <xsl:variable name="query">
      PREFIX fre: &lt;info:fedora/fedora-system:def/relations-external#&gt;
      PREFIX fm: &lt;info:fedora/fedora-system:def/model#&gt;
      SELECT ?obj ?parentTitle ?parentModel ?childModel ?childTitle
      WHERE {
        {
          &lt;%PID_URI%&gt; fre:isMemberOfCollection ?obj .
        }
        UNION {
          &lt;%PID_URI%&gt; fre:isMemberOf ?obj .
        }
        OPTIONAL {
          ?obj fm:label ?parentTitle .
        }
        ?obj fm:state fm:Active ;
          fm:hasModel ?parentModel .
        FILTER (
           regex(str(?parentModel), 'info:fedora/islandora:')
        )
        &lt;%PID_URI%&gt; fm:state fm:Active ;
         fm:hasModel ?childModel ;
         fm:label ?childTitle .
        FILTER (
           regex(str(?childModel), 'info:fedora/islandora:')
        )
      }
    </xsl:variable>

    <xsl:variable name="query_results">
      <xsl:call-template name="_traverse_graph">
        <!--Provide the pid as a starting point, wrapped as a sparql result.-->
        <xsl:with-param name="to_traverse_in">
          <sparql:result>
            <sparql:binding name="obj">
              <sparql:uri><xsl:value-of select="$FULL_PID"/></sparql:uri>
            </sparql:binding>
          </sparql:result>
        </xsl:with-param>
        <xsl:with-param name="lang">sparql</xsl:with-param>
        <!--<xsl:with-param name="risearch"><xsl:value-of select="concat($PROT, '://', $FEDORAUSER, ':', $FEDORAPASS, '@', $FEDORAURL, $FEDORAPATH, '/risearch')"/></xsl:with-param>-->
        <xsl:with-param name="risearch"><xsl:value-of select="concat($PROT, '://', $FEDORAUSER, ':', $FEDORAPASS, '@', $FEDORAURL, '/bigdata/namespace/kb/sparql')"/></xsl:with-param>
        <xsl:with-param name="query" select="$query"/>
      </xsl:call-template>
    </xsl:variable>
    
    <xsl:for-each select="xalan:nodeset($query_results)//sparql:result">
      <xsl:if test="not(sparql:binding[@name = 'obj']/sparql:uri = $FULL_PID)">
        <xsl:if test="not(preceding-sibling::node()/sparql:binding[@name = 'obj']/sparql:uri = sparql:binding[@name = 'obj']/sparql:uri) and string-length(sparql:binding[@name = 'obj']/sparql:uri) &gt; 0">
          <field name="ancestors_ms"><xsl:value-of select="substring-after(sparql:binding[@name = 'obj']/sparql:uri, '/')"/></field>
        </xsl:if>
        <!-- if the parent has a title AND the child is not a newspaper or a collection AND the parent is a collection or a newspaper, get the title-->
        <xsl:if test="string-length(sparql:binding[@name = 'parentTitle']/sparql:literal) &gt; 0 and not(substring-after(sparql:binding[@name = 'childModel']/sparql:uri, '/') = 'islandora:newspaperCModel') and not(substring-after(sparql:binding[@name = 'childModel']/sparql:uri, '/') = 'islandora:collectionCModel') and (substring-after(sparql:binding[@name = 'parentModel']/sparql:uri, '/') = 'islandora:collectionCModel' or substring-after(sparql:binding[@name = 'parentModel']/sparql:uri, '/') = 'islandora:newspaperCModel')">
          <field name="collection_title_ms"><xsl:value-of select="sparql:binding[@name = 'parentTitle']/sparql:literal"/></field>
        </xsl:if>
        <xsl:choose>
          <xsl:when test="string-length(sparql:binding[@name = 'parentTitle']/sparql:literal) &gt; 0 and (substring-after(sparql:binding[@name = 'childModel']/sparql:uri, '/') = 'islandora:newspaperPageCModel' or substring-after(sparql:binding[@name = 'childModel']/sparql:uri, '/') = 'islandora:pageCModel')">
            <field name="facet_group_title_ms"><xsl:value-of select="sparql:binding[@name = 'parentTitle']/sparql:literal"/></field>
          </xsl:when>
          <xsl:when test="position() = 2">
            <field name="facet_group_title_ms"><xsl:value-of select="sparql:binding[@name = 'childTitle']/sparql:literal"/></field>
          </xsl:when>
        </xsl:choose>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>


  <!--Get all ancestors in the tree for the supplied pid.-->
  <!--Results include the pid supplied as a parameter!-->
  <xsl:template name="get-ancestors">

    <!--Pass in the pid-->
    <xsl:param name="PID" />

    <!--Construct the full pid uri-->
    <xsl:variable name="FULL_PID">info:fedora/<xsl:value-of select="@PID"/></xsl:variable>

    <!--Construct a nodeset that contains the sub-graph we're querying for-->
    <xsl:variable name="graph">

      <!--Call the traversal function-->
      <xsl:call-template name="_traverse_graph">

        <!--Provide the pid as a starting point, wrapped as a sparql result.-->
        <xsl:with-param name="to_traverse_in">
          <sparql:result>
            <sparql:obj>
              <xsl:attribute name="uri"><xsl:value-of select="$FULL_PID"/></xsl:attribute>
            </sparql:obj>
          </sparql:result>
        </xsl:with-param>

        <!--Provide the sparql query-->
        <xsl:with-param name="query">
          PREFIX fre: &lt;info:fedora/fedora-system:def/relations-external#&gt;
          PREFIX fm: &lt;info:fedora/fedora-system:def/model#&gt;
          SELECT ?obj
          WHERE {
            {
              ?sub fre:isMemberOfCollection ?obj
            }
            UNION{
              ?sub fre:isMemberOf ?obj
            }
            ?obj fm:state fm:Active .
            ?sub fm:state fm:Active
            FILTER(sameTerm(?sub, &lt;%PID_URI%&gt;))
          }
        </xsl:with-param>

      </xsl:call-template>

    </xsl:variable>

    <!--Return the ancestor sub-graph-->
    <!--<xsl:copy-of select="$graph" />-->
    <!--Iterate over the results of the traversal and construct the field tags for the solr update doc-->
    <xsl:for-each select="xalan:nodeset($graph)//sparql:obj">
      <xsl:if test="@uri != $FULL_PID">
        <field name="ancestors_ms"><xsl:value-of select="substring-after(@uri, '/')"/></field>
      </xsl:if>
    </xsl:for-each>

  </xsl:template>

  <!--Get all descendants of the supplied PID-->
  <!--Results include the pid supplied as a parameter!-->
  <xsl:template name="get-descendants">

    <!--Pass in the pid-->
    <xsl:param name="PID" />

    <!--Construct the full pid uri-->
    <xsl:variable name="FULL_PID">info:fedora/<xsl:value-of select="$PID"/></xsl:variable>

    <!--Construct a nodeset that contains the sub-graph we're querying for-->
    <xsl:variable name="graph">

      <!--Call the traversal function-->
      <xsl:call-template name="_traverse_graph">

        <!--Provide the pid as a starting point, wrapped as a sparql result.-->
        <xsl:with-param name="to_traverse_in">
          <sparql:result>
            <sparql:obj>
              <xsl:attribute name="uri"><xsl:value-of select="$FULL_PID"/></xsl:attribute>
            </sparql:obj>
          </sparql:result>
        </xsl:with-param>

        <!--Provide the sparql query-->
        <xsl:with-param name="query">
          PREFIX fre: &lt;info:fedora/fedora-system:def/relations-external#&gt;
          PREFIX fm: &lt;info:fedora/fedora-system:def/model#&gt;
          SELECT ?obj
          WHERE {
            {
              ?obj fre:isMemberOfCollection ?sub
            }
            UNION{
              ?obj fre:isMemberOf ?sub
            }
            ?obj fm:state fm:Active .
            ?sub fm:state fm:Active
            FILTER(sameTerm(?sub, &lt;%PID_URI%&gt;))
          }
        </xsl:with-param>

      </xsl:call-template>

    </xsl:variable>

    <!--Return the descendant sub-graph-->
    <!--<xsl:copy-of select="$graph" />-->
    <!--Iterate over the results of the traversal and construct the field tags for the solr update doc-->
    <xsl:for-each select="xalan:nodeset($graph)//sparql:obj">
      <xsl:if test="@uri != $FULL_PID">
        <field name="descendants_ms"><xsl:value-of select="substring-after(@uri, '/')"/></field>
      </xsl:if>
    </xsl:for-each>

  </xsl:template>

</xsl:stylesheet>
