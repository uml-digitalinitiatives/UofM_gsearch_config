<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:pb="http://www.pbcore.org/PBCore/PBCoreNamespace.html"
    xmlns:foxml="info:fedora/fedora-system:def/foxml#" version="1.0"
    exclude-result-prefixes="pb">
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:include href="/usr/local/fedora/tomcat/webapps/fedoragsearch/WEB-INF/classes/fgsconfigFinal/index/gsearch_solr/islandora_transforms/library/xslt-string-functions.xslt"/>
    
    <xsl:template match="foxml:datastream[@ID='PBCORE']/foxml:datastreamVersion[last()]"
        name="index_PBCORE">
        <xsl:param name="content"/>
        <xsl:param name="prefix">pb_</xsl:param>
        <xsl:param name="suffix">_ms</xsl:param>
        <xsl:apply-templates select="$content/pb:pbcoreDescriptionDocument">
            <xsl:with-param name="prefix" select="$prefix"/>
            <xsl:with-param name="suffix" select="$suffix"/>
        </xsl:apply-templates>
    </xsl:template>



    <xsl:template match="pb:pbcoreDescriptionDocument">
        <xsl:param name="prefix"/>
        <xsl:param name="suffix"/>
        
        <xsl:for-each select="*[count(*) = 0]">
            <xsl:call-template name="field_auto">
                <xsl:with-param name="prefix" select="$prefix"/>
                <xsl:with-param name="suffix" select="$suffix"/>
            </xsl:call-template>
            
        </xsl:for-each>
        
        <xsl:for-each select="pb:pbcoreCoverage">
            <xsl:call-template name="field">
                <xsl:with-param name="name">
                    <xsl:value-of
                        select="concat($prefix, local-name(), '_', normalize-space(pb:coverageType/text()), $suffix)"
                    />
                </xsl:with-param>
                <xsl:with-param name="value">
                    <xsl:value-of select="pb:coverage"/>
                </xsl:with-param>
            </xsl:call-template>
            <!-- Custom facets -->
            <xsl:call-template name="field">
              <xsl:with-param name="name">
                <xsl:text>subject_</xsl:text><xsl:call-template name="toLower"><xsl:with-param name="str" select="normalize-space(pb:coverageType/text())"/></xsl:call-template><xsl:text>_mt</xsl:text>
              </xsl:with-param>
              <xsl:with-param name="value">
                <xsl:value-of select="pb:coverage"/>
              </xsl:with-param>
            </xsl:call-template>
            
            <xsl:call-template name="field">
              <xsl:with-param name="name">
                <xsl:text>subject_</xsl:text><xsl:call-template name="toLower"><xsl:with-param name="str" select="normalize-space(pb:coverageType/text())"/></xsl:call-template><xsl:text>_facet_ms</xsl:text>
              </xsl:with-param>
              <xsl:with-param name="value">
                <xsl:value-of select="pb:coverage"/>
              </xsl:with-param>
            </xsl:call-template>
            <!-- End Custom facets -->  
            
                
        </xsl:for-each>
        
        
        
        <xsl:call-template name="field">
            <xsl:with-param name="name">
                <xsl:value-of select="concat($prefix, 'pbcoreRightsSummary', $suffix)"/>
            </xsl:with-param>
            <xsl:with-param name="value">
                <xsl:value-of select="pb:pbcoreRightsSummary/pb:rightsSummary/text()"/>
            </xsl:with-param>
        </xsl:call-template>
        
        <!-- Custom facets -->
        <xsl:call-template name="field">
          <xsl:with-param name="name">
            <xsl:text>genre_mt</xsl:text>
          </xsl:with-param>
          <xsl:with-param name="value">
            <xsl:value-of select="pb:pbcoreGenre"/>
          </xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="field">
          <xsl:with-param name="name">
            <xsl:text>genre_facet_ms</xsl:text>
          </xsl:with-param>
          <xsl:with-param name="value">
            <xsl:value-of select="pb:pbcoreGenre"/>
          </xsl:with-param>
        </xsl:call-template>
        
        <!-- End Custom facets -->
        
        <xsl:apply-templates select="pb:pbcoreSubject" />
        <xsl:apply-templates select="pb:pbcoreCreator|pb:pbcoreContributor"/>
        
        <xsl:apply-templates select="pb:pbcoreInstantiation">
            <xsl:with-param name="prefix" select="$prefix"/>
            <xsl:with-param name="suffix" select="$suffix"/>
        </xsl:apply-templates>
        
    </xsl:template>
    
    <xsl:template match="pb:pbcoreInstantiation">
        <xsl:param name="prefix"/>
        <xsl:param name="suffix"/>
        
        <xsl:for-each select="*[count(*) = 0]">            
            <xsl:call-template name="field_auto">
                <xsl:with-param name="prefix" select="$prefix"/>
                <xsl:with-param name="suffix" select="$suffix"/>
            </xsl:call-template>
        </xsl:for-each>
        
        <xsl:call-template name="field">
            <xsl:with-param name="name"
                select="concat($prefix, 'instantiationRelationType', $suffix)"/>
            <xsl:with-param name="value"
                select="pb:instantiationRelation/pb:instantiationRelationType"
            />
        </xsl:call-template>
        
        <xsl:call-template name="field">
            <xsl:with-param name="name"
                select="concat($prefix, 'instantiationRelationIdentifier', $suffix)"/>
            <xsl:with-param name="value"
                select="pb:instantiationRelation/pb:instantiationRelationIdentifier"
            />
        </xsl:call-template>
        
        <xsl:call-template name="field">
            <xsl:with-param name="name" select="concat($prefix, 'instantiationRights', $suffix)"/>
            <xsl:with-param name="value"
                select="pb:instantiationRights/pb:rightsSummary"/>
        </xsl:call-template>
        
        <xsl:call-template name="field">
            <xsl:with-param name="name"
                select="concat($prefix, 'instantiationPart_instantiationIdentifier', $suffix)"/>
            <xsl:with-param name="value"
                select="pb:instantiationPart/pb:instantiationIdentifier"/>
        </xsl:call-template>
        <xsl:call-template name="field">
            <xsl:with-param name="name"
                select="concat($prefix, 'instantiationPart_instantiationLocation', $suffix)"/>
            <xsl:with-param name="value"
                select="pb:instantiationPart/pb:instantiationLocation"/>
        </xsl:call-template>
        
        <!-- Custom facets -->
        <xsl:call-template name="field">
          <xsl:with-param name="name">
            <xsl:text>language_mt</xsl:text>
          </xsl:with-param>
          <xsl:with-param name="value">
            <xsl:value-of select="pb:instantiationLanguage"/>
          </xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="field">
          <xsl:with-param name="name">
            <xsl:text>language_facet_ms</xsl:text>
          </xsl:with-param>
          <xsl:with-param name="value">
            <xsl:value-of select="pb:instantiationLanguage"/>
          </xsl:with-param>
        </xsl:call-template>
        
        <xsl:call-template name="field">
          <xsl:with-param name="name">
            <xsl:text>type_of_resource_mt</xsl:text>
          </xsl:with-param>
          <xsl:with-param name="value">
            <xsl:value-of select="pb:instantiationMediaType"/>
          </xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="field">
          <xsl:with-param name="name">
            <xsl:text>type_of_resource_facet_ms</xsl:text>
          </xsl:with-param>
          <xsl:with-param name="value">
            <xsl:value-of select="pb:instantiationMediaType"/>
          </xsl:with-param>
        </xsl:call-template>
        <!-- End Custom facets -->
    </xsl:template>
    
    <xsl:template name="field_auto">
        <xsl:param name="prefix"/>
        <xsl:param name="suffix"/>
        
        <xsl:variable name="att">
            <xsl:for-each select="@*">
                <xsl:value-of select="concat('_', name(), '_', .)"/>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:call-template name="field">
            <xsl:with-param name="name" select="concat($prefix, local-name(), $att, $suffix)"/>
            <xsl:with-param name="value" select="text()"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="field">
        <xsl:param name="name"/>
        <xsl:param name="value"/>
        <xsl:if test="not(normalize-space($value)) = ''">
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="translate($name, ' ', '_')"/>
                </xsl:attribute>
                <xsl:value-of select="normalize-space($value)"/>
            </field>
        </xsl:if>
    </xsl:template>

    <xsl:template match="pb:pbcoreSubject">
      <xsl:call-template name="field">
        <xsl:with-param name="name">
          <xsl:text>subject_mt</xsl:text>
        </xsl:with-param>
        <xsl:with-param name="value">
          <xsl:value-of select="."/>
        </xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="field">
        <xsl:with-param name="name">
          <xsl:text>subject_facet_ms</xsl:text>
        </xsl:with-param>
        <xsl:with-param name="value">
          <xsl:value-of select="."/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="pb:pbcoreCreator[translate(@creatorRole,'S','s')='subject']|pb:Contributor[translate(@contributorRole,'S','s')='subject']">
      <xsl:variable name="val">
        <xsl:choose>
          <xsl:when test="name() = 'pbcoreCreator'">
            <xsl:value-of select="creator"/>
          </xsl:when>
          <xsl:when test="name() = 'pbcoreContributor'">
            <xsl:value-of select="contributor"/>
          </xsl:when>
        </xsl:choose>
      </xsl:variable>
      <xsl:if test="string-length($val) &gt; 0">
        <xsl:call-template name="field">
          <xsl:with-param name="name">
            <xsl:text>subject_name_mt</xsl:text>
          </xsl:with-param>
          <xsl:with-param name="value">
            <xsl:value-of select="$val"/>
          </xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="field">
          <xsl:with-param name="name">
            <xsl:text>subject_facet_ms</xsl:text>
          </xsl:with-param>
          <xsl:with-param name="value">
            <xsl:value-of select="$val"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
    </xsl:template>

</xsl:stylesheet>

