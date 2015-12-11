<?xml version="1.0" encoding="UTF-8"?>
<!-- OCR glob into one field for indexing-->
<xsl:stylesheet version="1.0"
  xmlns:foxml="info:fedora/fedora-system:def/foxml#"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exts="xalan://dk.defxws.fedoragsearch.server.GenericOperationsImpl"
            exclude-result-prefixes="exts">

  <xsl:include href="plain-text.xslt"/>

  <xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>
  
  <xsl:variable name="DSID">OCR</xsl:variable>

</xsl:stylesheet>