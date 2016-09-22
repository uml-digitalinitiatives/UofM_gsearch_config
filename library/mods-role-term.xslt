<?xml version="1.0" encoding="UTF-8"?>
<!-- Template to make the iso8601 date -->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:java="http://xml.apache.org/xalan/java"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  exclude-result-prefixes="xlink">

  <xsl:include href="library/xslt-string-functions.xslt"/>

  <xsl:template match="mods:roleTerm" mode="translate">
    <xsl:choose>
      <xsl:when test="normalize-space(text()) = 'act'">Actor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'adp'">Adapter</xsl:when>
      <xsl:when test="normalize-space(text()) = 'anl'">Analyst</xsl:when>
      <xsl:when test="normalize-space(text()) = 'anm'">Animator</xsl:when>
      <xsl:when test="normalize-space(text()) = 'ann'">Annotator</xsl:when>
      <xsl:when test="normalize-space(text()) = 'app'">Applicant</xsl:when>
      <xsl:when test="normalize-space(text()) = 'arc'">Architect</xsl:when>
      <xsl:when test="normalize-space(text()) = 'arr'">Arranger</xsl:when>
      <xsl:when test="normalize-space(text()) = 'acp'">Art copyist</xsl:when>
      <xsl:when test="normalize-space(text()) = 'art'">Artist</xsl:when>
      <xsl:when test="normalize-space(text()) = 'ard'">Artistic director</xsl:when>
      <xsl:when test="normalize-space(text()) = 'asg'">Assignee</xsl:when>
      <xsl:when test="normalize-space(text()) = 'asn'">Associated name</xsl:when>
      <xsl:when test="normalize-space(text()) = 'att'">Attributed name</xsl:when>
      <xsl:when test="normalize-space(text()) = 'auc'">Auctioneer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'aut'">Author</xsl:when>
      <xsl:when test="normalize-space(text()) = 'aqt'">Author in quotations or text extracts</xsl:when>
      <xsl:when test="normalize-space(text()) = 'aft'">Author of afterword, colophon, etc.</xsl:when>
      <xsl:when test="normalize-space(text()) = 'aud'">Author of dialog</xsl:when>
      <xsl:when test="normalize-space(text()) = 'aui'">Author of introduction, etc.</xsl:when>
      <xsl:when test="normalize-space(text()) = 'aus'">Author of screenplay, etc.</xsl:when>
      <xsl:when test="normalize-space(text()) = 'ant'">Bibliographic antecedent</xsl:when>
      <xsl:when test="normalize-space(text()) = 'bnd'">Binder</xsl:when>
      <xsl:when test="normalize-space(text()) = 'bdd'">Binding designer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'blw'">Blurb writer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'bkd'">Book designer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'bkp'">Book producer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'bjd'">Bookjacket designer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'bpd'">Bookplate designer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'bsl'">Bookseller</xsl:when>
      <xsl:when test="normalize-space(text()) = 'cll'">Calligrapher</xsl:when>
      <xsl:when test="normalize-space(text()) = 'ctg'">Cartographer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'cns'">Censor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'chr'">Choreographer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'cng'">Cinematographer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'cli'">Client</xsl:when>
      <xsl:when test="normalize-space(text()) = 'clb'">Collaborator</xsl:when>
      <xsl:when test="normalize-space(text()) = 'col'">Collector</xsl:when>
      <xsl:when test="normalize-space(text()) = 'clt'">Collotyper</xsl:when>
      <xsl:when test="normalize-space(text()) = 'clr'">Colorist</xsl:when>
      <xsl:when test="normalize-space(text()) = 'cmm'">Commentator</xsl:when>
      <xsl:when test="normalize-space(text()) = 'cwt'">Commentator for written text</xsl:when>
      <xsl:when test="normalize-space(text()) = 'com'">Compiler</xsl:when>
      <xsl:when test="normalize-space(text()) = 'cpl'">Complainant</xsl:when>
      <xsl:when test="normalize-space(text()) = 'cpt'">Complainant-appellant</xsl:when>
      <xsl:when test="normalize-space(text()) = 'cpe'">Complainant-appellee</xsl:when>
      <xsl:when test="normalize-space(text()) = 'cmp'">Composer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'cmt'">Compositor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'ccp'">Conceptor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'cnd'">Conductor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'con'">Conservator</xsl:when>
      <xsl:when test="normalize-space(text()) = 'csl'">Consultant</xsl:when>
      <xsl:when test="normalize-space(text()) = 'csp'">Consultant to a project</xsl:when>
      <xsl:when test="normalize-space(text()) = 'cos'">Contestant</xsl:when>
      <xsl:when test="normalize-space(text()) = 'cot'">Contestant-appellant</xsl:when>
      <xsl:when test="normalize-space(text()) = 'coe'">Contestant-appellee</xsl:when>
      <xsl:when test="normalize-space(text()) = 'cts'">Contestee</xsl:when>
      <xsl:when test="normalize-space(text()) = 'ctt'">Contestee-appellant</xsl:when>
      <xsl:when test="normalize-space(text()) = 'cte'">Contestee-appellee</xsl:when>
      <xsl:when test="normalize-space(text()) = 'ctr'">Contractor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'ctb'">Contributor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'cpc'">Copyright claimant</xsl:when>
      <xsl:when test="normalize-space(text()) = 'cph'">Copyright holder</xsl:when>
      <xsl:when test="normalize-space(text()) = 'crr'">Corrector</xsl:when>
      <xsl:when test="normalize-space(text()) = 'crp'">Correspondent</xsl:when>
      <xsl:when test="normalize-space(text()) = 'cst'">Costume designer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'cov'">Cover designer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'cre'">Creator</xsl:when>
      <xsl:when test="normalize-space(text()) = 'cur'">Curator of an exhibition</xsl:when>
      <xsl:when test="normalize-space(text()) = 'dnc'">Dancer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'dtc'">Data contributor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'dtm'">Data manager</xsl:when>
      <xsl:when test="normalize-space(text()) = 'dte'">Dedicatee</xsl:when>
      <xsl:when test="normalize-space(text()) = 'dto'">Dedicator</xsl:when>
      <xsl:when test="normalize-space(text()) = 'dfd'">Defendant</xsl:when>
      <xsl:when test="normalize-space(text()) = 'dft'">Defendant-appellant</xsl:when>
      <xsl:when test="normalize-space(text()) = 'dfe'">Defendant-appellee</xsl:when>
      <xsl:when test="normalize-space(text()) = 'dgg'">Degree grantor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'dln'">Delineator</xsl:when>
      <xsl:when test="normalize-space(text()) = 'dpc'">Depicted</xsl:when>
      <xsl:when test="normalize-space(text()) = 'dpt'">Depositor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'dsr'">Designer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'drt'">Director</xsl:when>
      <xsl:when test="normalize-space(text()) = 'dis'">Dissertant</xsl:when>
      <xsl:when test="normalize-space(text()) = 'dbp'">Distribution place</xsl:when>
      <xsl:when test="normalize-space(text()) = 'dst'">Distributor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'dnr'">Donor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'drm'">Draftsman</xsl:when>
      <xsl:when test="normalize-space(text()) = 'dub'">Dubious author</xsl:when>
      <xsl:when test="normalize-space(text()) = 'edt'">Editor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'elg'">Electrician</xsl:when>
      <xsl:when test="normalize-space(text()) = 'elt'">Electrotyper</xsl:when>
      <xsl:when test="normalize-space(text()) = 'eng'">Engineer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'egr'">Engraver</xsl:when>
      <xsl:when test="normalize-space(text()) = 'etr'">Etcher</xsl:when>
      <xsl:when test="normalize-space(text()) = 'evp'">Event place</xsl:when>
      <xsl:when test="normalize-space(text()) = 'exp'">Expert</xsl:when>
      <xsl:when test="normalize-space(text()) = 'fac'">Facsimilist</xsl:when>
      <xsl:when test="normalize-space(text()) = 'fld'">Field director</xsl:when>
      <xsl:when test="normalize-space(text()) = 'flm'">Film editor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'fpy'">First party</xsl:when>
      <xsl:when test="normalize-space(text()) = 'frg'">Forger</xsl:when>
      <xsl:when test="normalize-space(text()) = 'fmo'">Former owner</xsl:when>
      <xsl:when test="normalize-space(text()) = 'fnd'">Funder</xsl:when>
      <xsl:when test="normalize-space(text()) = 'gis'">Geographic information specialist</xsl:when>
      <xsl:when test="normalize-space(text()) = 'hnr'">Honoree</xsl:when>
      <xsl:when test="normalize-space(text()) = 'hst'">Host</xsl:when>
      <xsl:when test="normalize-space(text()) = 'ilu'">Illuminator</xsl:when>
      <xsl:when test="normalize-space(text()) = 'ill'">Illustrator</xsl:when>
      <xsl:when test="normalize-space(text()) = 'ins'">Inscriber</xsl:when>
      <xsl:when test="normalize-space(text()) = 'itr'">Instrumentalist</xsl:when>
      <xsl:when test="normalize-space(text()) = 'ive'">Interviewee</xsl:when>
      <xsl:when test="normalize-space(text()) = 'ivr'">Interviewer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'inv'">Inventor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'lbr'">Laboratory</xsl:when>
      <xsl:when test="normalize-space(text()) = 'ldr'">Laboratory director</xsl:when>
      <xsl:when test="normalize-space(text()) = 'led'">Lead</xsl:when>
      <xsl:when test="normalize-space(text()) = 'lsa'">Landscape architect</xsl:when>
      <xsl:when test="normalize-space(text()) = 'len'">Lender</xsl:when>
      <xsl:when test="normalize-space(text()) = 'lil'">Libelant</xsl:when>
      <xsl:when test="normalize-space(text()) = 'lit'">Libelant-appellant</xsl:when>
      <xsl:when test="normalize-space(text()) = 'lie'">Libelant-appellee</xsl:when>
      <xsl:when test="normalize-space(text()) = 'lel'">Libelee</xsl:when>
      <xsl:when test="normalize-space(text()) = 'let'">Libelee-appellant</xsl:when>
      <xsl:when test="normalize-space(text()) = 'lee'">Libelee-appellee</xsl:when>
      <xsl:when test="normalize-space(text()) = 'lbt'">Librettist</xsl:when>
      <xsl:when test="normalize-space(text()) = 'lse'">Licensee</xsl:when>
      <xsl:when test="normalize-space(text()) = 'lso'">Licensor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'lgd'">Lighting designer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'ltg'">Lithographer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'lyr'">Lyricist</xsl:when>
      <xsl:when test="normalize-space(text()) = 'mfr'">Manufacturer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'mrb'">Marbler</xsl:when>
      <xsl:when test="normalize-space(text()) = 'mrk'">Markup editor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'mdc'">Metadata contact</xsl:when>
      <xsl:when test="normalize-space(text()) = 'mte'">Metal-engraver</xsl:when>
      <xsl:when test="normalize-space(text()) = 'mod'">Moderator</xsl:when>
      <xsl:when test="normalize-space(text()) = 'mon'">Monitor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'mcp'">Music copyist</xsl:when>
      <xsl:when test="normalize-space(text()) = 'msd'">Musical director</xsl:when>
      <xsl:when test="normalize-space(text()) = 'mus'">Musician</xsl:when>
      <xsl:when test="normalize-space(text()) = 'nrt'">Narrator</xsl:when>
      <xsl:when test="normalize-space(text()) = 'opn'">Opponent</xsl:when>
      <xsl:when test="normalize-space(text()) = 'orm'">Organizer of meeting</xsl:when>
      <xsl:when test="normalize-space(text()) = 'org'">Originator</xsl:when>
      <xsl:when test="normalize-space(text()) = 'oth'">Other</xsl:when>
      <xsl:when test="normalize-space(text()) = 'own'">Owner</xsl:when>
      <xsl:when test="normalize-space(text()) = 'ppm'">Papermaker</xsl:when>
      <xsl:when test="normalize-space(text()) = 'pta'">Patent applicant</xsl:when>
      <xsl:when test="normalize-space(text()) = 'pth'">Patent holder</xsl:when>
      <xsl:when test="normalize-space(text()) = 'pat'">Patron</xsl:when>
      <xsl:when test="normalize-space(text()) = 'prf'">Performer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'pma'">Permitting agency</xsl:when>
      <xsl:when test="normalize-space(text()) = 'pht'">Photographer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'ptf'">Plaintiff</xsl:when>
      <xsl:when test="normalize-space(text()) = 'ptt'">Plaintiff-appellant</xsl:when>
      <xsl:when test="normalize-space(text()) = 'pte'">Plaintiff-appellee</xsl:when>
      <xsl:when test="normalize-space(text()) = 'plt'">Platemaker</xsl:when>
      <xsl:when test="normalize-space(text()) = 'prt'">Printer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'pop'">Printer of plates</xsl:when>
      <xsl:when test="normalize-space(text()) = 'prm'">Printmaker</xsl:when>
      <xsl:when test="normalize-space(text()) = 'prc'">Process contact</xsl:when>
      <xsl:when test="normalize-space(text()) = 'pro'">Producer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'pmm'">Production manager</xsl:when>
      <xsl:when test="normalize-space(text()) = 'prd'">Production personnel</xsl:when>
      <xsl:when test="normalize-space(text()) = 'prg'">Programmer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'pdr'">Project director</xsl:when>
      <xsl:when test="normalize-space(text()) = 'pfr'">Proofreader</xsl:when>
      <xsl:when test="normalize-space(text()) = 'pup'">Publication place</xsl:when>
      <xsl:when test="normalize-space(text()) = 'pbl'">Publisher</xsl:when>
      <xsl:when test="normalize-space(text()) = 'pbd'">Publishing director</xsl:when>
      <xsl:when test="normalize-space(text()) = 'ppt'">Puppeteer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'rcp'">Recipient</xsl:when>
      <xsl:when test="normalize-space(text()) = 'rce'">Recording engineer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'red'">Redactor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'ren'">Renderer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'rpt'">Reporter</xsl:when>
      <xsl:when test="normalize-space(text()) = 'rps'">Repository</xsl:when>
      <xsl:when test="normalize-space(text()) = 'rth'">Research team head</xsl:when>
      <xsl:when test="normalize-space(text()) = 'rtm'">Research team member</xsl:when>
      <xsl:when test="normalize-space(text()) = 'res'">Researcher</xsl:when>
      <xsl:when test="normalize-space(text()) = 'rsp'">Respondent</xsl:when>
      <xsl:when test="normalize-space(text()) = 'rst'">Respondent-appellant</xsl:when>
      <xsl:when test="normalize-space(text()) = 'rse'">Respondent-appellee</xsl:when>
      <xsl:when test="normalize-space(text()) = 'rpy'">Responsible party</xsl:when>
      <xsl:when test="normalize-space(text()) = 'rsg'">Restager</xsl:when>
      <xsl:when test="normalize-space(text()) = 'rev'">Reviewer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'rbr'">Rubricator</xsl:when>
      <xsl:when test="normalize-space(text()) = 'sce'">Scenarist</xsl:when>
      <xsl:when test="normalize-space(text()) = 'sad'">Scientific advisor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'scr'">Scribe</xsl:when>
      <xsl:when test="normalize-space(text()) = 'scl'">Sculptor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'spy'">Second party</xsl:when>
      <xsl:when test="normalize-space(text()) = 'sec'">Secretary</xsl:when>
      <xsl:when test="normalize-space(text()) = 'std'">Set designer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'sgn'">Signer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'sng'">Singer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'sds'">Sound designer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'spk'">Speaker</xsl:when>
      <xsl:when test="normalize-space(text()) = 'spn'">Sponsor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'stm'">Stage manager</xsl:when>
      <xsl:when test="normalize-space(text()) = 'stn'">Standards body</xsl:when>
      <xsl:when test="normalize-space(text()) = 'str'">Stereotyper</xsl:when>
      <xsl:when test="normalize-space(text()) = 'stl'">Storyteller</xsl:when>
      <xsl:when test="normalize-space(text()) = 'sht'">Supporting host</xsl:when>
      <xsl:when test="normalize-space(text()) = 'srv'">Surveyor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'tch'">Teacher</xsl:when>
      <xsl:when test="normalize-space(text()) = 'tcd'">Technical director</xsl:when>
      <xsl:when test="normalize-space(text()) = 'ths'">Thesis advisor</xsl:when>
      <xsl:when test="normalize-space(text()) = 'trc'">Transcriber</xsl:when>
      <xsl:when test="normalize-space(text()) = 'trl'">Translator</xsl:when>
      <xsl:when test="normalize-space(text()) = 'tyd'">Type designer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'tyg'">Typographer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'uvp'">University place</xsl:when>
      <xsl:when test="normalize-space(text()) = 'vdg'">Videographer</xsl:when>
      <xsl:when test="normalize-space(text()) = 'voc'">Vocalist</xsl:when>
      <xsl:when test="normalize-space(text()) = 'wit'">Witness</xsl:when>
      <xsl:when test="normalize-space(text()) = 'wde'">Wood-engraver</xsl:when>
      <xsl:when test="normalize-space(text()) = 'wdc'">Woodcutter</xsl:when>
      <xsl:when test="normalize-space(text()) = 'wam'">Writer of accompanying material</xsl:when>
      <xsl:when test="string-length(normalize-space(text())) = 0"><xsl:text></xsl:text></xsl:when>
      <xsl:otherwise>
        <!-- not a code, so we assume full text -->
        <xsl:text></xsl:text><xsl:call-template name="toProper"><xsl:with-param name="str" select="text()" /></xsl:call-template><xsl:text></xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>