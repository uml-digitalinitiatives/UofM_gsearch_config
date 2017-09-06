<?xml version="1.0" encoding="utf-8"?>
<!--
Copyright 2007, The Digital Library Federation, All Rights Reserved
*
* Permission is hereby granted, free of charge, to any person obtaining
* a copy of this software and associated documentation files (the
* "Software"), to deal in the Software without restriction, including
* without limitation the rights to use, copy, modify, merge, publish,
* distribute, sublicense, and/or sell copies of the Software, and to
* permit persons to whom the Software is furnished to do so, subject
* to the following conditions:
*
* The above copyright notice and this permission notice shall be
* included in all copies or substantial portions of the Software.

* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
* MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
* IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
* CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
* TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
* SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:m="http://www.loc.gov/mods/v3"
  xmlns:foxml="info:fedora/fedora-system:def/foxml#"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="foxml m xlink xs exsl">

  <xsl:include href="library/xslt-date-template.xslt"/>
  <xsl:include href="library/mods-role-term.xslt"/>

  <xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>

<!-- This is left over from the one stylesheet to rule them all format
  <xsl:template match="foxml:datastream[@ID='MODS']/foxml:datastreamVersion[last()]" name="index_MODS">
    <xsl:param name="content"/>
    <xsl:param name="prefix">mods_</xsl:param>
    <xsl:param name="suffix">_ms</xsl:param>

    <xsl:apply-templates select="$content/m:mods">
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="suffix" select="$suffix"/>
    </xsl:apply-templates>
    <xsl:apply-templates select="m:mods/m:extension/m:dateCreated" mode="date_facet" />
  </xsl:template>
  -->

  <!-- This is a recursive template that will concatenate
    all the local names of parents of the supplied node.
    This is to provide context to the Solr field.-->
  <xsl:template name="get_all_parents">
    <xsl:param name="node"/>

    <xsl:if test="not(local-name($node)='mods')">
      <xsl:call-template name="get_all_parents">
        <xsl:with-param name="node" select="$node/.."/>
      </xsl:call-template>
      <xsl:value-of select="concat('_', local-name($node))"/>
    </xsl:if>

  </xsl:template>

    <!-- This is the first match for this template, all things flow from here. -->
    <xsl:template match="m:mods">
        <xsl:variable name="form" select="m:physicalDescription/m:form" />
        <xsl:variable name="rform" select="m:physicalDescription/m:reformattingQuality" />
        <xsl:variable name="intm" select="m:physicalDescription/m:internetMediaType" />
        <xsl:variable name="extent" select="m:physicalDescription/m:extent" />
        <xsl:variable name="dorigin" select="m:physicalDescription/m:digitalOrigin" />
        <xsl:variable name="note" select="m:note" />
        <xsl:variable name="topic" select="m:subject/m:topic" />
        <xsl:variable name="geo" select="m:subject/m:geographic" />
        <xsl:variable name="time" select="m:subject/m:temporal" />
        <xsl:variable name="hierarchic" select="m:subject/m:hierarchicalGeographic" />
        <xsl:variable name="subname" select="m:subject/m:name" />


        <xsl:apply-templates select="m:extension/m:dateCreated" mode="date_facet" />
        <!-- Commenting these out so we don't have nested add and doc tags that don't close.
        <xsl:element name="add">
            <xsl:element name="doc">
        -->
                <!-- SetSpec is handled twice, once for regular indexing and once for faceting,
                The setSpec will be broken up into individual elements by the java processing
                -->
                <!-- set_spec is handled up above -->
                <!-- we only want one title sort element -->
                <xsl:if test="m:titleInfo/m:title">
                    <xsl:if test="position() = 1">
                        <xsl:element name="field">
                            <xsl:attribute name="name">title_sort_ms</xsl:attribute>
                            <xsl:value-of select="m:titleInfo/m:title" />
                        </xsl:element>
                    </xsl:if>
                </xsl:if>
                <xsl:if test="m:identifier[@type='pid']">
                    <xsl:if test="position() = 1">
                        <xsl:element name="field">
                            <xsl:attribute name="name">id</xsl:attribute>
                            <xsl:value-of select="m:identifier[@type='pid']" />
                        </xsl:element>
                    </xsl:if>
                </xsl:if>
                <!-- identifier -->
                <xsl:apply-templates select="m:identifier" />
                <!-- titleInfo -->
                <xsl:apply-templates select="m:titleInfo" />
                <!-- name -->
                <xsl:apply-templates select="m:name" />
                <!-- subject -->
                <xsl:apply-templates select="m:subject" />
                <!-- typeOfResource and genre as well-->
                <xsl:apply-templates select="m:typeOfResource|m:genre" />
                <!-- genre -->
                <xsl:if test="m:genre">

                    <xsl:element name="field">
                        <xsl:attribute name="name">genre_mt</xsl:attribute>
                        <xsl:for-each select="m:genre">
                           <xsl:if test="string-length(text()) &gt; 0">
                            <xsl:if test=". != ''">
                                <xsl:if test="position() != 1">
                                    <xsl:text>; </xsl:text>
                                </xsl:if>
                                <xsl:value-of select="." />
                            </xsl:if>
                          </xsl:if>
                        </xsl:for-each>
                    </xsl:element>
                    <xsl:for-each select="m:genre">
                       <xsl:if test="string-length(text()) &gt; 0">
                        <xsl:element name="field">
                            <xsl:attribute name="name">genre_facet_ms</xsl:attribute>
                            <xsl:value-of select="normalize-space(.)" />
                        </xsl:element>
                      </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <!-- collection -->
                <xsl:for-each select="m:relatedItem/m:titleInfo[@authority='dlfaqcoll']/m:title">
                    <xsl:element name="field">
                        <xsl:attribute name="name">collection_facet_ms</xsl:attribute>
                        <xsl:value-of select="normalize-space(.)" />
                    </xsl:element>
                </xsl:for-each>
                <!-- originInfo -->
                <xsl:apply-templates select="m:originInfo" />
                <!-- language -->
                <xsl:if test="m:language/m:languageTerm[@type='text']">
                    <xsl:element name="field">
                        <xsl:attribute name="name">language_mt</xsl:attribute>
                        <xsl:for-each select="m:language/m:languageTerm[@type='text']">
                            <xsl:if test=". != ''">
                                <xsl:if test="position() != 1">
                                    <xsl:text>; </xsl:text>
                                </xsl:if>
                                <xsl:value-of select="." />
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:element>
                    <xsl:for-each select="m:language/m:languageTerm[@type='text']">
                        <xsl:element name="field">
                            <xsl:attribute name="name">language_facet_ms</xsl:attribute>
                            <xsl:value-of select="normalize-space(.)" />
                        </xsl:element>
                    </xsl:for-each>
                </xsl:if>
                <!-- physicalDescription -->
                <xsl:if test="$form or $rform or $intm or $extent or $dorigin">
                    <xsl:apply-templates select="m:physicalDescription" />
                </xsl:if>
                <!-- abstract -->
                <xsl:apply-templates select="m:abstract" />
                <!-- tableOfContents -->
                <xsl:apply-templates select="m:tableOfContents" />
                <!-- targetAudience -->
                <xsl:apply-templates select="m:targetAudience" />
                <!-- note -->
                <xsl:if test="$note">
                    <xsl:for-each select="m:note">
                        <xsl:if test=". != ''">
                            <xsl:element name="field">
                                <xsl:attribute name="name">note_mt</xsl:attribute>
                                <xsl:value-of select="." />
                            </xsl:element>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <!-- relatedItem -->
                <xsl:apply-templates select="m:relatedItem" />
                <!-- location -->
                <xsl:apply-templates select="m:location" />
                <!-- accessCondition -->
                <xsl:apply-templates select="m:accessCondition" />
        <!-- Closing add and doc tags
            </xsl:element>
        </xsl:element>
        -->
    </xsl:template>
    <xsl:template match="m:titleInfo">
        <xsl:variable name="nsort" select="m:nonSort" />
        <xsl:variable name="titl" select="m:title" />
        <xsl:variable name="subt" select="m:subTitle" />
        <xsl:variable name="partname" select="m:partName" />
        <xsl:variable name="partNumber" select="m:partnum" />
        <xsl:choose>
            <xsl:when test="@type = 'alternative' or m:title/@type = 'alternative'">
                <xsl:element name="field">
                    <xsl:attribute name="name">
                        <xsl:text>alt_title_mt</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="m:title" />
                </xsl:element>
            </xsl:when>
            <xsl:when test="@type = 'uniform' or m:title/@type = 'uniform'">
                <xsl:element name="field">
                    <xsl:attribute name="name">
                        <xsl:text>uni_title_mt</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="m:title" />
                </xsl:element>
            </xsl:when>
            <xsl:when test="@type = 'abbreviated' or m:title/@type = 'abbreviated'">
                <xsl:element name="field">
                    <xsl:attribute name="name">
                        <xsl:text>abbr_title_mt</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="m:title" />
                </xsl:element>
            </xsl:when>
            <xsl:when test="@type = 'translated' or m:title/@type = 'translated'">
                <xsl:element name="field">
                    <xsl:attribute name="name">
                        <xsl:text>trans_title_mt</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="m:title" />
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="field">
                    <xsl:attribute name="name">title_mt</xsl:attribute>
                    <!-- including nsort because this is keyword search spec -->
                    <xsl:value-of select="$nsort" />
                    <xsl:value-of select="$titl" />
                    <xsl:for-each select="m:subTitle">
                        <xsl:if test=". != ''">
                            <xsl:if test="position()=1 and $titl">
                                <xsl:text>; </xsl:text>
                            </xsl:if>
                            <xsl:value-of select="." />
                            <xsl:if test="position() != last()">
                                <xsl:text>; </xsl:text>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="m:subtitle">
                        <xsl:if test=". != ''">
                            <xsl:if test="position()=1 and $titl">
                                <xsl:text>; </xsl:text>
                            </xsl:if>
                            <xsl:value-of select="." />
                            <xsl:if test="position() != last()">
                                <xsl:text>; </xsl:text>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="m:partName">
                        <xsl:if test=". != ''">
                            <xsl:if test="position()=1 and ($titl or $subt)">
                                <xsl:text>; </xsl:text>
                            </xsl:if>
                            <xsl:value-of select="." />
                            <xsl:if test="position() != last()">
                                <xsl:text>; </xsl:text>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="m:partNumber">
                        <xsl:if test=". != ''">
                            <xsl:if test="position()=1 and ($titl or $subt or $partname)">
                                <xsl:text>; </xsl:text>
                            </xsl:if>
                            <xsl:value-of select="." />
                            <xsl:if test="position() != last()">
                                <xsl:text>; </xsl:text>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="m:identifier">
        <xsl:element name="field">
            <xsl:attribute name="name">
                <xsl:text>identifier_mt</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="." />
        </xsl:element>
    </xsl:template>
    <xsl:template match="m:name">
       <xsl:if test="string-length(text()) &gt; 0">
        <xsl:element name="field">
            <xsl:attribute name="name">
                <xsl:choose>
                    <xsl:when test="@type='organization' or @type='corporate'">
                        <xsl:text>name_organization_mt</xsl:text>
                    </xsl:when>
                    <xsl:when test="@type='conference'">
                        <xsl:text>name_conference_mt</xsl:text>
                    </xsl:when>
                    <xsl:when test="@type='personal'">
                        <xsl:text>name_personal_mt</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>name_personal_mt</xsl:text>
                        <xsl:message>mods:name@type (<xsl:value-of select="@type"/>) check failed using default name_personal_mt</xsl:message>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test="m:namePart[@type='family'] or m:namePart[@type='given']">
                    <xsl:if test="m:namePart[@type='family']">
                        <xsl:value-of select="m:namePart[@type='family']" />
                    </xsl:if>
                    <xsl:if test="m:namePart[@type='given']">
                        <xsl:if test="m:namePart[@type='family']">
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="m:namePart[@type='given']" />
                    </xsl:if>
                    <xsl:if test="m:namePart[@type='date']">
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="m:namePart[@type='date']" />
                    </xsl:if>
                </xsl:when>
                <!-- if only namePart no specific family or given name tags -->
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="m:namePart != ''">
                            <xsl:for-each select="m:namePart">
                                <xsl:value-of select="." />
                                <xsl:if test="position()!=last()">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:when>
                        <!-- if only displayForm -->
                        <xsl:otherwise>
                            <xsl:if test="m:displayForm != ''">
                                <xsl:for-each select="m:displayForm">
                                    <xsl:value-of select="." />
                                    <xsl:if test="position()!=last()">
                                        <xsl:text>, </xsl:text>
                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
            <!-- if there is text roleTerm -->
            <xsl:for-each select="m:role/m:roleTerm">
                <xsl:if test="string-length(.) &gt; 0">
                    <xsl:text>, </xsl:text>
                    <xsl:apply-templates select="." mode="translate" />
                </xsl:if>
            </xsl:for-each>
        </xsl:element>
      </xsl:if>

        <xsl:variable name="nameVal">
          <xsl:choose>
              <xsl:when test="m:namePart[@type='family'] or m:namePart[@type='given']">
                  <xsl:if test="m:namePart[@type='family']">
                      <xsl:value-of select="normalize-space(m:namePart[@type='family'])" />
                  </xsl:if>
                  <xsl:if test="m:namePart[@type='given']">
                      <xsl:if test="normalize-space(m:namePart[@type='family'])">
                          <xsl:text>, </xsl:text>
                      </xsl:if>
                      <xsl:value-of select="normalize-space(m:namePart[@type='given'])" />
                  </xsl:if>
                  <xsl:if test="m:namePart[@type='date']">
                      <xsl:text>, </xsl:text>
                      <xsl:value-of select="normalize-space(m:namePart[@type='date'])" />
                  </xsl:if>
              </xsl:when>
              <!-- if only namePart no specific family or given name tags -->
              <xsl:otherwise>
                  <xsl:choose>
                      <xsl:when test="m:namePart != ''">
                          <xsl:for-each select="m:namePart">
                              <xsl:value-of select="." />
                              <xsl:if test="position()!=last()">
                                  <xsl:text>, </xsl:text>
                              </xsl:if>
                          </xsl:for-each>
                      </xsl:when>
                      <!-- if only displayForm -->
                      <xsl:otherwise>
                          <xsl:if test="m:displayForm != ''">
                              <xsl:for-each select="m:displayForm">
                                  <xsl:value-of select="." />
                                  <xsl:if test="position()!=last()">
                                      <xsl:text>, </xsl:text>
                                  </xsl:if>
                              </xsl:for-each>
                          </xsl:if>
                      </xsl:otherwise>
                  </xsl:choose>
              </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:if test="string-length($nameVal) &gt; 0">
          <xsl:element name="field">
              <xsl:attribute name="name">
                  <xsl:choose>
                      <xsl:when test="@type='organization' or @type='corporate'">
                          <xsl:text>name_organization_facet_ms</xsl:text>
                      </xsl:when>
                      <xsl:when test="@type='conference'">
                          <xsl:text>name_conference_facet_ms</xsl:text>
                      </xsl:when>
                      <xsl:when test="@type='personal'">
                          <xsl:text>name_personal_facet_ms</xsl:text>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>name_personal_mt</xsl:text>
                        <xsl:message>mods:name@type check failed, using default name_personal_mt</xsl:message>
                      </xsl:otherwise>
                  </xsl:choose>
              </xsl:attribute>
            <xsl:value-of select="$nameVal" />
          </xsl:element>
          <!-- 2014-07-18 : whikloj - Also add names to the subject_name_facet -->
          <field name="subject_name_facet_ms"><xsl:value-of select="$nameVal" /></field>
        </xsl:if>
    </xsl:template>
    <xsl:template match="m:subject">
        <xsl:variable name="topic" select="m:topic|m:occupation|m:titleInfo" />
        <xsl:variable name="geo" select="m:geographic|m:hierarchicalGeographic|m:geographicCode" />
        <xsl:variable name="time" select="m:temporal" />
        <xsl:variable name="cart" select="m:cartographics" />
        <xsl:variable name="genre" select="m:genre" />
        <xsl:variable name="subname" select="m:name" />
        <xsl:for-each select="$topic[string-length(text()) &gt; 0]">
            <xsl:element name="field">
                <xsl:attribute name="name">
                    <xsl:text>subject_topic_mt</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="." />
            </xsl:element>
            <xsl:element name="field">
                <xsl:attribute name="name">
                    <xsl:text>subject_topic_facet_ms</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="normalize-space(.)" />
            </xsl:element>
        </xsl:for-each>
        <xsl:for-each select="$geo[string-length(text()) &gt; 0]">
            <xsl:element name="field">
                <xsl:attribute name="name">
                    <xsl:text>subject_geographic_mt</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="." />
            </xsl:element>
            <xsl:element name="field">
                <xsl:attribute name="name">
                    <xsl:text>subject_geographic_facet_ms</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="normalize-space(.)" />
            </xsl:element>
        </xsl:for-each>
        <!-- Jared test (2014-07-02 -->
        <xsl:if test="normalize-space(m:hierarchicalGeographic) != ''">
          <xsl:for-each select="m:hierarchicalGeographic">
            <xsl:variable name="place_string">
              <xsl:call-template name="list_with_commas">
                <xsl:with-param name="list">
                  <xsl:copy-of select="m:country"/>
                  <xsl:copy-of select="m:province"/>
                  <xsl:copy-of select="m:state"/>
                  <xsl:copy-of select="m:region"/>
                  <xsl:copy-of select="m:county"/>
                  <xsl:copy-of select="m:city"/>
                  <xsl:copy-of select="m:citySection"/>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:variable>
            <xsl:if test="string-length($place_string) &gt; 0">
              <field name="hierarchicGeographic_facet_ms">
                <xsl:value-of select="$place_string"/>
              </field>
            </xsl:if>
            <xsl:if test="m:country and normalize-space(m:country) != ''">
              <field name="hierarchicGeographic_country_facet_ms"><xsl:value-of select="m:country"/></field>
            </xsl:if>
            <xsl:if test="m:region and normalize-space(m:region) != ''">
              <field name="hierarchicGeographic_region_facet_ms"><xsl:value-of select="m:region"/></field>
            </xsl:if>
            <xsl:if test="m:province and normalize-space(m:province) != ''">
              <field name="hierarchicGeographic_province_state_facet_ms"><xsl:value-of select="m:province"/></field>
            </xsl:if>
            <xsl:if test="m:county and normalize-space(m:county) != ''">
              <field name="hierarchicGeographic_county_facet_ms"><xsl:value-of select="m:county"/></field>
            </xsl:if>
            <xsl:if test="m:state and normalize-space(m:state) != ''">
              <field name="hierarchicGeographic_province_state_facet_ms"><xsl:value-of select="m:state"/></field>
            </xsl:if>
            <xsl:if test="m:city and normalize-space(m:city) != ''">
              <field name="hierarchicGeographic_city_facet_ms"><xsl:value-of select="m:city"/></field>
            </xsl:if>
            <xsl:if test="m:citySection and normalize-space(m:citySection) != ''">
              <field name="hierarchicGeographic_citySection_facet_ms"><xsl:value-of select="m:citySection"/></field>
            </xsl:if>
          </xsl:for-each>
        </xsl:if> <!-- if hierarchicalGeographic -->
        <xsl:for-each select="$time[string-length(text()) &gt; 0]">
            <xsl:element name="field">
                <xsl:attribute name="name">
                    <xsl:text>subject_temporal_mt</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="." />
            </xsl:element>
            <xsl:element name="field">
                <xsl:attribute name="name">
                    <xsl:text>subject_temporal_facet_ms</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="normalize-space(.)" />
            </xsl:element>
        </xsl:for-each>
        <xsl:for-each select="$subname[string-length(text()) &gt; 0]">
            <xsl:element name="field">
                <xsl:attribute name="name">
                    <xsl:text>subject_name_mt</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="." />
            </xsl:element>
            <xsl:element name="field">
                <xsl:attribute name="name">
                    <xsl:text>subject_name_facet_ms</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="normalize-space(.)" />
            </xsl:element>
        </xsl:for-each>
        <xsl:for-each select="$genre[string-length(text()) &gt; 0]">
            <xsl:element name="field">
                <xsl:attribute name="name">
                    <xsl:text>genre_mt</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="." />
            </xsl:element>
            <xsl:element name="field">
                <xsl:attribute name="name">
                    <xsl:text>genre_facet_ms</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="normalize-space(.)" />
            </xsl:element>
        </xsl:for-each>
        <!-- slurp up all sub elements of subject into one field, not sure if we need this -->
        <xsl:if test="*">
            <xsl:element name="field">
                <xsl:attribute name="name">
                    <xsl:text>subject_mt</xsl:text>
                </xsl:attribute>
                <xsl:for-each select="*">
                    <xsl:if test=". != ''">
                        <xsl:value-of select="." />
                        <xsl:if test="position()!=last()">
                            <xsl:text> --</xsl:text>
                        </xsl:if>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
            <xsl:element name="field">
                <xsl:attribute name="name">
                    <xsl:text>subject_facet_ms</xsl:text>
                </xsl:attribute>
                <xsl:for-each select="*">
                    <xsl:if test=". != ''">
                        <xsl:value-of select="normalize-space(.)" />
                        <xsl:if test="position()!=last()">
                            <xsl:text> --</xsl:text>
                        </xsl:if>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    <xsl:template match="m:typeOfResource | m:genre">
        <xsl:element name="field">
            <xsl:attribute name="name">type_of_resource_mt</xsl:attribute>
            <xsl:value-of select="." />
        </xsl:element>
        <xsl:element name="field">
            <xsl:attribute name="name">type_of_resource_facet_ms</xsl:attribute>
            <xsl:value-of select="normalize-space(.)" />
        </xsl:element>
    </xsl:template>
    <xsl:template match="m:abstract">
        <xsl:choose>
            <xsl:when test="@xlink">
                <xsl:element name="field">
                    <xsl:attribute name="name">
                        <xsl:text>abstract_mt</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="@xlink" />
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="field">
                    <xsl:attribute name="name">abstract_mt</xsl:attribute>
                    <xsl:value-of select="." />
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="m:tableOfContents">
        <xsl:choose>
            <xsl:when test="@xlink">
                <xsl:element name="field">
                    <xsl:attribute name="name">
                        <xsl:text>table_of_contents_mt</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="@xlink" />
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="field">
                    <xsl:attribute name="name">table_of_contents_mt</xsl:attribute>
                    <xsl:value-of select="." />
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="m:targetAudience">
        <xsl:choose>
            <xsl:when test="@xlink">
                <xsl:element name="field">
                    <xsl:attribute name="name">
                        <xsl:text>toc_mt</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="@xlink" />
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="field">
                    <xsl:attribute name="name">target_audience_mt</xsl:attribute>
                    <xsl:value-of select="." />
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="m:relatedItem">
        <xsl:if test="@type = 'host'">
            <xsl:element name="field">
                <xsl:attribute name="name">related_item_identifier_mt</xsl:attribute>
                <xsl:value-of select="m:identifier" />
            </xsl:element>
            <xsl:element name="field">
                <xsl:attribute name="name">related_item_title_ms</xsl:attribute>
                <xsl:value-of select="m:titleInfo/m:title" />
            </xsl:element>
        </xsl:if>
    </xsl:template>
    <xsl:template match="m:location">
        <xsl:if test="m:physicalLocation">
            <xsl:element name="field">
                <xsl:attribute name="name">location_mt</xsl:attribute>
                <xsl:for-each select="m:physicalLocation">
                    <xsl:if test=". != ''">
                        <xsl:value-of select="." />
                        <xsl:if test="position() != last()">
                            <xsl:text>; </xsl:text>
                        </xsl:if>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    <xsl:template match="m:accessCondition">
        <xsl:element name="field">
            <xsl:attribute name="name">access_condition_mt</xsl:attribute>
            <xsl:value-of select="." />
        </xsl:element>
    </xsl:template>
    <xsl:template match="m:physicalDescription">
        <xsl:element name="field">
            <xsl:attribute name="name">physical_description_mt</xsl:attribute>
            <xsl:for-each select="*">
                <xsl:if test=". != ''">
                    <xsl:value-of select="." />
                    <xsl:if test="position() != last()">
                        <xsl:text>; </xsl:text>
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    <xsl:template match="m:originInfo">
        <!--+
     + first look for any date with a keyDate and any attribute with the value w3cdtf
     + then for any date with a keyDate
     + then for the first dateIssued
     + then for the first dateCreated
     + then for the first copyrightDate
     + then for the first dateOther
     +-->
        <xsl:param name="prefix">mods</xsl:param>
        <xsl:param name="suffix">_ms</xsl:param>
        <xsl:variable name="date_splat_w3c_key_date" select="*[@keyDate and @*='w3cdtf']" />
        <xsl:variable name="date_splat_key_date" select="*[@keyDate]" />
        <xsl:variable name="date_created" select="m:dateCreated[not(@keyDate)]" />
        <xsl:variable name="date_issued" select="m:dateIssued[not(@keyDate)]" />
        <xsl:variable name="date_copyrighted" select="m:copyrightDate[not(@keyDate)]" />
        <xsl:variable name="date_other" select="m:dateOther[not(@keyDate)]" />
        <xsl:variable name="date_captured" select="m:dateCaptured[not(@keyDate)]" />
        <xsl:variable name="date_valid" select="m:dateValid[not(@keyDate)]" />
        <xsl:variable name="date_modified" select="m:dateModified[not(@keyDate)]" />
        <xsl:choose>
            <xsl:when test="$date_splat_w3c_key_date[string-length(text()) &gt; 0]">
                <xsl:element name="field">
                    <xsl:attribute name="name">raw_date</xsl:attribute>
                    <xsl:value-of select="$date_splat_w3c_key_date" />
                </xsl:element>
            </xsl:when>
            <xsl:when test="$date_splat_key_date[string-length(text()) &gt; 0]">
                <xsl:element name="field">
                    <xsl:attribute name="name">raw_date</xsl:attribute>
                    <xsl:value-of select="$date_splat_key_date" />
                </xsl:element>
            </xsl:when>
            <xsl:when test="$date_created[string-length(text()) &gt; 0]">
                <xsl:for-each select="$date_created[string-length(text()) &gt; 0]">
                    <xsl:element name="field">
                        <xsl:attribute name="name">raw_date</xsl:attribute>
                        <xsl:choose>
                            <xsl:when test="@point='start'">
                                <xsl:value-of select="." />
                                <xsl:text>-</xsl:text>
                                <xsl:value-of select="following-sibling::*[1]" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="." />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:element>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="$date_issued[string-length(text()) &gt; 0]">
                <xsl:for-each select="$date_issued[string-length(text()) &gt; 0]">
                    <!-- also make a mods_custom_date_facet -->
                    <xsl:apply-templates select="$date_issued" mode="date_facet"/>
                    <xsl:element name="field">
                        <xsl:attribute name="name">raw_date</xsl:attribute>
                        <xsl:choose>
                            <xsl:when test="@point='start'">
                                <xsl:value-of select="." />
                                <xsl:text>-</xsl:text>
                                <xsl:value-of select="following-sibling::*[1]" />
                            </xsl:when>
                            <xsl:when test="@point='end'">
                                <xsl:text>n.d.</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="." />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:element>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="$date_copyrighted[string-length(text()) &gt; 0]">
                <xsl:for-each select="$date_copyrighted[string-length(text()) &gt; 0]">
                    <xsl:element name="field">
                        <xsl:attribute name="name">raw_date</xsl:attribute>
                        <xsl:choose>
                            <xsl:when test="@point='start'">
                                <xsl:value-of select="." />
                                <xsl:text>-</xsl:text>
                                <xsl:value-of select="following-sibling::*[1]" />
                            </xsl:when>
                            <xsl:when test="@point='end'">
                                <xsl:text>n.d.</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="." />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:element>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="$date_other[string-length(text()) &gt; 0]">
                <xsl:for-each select="$date_other[string-length(text()) &gt; 0]">
                    <xsl:element name="field">
                        <xsl:attribute name="name">raw_date</xsl:attribute>
                        <xsl:choose>
                            <xsl:when test="@point='start'">
                                <xsl:value-of select="." />
                                <xsl:text>-</xsl:text>
                                <xsl:value-of select="following-sibling::*[1]" />
                            </xsl:when>
                            <xsl:when test="@point='end'">
                                <xsl:text>n.d.</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="." />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:element>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
        <xsl:if test="m:placeTerm[@type='text']|m:publisher">
            <xsl:element name="field">
                <xsl:attribute name="name">publisher_place_mt</xsl:attribute>
                <xsl:for-each select="m:placeTerm[@type='text']|m:publisher">
                    <xsl:if test=". != ''">
                        <xsl:value-of select="." />
                        <xsl:if test="position() != last()">
                            <xsl:text>; </xsl:text>
                        </xsl:if>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
        </xsl:if>
        <xsl:if test="m:edition|m:issuance|m:frequency">
            <xsl:element name="field">
                <xsl:attribute name="name">origin_aspects_mt</xsl:attribute>
                <xsl:for-each select="m:edition|m:issuance|m:frequency">
                    <xsl:if test=". != ''">
                        <xsl:value-of select="." />
                        <xsl:if test="position() != last()">
                            <xsl:text>; </xsl:text>
                        </xsl:if>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
        </xsl:if>
        <xsl:variable name="pl" select="m:place" />
        <xsl:variable name="pub" select="m:publisher" />
        <xsl:variable name="datei" select="m:dateIssued" />  <!--separator="== "-->
        <xsl:variable name="datec" select="m:dateCreated" />
        <xsl:variable name="datecr" select="m:copyrightDate" />
        <xsl:variable name="edit" select="m:edition" />
        <xsl:if test="$pl or $pub or $datei or $datec or $edit">
            <xsl:element name="field">
                <xsl:attribute name="name">origin_mt</xsl:attribute>
                <xsl:if test="$pl or $pub or $datei or $datec">
                    <!-- place U concatenated with publisher T into U -->
                    <xsl:if test="$pl or $pub">
                        <!-- place U -->
                        <xsl:if test="$pl">
                            <xsl:for-each select="m:place/m:placeTerm">
                                <xsl:choose>
                                    <xsl:when test="@type = 'code'" />
                                    <xsl:otherwise>
                                        <xsl:value-of select="." />
                                        <xsl:if test="position()!=last()">
                                            <xsl:text>; </xsl:text>
                                        </xsl:if>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </xsl:if>
                        <!-- concatenated by ',' -->
                        <xsl:if test="$pl and $pub">
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                        <!-- publisher T -->
                        <xsl:if test="$pub">
                            <xsl:for-each select="m:publisher">
                                <xsl:if test=". != ''">
                                    <xsl:value-of select="." />
                                    <xsl:if test="position()!=last()">
                                        <xsl:text>; </xsl:text>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:if>
                    <xsl:if test="( $pl or $pub ) and ( $datei or $datec )">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                    <!-- dateIssued YR -->
                    <xsl:if test="$datei">
                        <xsl:for-each select="m:dateIssued">
                            <xsl:if test=". != ''">
                                <xsl:value-of select="." />
                                <xsl:if test="position()!=last()">
                                    <xsl:text>; </xsl:text>
                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="$datei or $datec">
                        <xsl:text>; </xsl:text>
                    </xsl:if>
                    <!-- dateCreated YR -->
                    <xsl:if test="$datec">
                        <xsl:for-each select="m:dateCreated">
                            <xsl:if test=". != ''">
                                <xsl:value-of select="." />
                                <xsl:if test="position()!=last()">
                                    <xsl:text>; </xsl:text>
                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:if>
                <xsl:if test="$pl or $pub or $datei or $datec">
                    <xsl:text>, </xsl:text>
                </xsl:if>
                <xsl:if test="$edit">
                    <xsl:for-each select="m:edition">
                        <xsl:if test=". != ''">
                            <xsl:value-of select="." />
                            <xsl:if test="position()!=last()">
                                <xsl:text>; </xsl:text>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:element>
        </xsl:if>

        <!-- Handle dates. -->
        <xsl:for-each select=".//m:*[(@type='date') or (contains(translate(local-name(), 'D', 'd'), 'date'))][normalize-space(text())]">

          <xsl:variable name="textValue">
            <xsl:call-template name="get_ISO8601_date">
              <xsl:with-param name="date" select="normalize-space(text())"/>
            </xsl:call-template>
          </xsl:variable>

          <xsl:variable name="fieldName">
            <xsl:call-template name="get_all_parents">
              <xsl:with-param name="node" select="."/>
            </xsl:call-template>
          </xsl:variable>

          <xsl:if test="normalize-space($textValue)">
            <field>
              <xsl:attribute name="name">
	        <xsl:choose>
                  <xsl:when test="@point = 'start'">
                    <xsl:value-of select="concat($prefix, $fieldName, '_', 'start', '_dt')"/>
                  </xsl:when>
                  <xsl:when test="@point = 'end'">
                    <xsl:value-of select="concat($prefix, $fieldName, '_', 'end', '_dt')"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="concat($prefix, $fieldName, '_dt')"/>
                  </xsl:otherwise>
                </xsl:choose>

              <!--  <xsl:value-of select="concat($prefix, $fieldName, '_dt')"/> -->
              </xsl:attribute>
              <xsl:value-of select="$textValue"/>
            </field>
          </xsl:if>
        </xsl:for-each>

    </xsl:template>

    <xsl:template match="m:dateCreated|m:dateIssued" mode="date_facet">
      <xsl:if test="string-length(normalize-space(text())) &gt; 0">
        <xsl:element name="field">
          <xsl:attribute name="name">mods_custom_date_facet_mdt</xsl:attribute>
          <xsl:call-template name="get_ISO8601_date">
            <xsl:with-param name="date" select="normalize-space(text())"/>
          </xsl:call-template>
       </xsl:element>
     </xsl:if>
    </xsl:template>

   <!-- This loops through the nodes and prints the values with a comma in front except the first.-->
   <xsl:template name="list_with_commas">
     <xsl:param name="list"/>
     <xsl:for-each select="exsl:node-set($list)/node()">
        <xsl:if test="string-length(text()|*) &gt; 0">
          <xsl:if test="position() &gt; 1">
            <xsl:text>, </xsl:text>
          </xsl:if>
          <xsl:value-of select="text()"/>
        </xsl:if>
      </xsl:for-each>
    </xsl:template>

    <xsl:template match="text()"/>

</xsl:stylesheet>
