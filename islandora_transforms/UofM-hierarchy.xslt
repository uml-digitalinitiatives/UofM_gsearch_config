<xsl:stylesheet version="1.0"
  xmlns:xalan="http://xml.apache.org/xalan"
  xmlns:sparql="http://www.w3.org/2001/sw/DataAccess/rf1/result"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="/usr/local/fedora/tomcat/webapps/fedoragsearch/WEB-INF/classes/fgsconfigFinal/index/gsearch_solr/islandora_transforms/UofM-traverse-graph.xslt"/>

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


        <xsl:with-param name="risearch">http://fedoraAdmin:h3ll0G00dby3@localhost:8080/fedora/risearch</xsl:with-param>
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
              &lt;%PID_URI%&gt; fre:isMemberOfCollection ?obj
            }
            UNION{
              &lt;%PID_URI%&gt; fre:isMemberOf ?obj
            }
            ?obj fm:state fm:Active .
            &lt;%PID_URI%&gt; fm:state fm:Active .
          }
        </xsl:with-param>

      </xsl:call-template>

    </xsl:variable>

    <!--Return the ancestor sub-graph-->
    <xsl:copy-of select="$graph" />

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

        <xsl:with-param name="risearch">http://fedoraAdmin:h3ll0G00dby3@localhost:8080/fedora/risearch</xsl:with-param>

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
              ?obj fre:isMemberOfCollection &lt;%PID_URI%&gt;
            }
            UNION{
              ?obj fre:isMemberOf &lt;%PID_URI%&gt;
            }
            ?obj fm:state fm:Active .
            &lt;%PID_URI%&gt; fm:state fm:Active .
          }
        </xsl:with-param>

      </xsl:call-template>

    </xsl:variable>

    <!--Return the descendant sub-graph-->
    <xsl:copy-of select="$graph" />

  </xsl:template>

</xsl:stylesheet>
