<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:pb="http://www.pbcore.org/PBCore/PBCoreNamespace.html"
    xmlns:foxml="info:fedora/fedora-system:def/foxml#" version="1.0"
    exclude-result-prefixes="pb">
    
    <xsl:include href="xslt-string-functions.xslt"/>

    <!-- Translate an ISO 639-2 code to string -->
    <xsl:template match="pb:instantiationLanguage" mode="translate">
      <xsl:choose>
        <xsl:when test="normalize-space(text()) = 'aar'">Afar</xsl:when>
        <xsl:when test="normalize-space(text()) = 'abk'">Abkhazian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ace'">Achinese</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ach'">Acoli</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ada'">Adangme</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ady'">Adyghe; Adygei</xsl:when>
        <xsl:when test="normalize-space(text()) = 'afa'">Afro-Asiatic languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'afh'">Afrihili</xsl:when>
        <xsl:when test="normalize-space(text()) = 'afr'">Afrikaans</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ain'">Ainu</xsl:when>
        <xsl:when test="normalize-space(text()) = 'aka'">Akan</xsl:when>
        <xsl:when test="normalize-space(text()) = 'akk'">Akkadian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'alb'">Albanian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ale'">Aleut</xsl:when>
        <xsl:when test="normalize-space(text()) = 'alg'">Algonquian languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'alt'">Southern Altai</xsl:when>
        <xsl:when test="normalize-space(text()) = 'amh'">Amharic</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ang'">English, Old (ca.450-1100)</xsl:when>
        <xsl:when test="normalize-space(text()) = 'anp'">Angika</xsl:when>
        <xsl:when test="normalize-space(text()) = 'apa'">Apache languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ara'">Arabic</xsl:when>
        <xsl:when test="normalize-space(text()) = 'arc'">Official Aramaic (700-300 BCE); Imperial Aramaic (700-300 BCE)</xsl:when>
        <xsl:when test="normalize-space(text()) = 'arg'">Aragonese</xsl:when>
        <xsl:when test="normalize-space(text()) = 'arm'">Armenian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'arn'">Mapudungun; Mapuche</xsl:when>
        <xsl:when test="normalize-space(text()) = 'arp'">Arapaho</xsl:when>
        <xsl:when test="normalize-space(text()) = 'art'">Artificial languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'arw'">Arawak</xsl:when>
        <xsl:when test="normalize-space(text()) = 'asm'">Assamese</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ast'">Asturian; Bable; Leonese; Asturleonese</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ath'">Athapascan languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'aus'">Australian languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ava'">Avaric</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ave'">Avestan</xsl:when>
        <xsl:when test="normalize-space(text()) = 'awa'">Awadhi</xsl:when>
        <xsl:when test="normalize-space(text()) = 'aym'">Aymara</xsl:when>
        <xsl:when test="normalize-space(text()) = 'aze'">Azerbaijani</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bad'">Banda languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bai'">Bamileke languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bak'">Bashkir</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bal'">Baluchi</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bam'">Bambara</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ban'">Balinese</xsl:when>
        <xsl:when test="normalize-space(text()) = 'baq'">Basque</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bas'">Basa</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bat'">Baltic languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bej'">Beja; Bedawiyet</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bel'">Belarusian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bem'">Bemba</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ben'">Bengali</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ber'">Berber languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bho'">Bhojpuri</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bih'">Bihari languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bik'">Bikol</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bin'">Bini; Edo</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bis'">Bislama</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bla'">Siksika</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bnt'">Bantu languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bos'">Bosnian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bra'">Braj</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bre'">Breton</xsl:when>
        <xsl:when test="normalize-space(text()) = 'btk'">Batak languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bua'">Buriat</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bug'">Buginese</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bul'">Bulgarian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'bur'">Burmese</xsl:when>
        <xsl:when test="normalize-space(text()) = 'byn'">Blin; Bilin</xsl:when>
        <xsl:when test="normalize-space(text()) = 'cad'">Caddo</xsl:when>
        <xsl:when test="normalize-space(text()) = 'cai'">Central American Indian languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'car'">Galibi Carib</xsl:when>
        <xsl:when test="normalize-space(text()) = 'cat'">Catalan; Valencian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'cau'">Caucasian languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ceb'">Cebuano</xsl:when>
        <xsl:when test="normalize-space(text()) = 'cel'">Celtic languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'cze'">Czech</xsl:when>
        <xsl:when test="normalize-space(text()) = 'cha'">Chamorro</xsl:when>
        <xsl:when test="normalize-space(text()) = 'chb'">Chibcha</xsl:when>
        <xsl:when test="normalize-space(text()) = 'che'">Chechen</xsl:when>
        <xsl:when test="normalize-space(text()) = 'chg'">Chagatai</xsl:when>
        <xsl:when test="normalize-space(text()) = 'chi'">Chinese</xsl:when>
        <xsl:when test="normalize-space(text()) = 'chk'">Chuukese</xsl:when>
        <xsl:when test="normalize-space(text()) = 'chm'">Mari</xsl:when>
        <xsl:when test="normalize-space(text()) = 'chn'">Chinook jargon</xsl:when>
        <xsl:when test="normalize-space(text()) = 'cho'">Choctaw</xsl:when>
        <xsl:when test="normalize-space(text()) = 'chp'">Chipewyan; Dene Suline</xsl:when>
        <xsl:when test="normalize-space(text()) = 'chr'">Cherokee</xsl:when>
        <xsl:when test="normalize-space(text()) = 'chu'">Church Slavic</xsl:when>
        <xsl:when test="normalize-space(text()) = 'chv'">Chuvash</xsl:when>
        <xsl:when test="normalize-space(text()) = 'chy'">Cheyenne</xsl:when>
        <xsl:when test="normalize-space(text()) = 'cmc'">Chamic languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'cnr'">Montenegrin</xsl:when>
        <xsl:when test="normalize-space(text()) = 'cop'">Coptic</xsl:when>
        <xsl:when test="normalize-space(text()) = 'cor'">Cornish</xsl:when>
        <xsl:when test="normalize-space(text()) = 'cos'">Corsican</xsl:when>
        <xsl:when test="normalize-space(text()) = 'cpe'">Creoles and pidgins, English based</xsl:when>
        <xsl:when test="normalize-space(text()) = 'cpf'">Creoles and pidgins, French-based</xsl:when>
        <xsl:when test="normalize-space(text()) = 'cpp'">Creoles and pidgins, Portuguese-based</xsl:when>
        <xsl:when test="normalize-space(text()) = 'cre'">Cree</xsl:when>
        <xsl:when test="normalize-space(text()) = 'crh'">Crimean Tatar; Crimean Turkish</xsl:when>
        <xsl:when test="normalize-space(text()) = 'crp'">Creoles and pidgins</xsl:when>
        <xsl:when test="normalize-space(text()) = 'csb'">Kashubian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'cus'">Cushitic languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'cze'">Czech</xsl:when>
        <xsl:when test="normalize-space(text()) = 'dak'">Dakota</xsl:when>
        <xsl:when test="normalize-space(text()) = 'dan'">Danish</xsl:when>
        <xsl:when test="normalize-space(text()) = 'dar'">Dargwa</xsl:when>
        <xsl:when test="normalize-space(text()) = 'day'">Land Dayak languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'del'">Delaware</xsl:when>
        <xsl:when test="normalize-space(text()) = 'den'">Slave (Athapascan)</xsl:when>
        <xsl:when test="normalize-space(text()) = 'dgr'">Dogrib</xsl:when>
        <xsl:when test="normalize-space(text()) = 'din'">Dinka</xsl:when>
        <xsl:when test="normalize-space(text()) = 'div'">Divehi; Dhivehi; Maldivian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'doi'">Dogri</xsl:when>
        <xsl:when test="normalize-space(text()) = 'dra'">Dravidian languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'dsb'">Lower Sorbian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'dua'">Duala</xsl:when>
        <xsl:when test="normalize-space(text()) = 'dum'">Dutch, Middle (ca.1050-1350)</xsl:when>
        <xsl:when test="normalize-space(text()) = 'dut'">Dutch; Flemish</xsl:when>
        <xsl:when test="normalize-space(text()) = 'dyu'">Dyula</xsl:when>
        <xsl:when test="normalize-space(text()) = 'dzo'">Dzongkha</xsl:when>
        <xsl:when test="normalize-space(text()) = 'efi'">Efik</xsl:when>
        <xsl:when test="normalize-space(text()) = 'egy'">Egyptian (Ancient)</xsl:when>
        <xsl:when test="normalize-space(text()) = 'eka'">Ekajuk</xsl:when>
        <xsl:when test="normalize-space(text()) = 'elx'">Elamite</xsl:when>
        <xsl:when test="normalize-space(text()) = 'eng'">English</xsl:when>
        <xsl:when test="normalize-space(text()) = 'enm'">English, Middle (1100-1500)</xsl:when>
        <xsl:when test="normalize-space(text()) = 'epo'">Esperanto</xsl:when>
        <xsl:when test="normalize-space(text()) = 'est'">Estonian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'baq'">Basque</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ewe'">Ewe</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ewo'">Ewondo</xsl:when>
        <xsl:when test="normalize-space(text()) = 'fan'">Fang</xsl:when>
        <xsl:when test="normalize-space(text()) = 'fao'">Faroese</xsl:when>
        <xsl:when test="normalize-space(text()) = 'per'">Persian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'fat'">Fanti</xsl:when>
        <xsl:when test="normalize-space(text()) = 'fij'">Fijian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'fil'">Filipino; Pilipino</xsl:when>
        <xsl:when test="normalize-space(text()) = 'fin'">Finnish</xsl:when>
        <xsl:when test="normalize-space(text()) = 'fiu'">Finno-Ugrian languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'fon'">Fon</xsl:when>
        <xsl:when test="normalize-space(text()) = 'fre'">French</xsl:when>
        <xsl:when test="normalize-space(text()) = 'frm'">French, Middle (ca.1400-1600)</xsl:when>
        <xsl:when test="normalize-space(text()) = 'fro'">French, Old (842-ca.1400)</xsl:when>
        <xsl:when test="normalize-space(text()) = 'frr'">Northern Frisian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'frs'">Eastern Frisian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'fry'">Western Frisian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ful'">Fulah</xsl:when>
        <xsl:when test="normalize-space(text()) = 'fur'">Friulian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'gaa'">Ga</xsl:when>
        <xsl:when test="normalize-space(text()) = 'gay'">Gayo</xsl:when>
        <xsl:when test="normalize-space(text()) = 'gba'">Gbaya</xsl:when>
        <xsl:when test="normalize-space(text()) = 'gem'">Germanic languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'geo'">Georgian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ger'">German</xsl:when>
        <xsl:when test="normalize-space(text()) = 'gez'">Geez</xsl:when>
        <xsl:when test="normalize-space(text()) = 'gil'">Gilbertese</xsl:when>
        <xsl:when test="normalize-space(text()) = 'gla'">Gaelic; Scottish Gaelic</xsl:when>
        <xsl:when test="normalize-space(text()) = 'gle'">Irish</xsl:when>
        <xsl:when test="normalize-space(text()) = 'glg'">Galician</xsl:when>
        <xsl:when test="normalize-space(text()) = 'glv'">Manx</xsl:when>
        <xsl:when test="normalize-space(text()) = 'gmh'">German, Middle High (ca.1050-1500)</xsl:when>
        <xsl:when test="normalize-space(text()) = 'goh'">German, Old High (ca.750-1050)</xsl:when>
        <xsl:when test="normalize-space(text()) = 'gon'">Gondi</xsl:when>
        <xsl:when test="normalize-space(text()) = 'gor'">Gorontalo</xsl:when>
        <xsl:when test="normalize-space(text()) = 'got'">Gothic</xsl:when>
        <xsl:when test="normalize-space(text()) = 'grb'">Grebo</xsl:when>
        <xsl:when test="normalize-space(text()) = 'grc'">Greek, Ancient (to 1453)</xsl:when>
        <xsl:when test="normalize-space(text()) = 'gre'">Greek, Modern (1453-)</xsl:when>
        <xsl:when test="normalize-space(text()) = 'grn'">Guarani</xsl:when>
        <xsl:when test="normalize-space(text()) = 'gsw'">Swiss German; Alemannic; Alsatian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'guj'">Gujarati</xsl:when>
        <xsl:when test="normalize-space(text()) = 'gwi'">Gwich'in</xsl:when>
        <xsl:when test="normalize-space(text()) = 'hai'">Haida</xsl:when>
        <xsl:when test="normalize-space(text()) = 'hat'">Haitian; Haitian Creole</xsl:when>
        <xsl:when test="normalize-space(text()) = 'hau'">Hausa</xsl:when>
        <xsl:when test="normalize-space(text()) = 'haw'">Hawaiian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'heb'">Hebrew</xsl:when>
        <xsl:when test="normalize-space(text()) = 'her'">Herero</xsl:when>
        <xsl:when test="normalize-space(text()) = 'hil'">Hiligaynon</xsl:when>
        <xsl:when test="normalize-space(text()) = 'him'">Himachali languages; Western Pahari languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'hin'">Hindi</xsl:when>
        <xsl:when test="normalize-space(text()) = 'hit'">Hittite</xsl:when>
        <xsl:when test="normalize-space(text()) = 'hmn'">Hmong; Mong</xsl:when>
        <xsl:when test="normalize-space(text()) = 'hmo'">Hiri Motu</xsl:when>
        <xsl:when test="normalize-space(text()) = 'hrv'">Croatian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'hsb'">Upper Sorbian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'hun'">Hungarian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'hup'">Hupa</xsl:when>
        <xsl:when test="normalize-space(text()) = 'iba'">Iban</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ibo'">Igbo</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ice'">Icelandic</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ido'">Ido</xsl:when>
        <xsl:when test="normalize-space(text()) = 'iii'">Sichuan Yi; Nuosu</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ijo'">Ijo languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'iku'">Inuktitut</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ile'">Interlingue; Occidental</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ilo'">Iloko</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ina'">Interlingua (International Auxiliary Language Association)</xsl:when>
        <xsl:when test="normalize-space(text()) = 'inc'">Indic languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ind'">Indonesian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ine'">Indo-European languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'inh'">Ingush</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ipk'">Inupiaq</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ira'">Iranian languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'iro'">Iroquoian languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ita'">Italian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'jav'">Javanese</xsl:when>
        <xsl:when test="normalize-space(text()) = 'jbo'">Lojban</xsl:when>
        <xsl:when test="normalize-space(text()) = 'jpn'">Japanese</xsl:when>
        <xsl:when test="normalize-space(text()) = 'jpr'">Judeo-Persian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'jrb'">Judeo-Arabic</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kaa'">Kara-Kalpak</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kab'">Kabyle</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kac'">Kachin; Jingpho</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kal'">Kalaallisut; Greenlandic</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kam'">Kamba</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kan'">Kannada</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kar'">Karen languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kas'">Kashmiri</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kau'">Kanuri</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kaw'">Kawi</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kaz'">Kazakh</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kbd'">Kabardian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kha'">Khasi</xsl:when>
        <xsl:when test="normalize-space(text()) = 'khi'">Khoisan languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'khm'">Central Khmer</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kho'">Khotanese; Sakan</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kik'">Kikuyu; Gikuyu</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kin'">Kinyarwanda</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kir'">Kirghiz; Kyrgyz</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kmb'">Kimbundu</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kok'">Konkani</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kom'">Komi</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kon'">Kongo</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kor'">Korean</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kos'">Kosraean</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kpe'">Kpelle</xsl:when>
        <xsl:when test="normalize-space(text()) = 'krc'">Karachay-Balkar</xsl:when>
        <xsl:when test="normalize-space(text()) = 'krl'">Karelian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kro'">Kru languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kru'">Kurukh</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kua'">Kuanyama; Kwanyama</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kum'">Kumyk</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kur'">Kurdish</xsl:when>
        <xsl:when test="normalize-space(text()) = 'kut'">Kutenai</xsl:when>
        <xsl:when test="normalize-space(text()) = 'lad'">Ladino</xsl:when>
        <xsl:when test="normalize-space(text()) = 'lah'">Lahnda</xsl:when>
        <xsl:when test="normalize-space(text()) = 'lam'">Lamba</xsl:when>
        <xsl:when test="normalize-space(text()) = 'lao'">Lao</xsl:when>
        <xsl:when test="normalize-space(text()) = 'lat'">Latin</xsl:when>
        <xsl:when test="normalize-space(text()) = 'lav'">Latvian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'lez'">Lezghian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'lim'">Limburgan; Limburger; Limburgish</xsl:when>
        <xsl:when test="normalize-space(text()) = 'lin'">Lingala</xsl:when>
        <xsl:when test="normalize-space(text()) = 'lit'">Lithuanian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'lol'">Mongo</xsl:when>
        <xsl:when test="normalize-space(text()) = 'loz'">Lozi</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ltz'">Luxembourgish; Letzeburgesch</xsl:when>
        <xsl:when test="normalize-space(text()) = 'lua'">Luba-Lulua</xsl:when>
        <xsl:when test="normalize-space(text()) = 'lub'">Luba-Katanga</xsl:when>
        <xsl:when test="normalize-space(text()) = 'lug'">Ganda</xsl:when>
        <xsl:when test="normalize-space(text()) = 'lui'">Luiseno</xsl:when>
        <xsl:when test="normalize-space(text()) = 'lun'">Lunda</xsl:when>
        <xsl:when test="normalize-space(text()) = 'luo'">Luo (Kenya and Tanzania)</xsl:when>
        <xsl:when test="normalize-space(text()) = 'lus'">Lushai</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mac'">Macedonian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mad'">Madurese</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mag'">Magahi</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mah'">Marshallese</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mai'">Maithili</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mak'">Makasar</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mal'">Malayalam</xsl:when>
        <xsl:when test="normalize-space(text()) = 'man'">Mandingo</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mao'">Maori</xsl:when>
        <xsl:when test="normalize-space(text()) = 'map'">Austronesian languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mar'">Marathi</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mas'">Masai</xsl:when>
        <xsl:when test="normalize-space(text()) = 'may'">Malay</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mdf'">Moksha</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mdr'">Mandar</xsl:when>
        <xsl:when test="normalize-space(text()) = 'men'">Mende</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mga'">Irish, Middle (900-1200)</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mic'">Mi'kmaq; Micmac</xsl:when>
        <xsl:when test="normalize-space(text()) = 'min'">Minangkabau</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mis'">Uncoded languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mkh'">Mon-Khmer languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mlg'">Malagasy</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mlt'">Maltese</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mnc'">Manchu</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mni'">Manipuri</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mno'">Manobo languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'moh'">Mohawk</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mon'">Mongolian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mos'">Mossi</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mul'">Multiple languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mun'">Munda languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mus'">Creek</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mwl'">Mirandese</xsl:when>
        <xsl:when test="normalize-space(text()) = 'mwr'">Marwari</xsl:when>
        <xsl:when test="normalize-space(text()) = 'myn'">Mayan languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'myv'">Erzya</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nah'">Nahuatl languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nai'">North American Indian languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nap'">Neapolitan</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nau'">Nauru</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nav'">Navajo; Navaho</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nbl'">Ndebele, South; South Ndebele</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nde'">Ndebele, North; North Ndebele</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ndo'">Ndonga</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nds'">Low German; Low Saxon; German, Low; Saxon, Low</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nep'">Nepali</xsl:when>
        <xsl:when test="normalize-space(text()) = 'new'">Nepal Bhasa; Newari</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nia'">Nias</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nic'">Niger-Kordofanian languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'niu'">Niuean</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nno'">Norwegian Nynorsk; Nynorsk, Norwegian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nob'">Bokmål, Norwegian; Norwegian Bokmål</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nog'">Nogai</xsl:when>
        <xsl:when test="normalize-space(text()) = 'non'">Norse, Old</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nor'">Norwegian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nqo'">N'Ko</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nso'">Pedi; Sepedi; Northern Sotho</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nub'">Nubian languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nwc'">Classical Newari; Old Newari; Classical Nepal Bhasa</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nya'">Chichewa; Chewa; Nyanja</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nym'">Nyamwezi</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nyn'">Nyankole</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nyo'">Nyoro</xsl:when>
        <xsl:when test="normalize-space(text()) = 'nzi'">Nzima</xsl:when>
        <xsl:when test="normalize-space(text()) = 'oci'">Occitan (post 1500)</xsl:when>
        <xsl:when test="normalize-space(text()) = 'oji'">Ojibwa</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ori'">Oriya</xsl:when>
        <xsl:when test="normalize-space(text()) = 'orm'">Oromo</xsl:when>
        <xsl:when test="normalize-space(text()) = 'osa'">Osage</xsl:when>
        <xsl:when test="normalize-space(text()) = 'oss'">Ossetian; Ossetic</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ota'">Turkish, Ottoman (1500-1928)</xsl:when>
        <xsl:when test="normalize-space(text()) = 'oto'">Otomian languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'paa'">Papuan languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'pag'">Pangasinan</xsl:when>
        <xsl:when test="normalize-space(text()) = 'pal'">Pahlavi</xsl:when>
        <xsl:when test="normalize-space(text()) = 'pam'">Pampanga; Kapampangan</xsl:when>
        <xsl:when test="normalize-space(text()) = 'pan'">Panjabi; Punjabi</xsl:when>
        <xsl:when test="normalize-space(text()) = 'pap'">Papiamento</xsl:when>
        <xsl:when test="normalize-space(text()) = 'pau'">Palauan</xsl:when>
        <xsl:when test="normalize-space(text()) = 'peo'">Persian, Old (ca.600-400 B.C.)</xsl:when>
        <xsl:when test="normalize-space(text()) = 'per'">Persian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'phi'">Philippine languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'phn'">Phoenician</xsl:when>
        <xsl:when test="normalize-space(text()) = 'pli'">Pali</xsl:when>
        <xsl:when test="normalize-space(text()) = 'pol'">Polish</xsl:when>
        <xsl:when test="normalize-space(text()) = 'pon'">Pohnpeian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'por'">Portuguese</xsl:when>
        <xsl:when test="normalize-space(text()) = 'pra'">Prakrit languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'pro'">Provençal, Old (to 1500);Occitan, Old (to 1500)</xsl:when>
        <xsl:when test="normalize-space(text()) = 'pus'">Pushto; Pashto</xsl:when>
        <xsl:when test="normalize-space(text()) = 'que'">Quechua</xsl:when>
        <xsl:when test="normalize-space(text()) = 'raj'">Rajasthani</xsl:when>
        <xsl:when test="normalize-space(text()) = 'rap'">Rapanui</xsl:when>
        <xsl:when test="normalize-space(text()) = 'rar'">Rarotongan; Cook Islands Maori</xsl:when>
        <xsl:when test="normalize-space(text()) = 'roa'">Romance languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'roh'">Romansh</xsl:when>
        <xsl:when test="normalize-space(text()) = 'rom'">Romany</xsl:when>
        <xsl:when test="normalize-space(text()) = 'rum'">Romanian; Moldavian; Moldovan</xsl:when>
        <xsl:when test="normalize-space(text()) = 'run'">Rundi</xsl:when>
        <xsl:when test="normalize-space(text()) = 'rup'">Aromanian; Arumanian; Macedo-Romanian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'rus'">Russian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sad'">Sandawe</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sag'">Sango</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sah'">Yakut</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sai'">South American Indian languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sal'">Salishan languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sam'">Samaritan Aramaic</xsl:when>
        <xsl:when test="normalize-space(text()) = 'san'">Sanskrit</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sas'">Sasak</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sat'">Santali</xsl:when>
        <xsl:when test="normalize-space(text()) = 'scn'">Sicilian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sco'">Scots</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sel'">Selkup</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sem'">Semitic languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sga'">Irish, Old (to 900)</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sgn'">Sign Languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'shn'">Shan</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sid'">Sidamo</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sin'">Sinhala; Sinhalese</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sio'">Siouan languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sit'">Sino-Tibetan languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sla'">Slavic languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'slo'">Slovak</xsl:when>
        <xsl:when test="normalize-space(text()) = 'slv'">Slovenian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sma'">Southern Sami</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sme'">Northern Sami</xsl:when>
        <xsl:when test="normalize-space(text()) = 'smi'">Sami languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'smj'">Lule Sami</xsl:when>
        <xsl:when test="normalize-space(text()) = 'smn'">Inari Sami</xsl:when>
        <xsl:when test="normalize-space(text()) = 'smo'">Samoan</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sms'">Skolt Sami</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sna'">Shona</xsl:when>
        <xsl:when test="normalize-space(text()) = 'snd'">Sindhi</xsl:when>
        <xsl:when test="normalize-space(text()) = 'snk'">Soninke</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sog'">Sogdian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'som'">Somali</xsl:when>
        <xsl:when test="normalize-space(text()) = 'son'">Songhai languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sot'">Sotho, Southern</xsl:when>
        <xsl:when test="normalize-space(text()) = 'spa'">Spanish; Castilian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'srd'">Sardinian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'srn'">Sranan Tongo</xsl:when>
        <xsl:when test="normalize-space(text()) = 'srp'">Serbian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'srr'">Serer</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ssa'">Nilo-Saharan languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ssw'">Swati</xsl:when>
        <xsl:when test="normalize-space(text()) = 'suk'">Sukuma</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sun'">Sundanese</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sus'">Susu</xsl:when>
        <xsl:when test="normalize-space(text()) = 'sux'">Sumerian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'swa'">Swahili</xsl:when>
        <xsl:when test="normalize-space(text()) = 'swe'">Swedish</xsl:when>
        <xsl:when test="normalize-space(text()) = 'syc'">Classical Syriac</xsl:when>
        <xsl:when test="normalize-space(text()) = 'syr'">Syriac</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tah'">Tahitian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tai'">Tai languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tam'">Tamil</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tat'">Tatar</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tel'">Telugu</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tem'">Timne</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ter'">Tereno</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tet'">Tetum</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tgk'">Tajik</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tgl'">Tagalog</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tha'">Thai</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tib'">Tibetan</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tig'">Tigre</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tir'">Tigrinya</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tiv'">Tiv</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tkl'">Tokelau</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tlh'">Klingon; tlhIngan-Hol</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tli'">Tlingit</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tmh'">Tamashek</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tog'">Tonga (Nyasa)</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ton'">Tonga (Tonga Islands)</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tpi'">Tok Pisin</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tsi'">Tsimshian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tsn'">Tswana</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tso'">Tsonga</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tuk'">Turkmen</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tum'">Tumbuka</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tup'">Tupi languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tur'">Turkish</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tut'">Altaic languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tvl'">Tuvalu</xsl:when>
        <xsl:when test="normalize-space(text()) = 'twi'">Twi</xsl:when>
        <xsl:when test="normalize-space(text()) = 'tyv'">Tuvinian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'udm'">Udmurt</xsl:when>
        <xsl:when test="normalize-space(text()) = 'uga'">Ugaritic</xsl:when>
        <xsl:when test="normalize-space(text()) = 'uig'">Uighur; Uyghur</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ukr'">Ukrainian</xsl:when>
        <xsl:when test="normalize-space(text()) = 'umb'">Umbundu</xsl:when>
        <xsl:when test="normalize-space(text()) = 'und'">Undetermined</xsl:when>
        <xsl:when test="normalize-space(text()) = 'urd'">Urdu</xsl:when>
        <xsl:when test="normalize-space(text()) = 'uzb'">Uzbek</xsl:when>
        <xsl:when test="normalize-space(text()) = 'vai'">Vai</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ven'">Venda</xsl:when>
        <xsl:when test="normalize-space(text()) = 'vie'">Vietnamese</xsl:when>
        <xsl:when test="normalize-space(text()) = 'vol'">Volapük</xsl:when>
        <xsl:when test="normalize-space(text()) = 'vot'">Votic</xsl:when>
        <xsl:when test="normalize-space(text()) = 'wak'">Wakashan languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'wal'">Wolaitta; Wolaytta</xsl:when>
        <xsl:when test="normalize-space(text()) = 'war'">Waray</xsl:when>
        <xsl:when test="normalize-space(text()) = 'was'">Washo</xsl:when>
        <xsl:when test="normalize-space(text()) = 'wel'">Welsh</xsl:when>
        <xsl:when test="normalize-space(text()) = 'wen'">Sorbian languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'wln'">Walloon</xsl:when>
        <xsl:when test="normalize-space(text()) = 'wol'">Wolof</xsl:when>
        <xsl:when test="normalize-space(text()) = 'xal'">Kalmyk; Oirat</xsl:when>
        <xsl:when test="normalize-space(text()) = 'xho'">Xhosa</xsl:when>
        <xsl:when test="normalize-space(text()) = 'yao'">Yao</xsl:when>
        <xsl:when test="normalize-space(text()) = 'yap'">Yapese</xsl:when>
        <xsl:when test="normalize-space(text()) = 'yid'">Yiddish</xsl:when>
        <xsl:when test="normalize-space(text()) = 'yor'">Yoruba</xsl:when>
        <xsl:when test="normalize-space(text()) = 'ypk'">Yupik languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'zap'">Zapotec</xsl:when>
        <xsl:when test="normalize-space(text()) = 'zbl'">Blissymbols; Blissymbolics; Bliss</xsl:when>
        <xsl:when test="normalize-space(text()) = 'zen'">Zenaga</xsl:when>
        <xsl:when test="normalize-space(text()) = 'zgh'">Standard Moroccan Tamazight</xsl:when>
        <xsl:when test="normalize-space(text()) = 'zha'">Zhuang; Chuang</xsl:when>
        <xsl:when test="normalize-space(text()) = 'znd'">Zande languages</xsl:when>
        <xsl:when test="normalize-space(text()) = 'zul'">Zulu</xsl:when>
        <xsl:when test="normalize-space(text()) = 'zun'">Zuni</xsl:when>
        <xsl:when test="normalize-space(text()) = 'zxx'">No linguistic content; Not applicable</xsl:when>
        <xsl:when test="normalize-space(text()) = 'zza'">Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki</xsl:when>
        <xsl:otherwise>
          <!-- not a code, so we assume full text -->
          <xsl:text></xsl:text><xsl:call-template name="toProper"><xsl:with-param name="str" select="text()" /></xsl:call-template><xsl:text></xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:template>

</xsl:stylesheet>