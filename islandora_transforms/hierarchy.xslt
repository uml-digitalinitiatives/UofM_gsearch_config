<xsl:stylesheet version="1.0"
  xmlns:xalan="http://xml.apache.org/xalan"
  xmlns:sparql="http://www.w3.org/2001/sw/DataAccess/rf1/result"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="/usr/local/fedora/tomcat/webapps/fedoragsearch/WEB-INF/classes/fgsconfigFinal/index/gsearch_solr/islandora_transforms/traverse-graph.xslt"/>

  <!-- Pull both ancestors and Parent Collections -->
  <xsl:template name="get-ancestors-and-collections">
    <!--Pass in the pid-->
    <xsl:param name="PID" />

    <!--Construct the full pid uri-->
    <xsl:variable name="FULL_PID" select="concat('info:fedora/',$PID)"/>

    <xsl:variable name="new_query">
      <xsl:call-template name="_recursive_string_replace">
        <xsl:with-param name='string'>
          PREFIX fre: &lt;info:fedora/fedora-system:def/relations-external#&gt;
          PREFIX fm: &lt;info:fedora/fedora-system:def/model#&gt;
          SELECT ?obj ?title
          FROM &lt;#ri&gt;
          WHERE {
            {
              &lt;%PID_URI%&gt; fre:isMemberOfCollection ?obj .
              OPTIONAL {
                ?obj fm:label ?title .
              }
            }
            UNION {
              &lt;%PID_URI%&gt; fre:isMemberOf ?obj
            }
            ?obj fm:state fm:Active .
            &lt;%PID_URI%&gt; fm:state fm:Active .
          }
        </xsl:with-param>
        <xsl:with-param name="find">%PID_URI%</xsl:with-param>
        <xsl:with-param name="replace" select="$FULL_PID"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="query_results">
      <xsl:call-template name="_traverse_graph">
        <xsl:with-param name="lang">sparql</xsl:with-param>
        <xsl:with-param name="risearch">http://fedoraAdmin:h3ll0G00dby3@localhost:8080/fedora/risearch</xsl:with-param>
        <xsl:with-param name="query" select="$new_query"/>
      </xsl:call-template>
    </xsl:variable>
    
    <xsl:for-each select="xalan:nodeset($query_results)//sparql:result">
      <xsl:if test="sparql:obj/@uri != $FULL_PID">
        <field name="ancestors_ms"><xsl:value-of select="substring-after(sparql:obj/@uri, '/')"/></field>
        <xsl:if test="string-length(sparql:title) &gt; 0 and substring-after(sparql:obj/@uri, '/') != 'uofm:top'">
          <field name="collection_title_ms"><xsl:value-of select="sparql:title"/></field>
        </xsl:if>
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
          FROM &lt;#ri&gt;
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
          FROM &lt;#ri&gt;
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
