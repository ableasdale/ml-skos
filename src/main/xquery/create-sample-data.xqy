xquery version "1.0-ml";

(:~
 : Create Canned SKOS Example for insertion into the DB
 : Example taken from http://oclc.org/developer/documentation/terminology-services/skos-example
:)

declare variable $skos-example :=
<skos:Concept rdf:about="gsafd/GSAFD000042" xml:base="http://tspilot.oclc.org/" xmlns:dct="http://purl.org/dc/terms/" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
  <skos:inScheme rdf:resource="http://tspilot.oclc.org/gsafd"/>
  <dct:identifier>GSAFD000042</dct:identifier>
  <dct:identifier>(IlChALCS)GSAFD000042</dct:identifier>

  <dct:created rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">{fn:current-dateTime()}</dct:created>
  <dct:modified rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">{fn:current-dateTime()}</dct:modified>
  <dct:language rdf:datatype="http://purl.org/dc/terms/ISO639-2">eng</dct:language>
  <dct:type xml:lang="en">active</dct:type>
  <dct:type xml:lang="en">approved</dct:type>
  <dct:type xml:lang="en">form/genre</dct:type>

  <skos:prefLabel>Fantasy fiction</skos:prefLabel>
  <skos:altLabel>Apocalyptic fantasies</skos:altLabel>
  <skos:altLabel>End-of-the-world fantasies</skos:altLabel>
  <skos:altLabel>Fantastic fiction</skos:altLabel>
  <skos:altLabel>Fiction, Fantasy</skos:altLabel>
  <skos:altLabel>Time travel (Fiction)</skos:altLabel>

  <skos:hiddenLabel>fantasy fiction</skos:hiddenLabel>
  <skos:hiddenLabel>apocalyptic fantasies</skos:hiddenLabel>
  <skos:hiddenLabel>end of the world fantasies</skos:hiddenLabel>
  <skos:hiddenLabel>fantastic fiction</skos:hiddenLabel>
  <skos:hiddenLabel>fiction fantasy</skos:hiddenLabel>
  <skos:hiddenLabel>time travel fiction</skos:hiddenLabel>

  <skos:related>
    <skos:Concept rdf:about="gsafd/GSAFD000110">
      <rdfs:label>Science fiction</rdfs:label>
    </skos:Concept>
  </skos:related>
  <skos:narrower>
    <skos:Concept rdf:about="gsafd/GSAFD000006">
      <rdfs:label>Alternative histories (Fiction)</rdfs:label>

    </skos:Concept>
  </skos:narrower>
  <skos:narrower>
    <skos:Concept rdf:about="gsafd/GSAFD000029">
      <rdfs:label>Dystopias</rdfs:label>
    </skos:Concept>
  </skos:narrower>
  <skos:narrower>

    <skos:Concept rdf:about="gsafd/GSAFD000052">
      <rdfs:label>Ghost stories</rdfs:label>
    </skos:Concept>
  </skos:narrower>
  <skos:narrower>
    <skos:Concept rdf:about="gsafd/GSAFD000058">
      <rdfs:label>Horror fiction</rdfs:label>
    </skos:Concept>

  </skos:narrower>
  <skos:narrower>
    <skos:Concept rdf:about="gsafd/GSAFD000093">
      <rdfs:label>Occult fiction</rdfs:label>
    </skos:Concept>
  </skos:narrower>
  <skos:narrower>
    <skos:Concept rdf:about="gsafd/GSAFD000139">

      <rdfs:label>Utopian fiction</rdfs:label>
    </skos:Concept>
  </skos:narrower>
  <skos:narrower>
    <skos:Concept rdf:about="gsafd/GSAFD000143">
      <rdfs:label>Voyages, Imaginary</rdfs:label>
    </skos:Concept>
  </skos:narrower>

  <skos:closeMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047114">
      <rdfs:label>Fantasy fiction</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh85047114"/>
      <owl:sameAs rdf:resource="info:lccn/sh85047114"/>
    </skos:Concept>
  </skos:closeMatch>
  <skos:closeMatch>

    <skos:Concept rdf:about="http://tspilot.oclc.org/lcshac/sj2001010209">
      <rdfs:label>Fantasy</rdfs:label>
    </skos:Concept>
  </skos:closeMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh00003984">
      <rdfs:label>Fantasy fiction, Slovenian</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh00003984"/>

      <owl:sameAs rdf:resource="info:lccn/sh00003984"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh00004129">
      <rdfs:label>Fantasy fiction, Dominican</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh00004129"/>
      <owl:sameAs rdf:resource="info:lccn/sh00004129"/>

    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047117">
      <rdfs:label>Fantasy fiction, American</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh85047117"/>
      <owl:sameAs rdf:resource="info:lccn/sh85047117"/>
    </skos:Concept>

  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047119">
      <rdfs:label>Fantasy fiction, Argentine</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh85047119"/>
      <owl:sameAs rdf:resource="info:lccn/sh85047119"/>
    </skos:Concept>
  </skos:narrowMatch>

  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047120">
      <rdfs:label>Fantasy fiction, Bulgarian</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh85047120"/>
      <owl:sameAs rdf:resource="info:lccn/sh85047120"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>

    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047121">
      <rdfs:label>Fantasy fiction, Canadian</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh85047121"/>
      <owl:sameAs rdf:resource="info:lccn/sh85047121"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047122">

      <rdfs:label>Fantasy fiction, Chinese</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh85047122"/>
      <owl:sameAs rdf:resource="info:lccn/sh85047122"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047123">
      <rdfs:label>Fantasy fiction, Croatian</rdfs:label>

      <owl:sameAs rdf:resource="info:lc/authorities/sh85047123"/>
      <owl:sameAs rdf:resource="info:lccn/sh85047123"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047124">
      <rdfs:label>Fantasy fiction, Dutch</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh85047124"/>

      <owl:sameAs rdf:resource="info:lccn/sh85047124"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047125">
      <rdfs:label>Fantasy fiction, English</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh85047125"/>
      <owl:sameAs rdf:resource="info:lccn/sh85047125"/>

    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047126">
      <rdfs:label>Fantasy fiction, French</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh85047126"/>
      <owl:sameAs rdf:resource="info:lccn/sh85047126"/>
    </skos:Concept>

  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047127">
      <rdfs:label>Fantasy fiction, French-Canadian</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh85047127"/>
      <owl:sameAs rdf:resource="info:lccn/sh85047127"/>
    </skos:Concept>
  </skos:narrowMatch>

  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047128">
      <rdfs:label>Fantasy fiction, German</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh85047128"/>
      <owl:sameAs rdf:resource="info:lccn/sh85047128"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>

    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047129">
      <rdfs:label>Fantasy fiction, Italian</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh85047129"/>
      <owl:sameAs rdf:resource="info:lccn/sh85047129"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047130">

      <rdfs:label>Fantasy fiction, Japanese</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh85047130"/>
      <owl:sameAs rdf:resource="info:lccn/sh85047130"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047131">
      <rdfs:label>Fantasy fiction, Latin American</rdfs:label>

      <owl:sameAs rdf:resource="info:lc/authorities/sh85047131"/>
      <owl:sameAs rdf:resource="info:lccn/sh85047131"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047132">
      <rdfs:label>Fantasy fiction, Macedonian</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh85047132"/>

      <owl:sameAs rdf:resource="info:lccn/sh85047132"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047133">
      <rdfs:label>Fantasy fiction, Mexican</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh85047133"/>
      <owl:sameAs rdf:resource="info:lccn/sh85047133"/>

    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047134">
      <rdfs:label>Fantasy fiction, Norwegian</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh85047134"/>
      <owl:sameAs rdf:resource="info:lccn/sh85047134"/>
    </skos:Concept>

  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047135">
      <rdfs:label>Fantasy fiction, Panamanian</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh85047135"/>
      <owl:sameAs rdf:resource="info:lccn/sh85047135"/>
    </skos:Concept>
  </skos:narrowMatch>

  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047136">
      <rdfs:label>Fantasy fiction, Polish</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh85047136"/>
      <owl:sameAs rdf:resource="info:lccn/sh85047136"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>

    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047137">
      <rdfs:label>Fantasy fiction, Romanian</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh85047137"/>
      <owl:sameAs rdf:resource="info:lccn/sh85047137"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047138">

      <rdfs:label>Fantasy fiction, Russian</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh85047138"/>
      <owl:sameAs rdf:resource="info:lccn/sh85047138"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047139">
      <rdfs:label>Fantasy fiction, Spanish American</rdfs:label>

      <owl:sameAs rdf:resource="info:lc/authorities/sh85047139"/>
      <owl:sameAs rdf:resource="info:lccn/sh85047139"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047140">
      <rdfs:label>Fantasy fiction, Yiddish</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh85047140"/>

      <owl:sameAs rdf:resource="info:lccn/sh85047140"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh85047141">
      <rdfs:label>Fantasy fiction, Yugoslav</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh85047141"/>
      <owl:sameAs rdf:resource="info:lccn/sh85047141"/>

    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh87001685">
      <rdfs:label>Fantasy fiction, Indic (English)</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh87001685"/>
      <owl:sameAs rdf:resource="info:lccn/sh87001685"/>
    </skos:Concept>

  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh88001867">
      <rdfs:label>Fantasy fiction, Spanish</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh88001867"/>
      <owl:sameAs rdf:resource="info:lccn/sh88001867"/>
    </skos:Concept>
  </skos:narrowMatch>

  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh88005661">
      <rdfs:label>Fantasy fiction, Ukrainian</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh88005661"/>
      <owl:sameAs rdf:resource="info:lccn/sh88005661"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>

    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh88007558">
      <rdfs:label>Fantasy fiction, Portuguese</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh88007558"/>
      <owl:sameAs rdf:resource="info:lccn/sh88007558"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh89000869">

      <rdfs:label>Fantasy fiction, Hebrew</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh89000869"/>
      <owl:sameAs rdf:resource="info:lccn/sh89000869"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh89002682">
      <rdfs:label>Fantasy fiction, Martinique (French)</rdfs:label>

      <owl:sameAs rdf:resource="info:lc/authorities/sh89002682"/>
      <owl:sameAs rdf:resource="info:lccn/sh89002682"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh89004128">
      <rdfs:label>Fantasy fiction, Flemish</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh89004128"/>

      <owl:sameAs rdf:resource="info:lccn/sh89004128"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh89005381">
      <rdfs:label>Fantasy fiction, Chilean</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh89005381"/>
      <owl:sameAs rdf:resource="info:lccn/sh89005381"/>

    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh89006315">
      <rdfs:label>Fantasy fiction, Venezuelan</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh89006315"/>
      <owl:sameAs rdf:resource="info:lccn/sh89006315"/>
    </skos:Concept>

  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh89006338">
      <rdfs:label>Fantasy fiction, Peruvian</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh89006338"/>
      <owl:sameAs rdf:resource="info:lccn/sh89006338"/>
    </skos:Concept>
  </skos:narrowMatch>

  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh89006361">
      <rdfs:label>Fantasy fiction, Belgian (French)</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh89006361"/>
      <owl:sameAs rdf:resource="info:lccn/sh89006361"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>

    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh89007184">
      <rdfs:label>Fantasy fiction, Austrian</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh89007184"/>
      <owl:sameAs rdf:resource="info:lccn/sh89007184"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh90002396">

      <rdfs:label>Fantasy fiction, Israeli</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh90002396"/>
      <owl:sameAs rdf:resource="info:lccn/sh90002396"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh91000374">
      <rdfs:label>Fantasy fiction, Danish</rdfs:label>

      <owl:sameAs rdf:resource="info:lc/authorities/sh91000374"/>
      <owl:sameAs rdf:resource="info:lccn/sh91000374"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh92001205">
      <rdfs:label>Fantasy fiction, Australian</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh92001205"/>

      <owl:sameAs rdf:resource="info:lccn/sh92001205"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh93001830">
      <rdfs:label>Fantasy fiction, Uruguayan</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh93001830"/>
      <owl:sameAs rdf:resource="info:lccn/sh93001830"/>

    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh93008241">
      <rdfs:label>Fantasy fiction, Serbian</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh93008241"/>
      <owl:sameAs rdf:resource="info:lccn/sh93008241"/>
    </skos:Concept>

  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh94004792">
      <rdfs:label>Fantasy fiction, Brazilian</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh94004792"/>
      <owl:sameAs rdf:resource="info:lccn/sh94004792"/>
    </skos:Concept>
  </skos:narrowMatch>

  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh95003740">
      <rdfs:label>Fantasy fiction, Swedish</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh95003740"/>
      <owl:sameAs rdf:resource="info:lccn/sh95003740"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>

    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh96004043">
      <rdfs:label>Fantasy fiction, New Zealand</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh96004043"/>
      <owl:sameAs rdf:resource="info:lccn/sh96004043"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh96008694">

      <rdfs:label>Fantasy fiction, Greek (Modern)</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh96008694"/>
      <owl:sameAs rdf:resource="info:lccn/sh96008694"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh96010101">
      <rdfs:label>Fantasy fiction, Czech</rdfs:label>

      <owl:sameAs rdf:resource="info:lc/authorities/sh96010101"/>
      <owl:sameAs rdf:resource="info:lccn/sh96010101"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh97000448">
      <rdfs:label>Fantasy fiction, Uzbek</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh97000448"/>

      <owl:sameAs rdf:resource="info:lccn/sh97000448"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh98001778">
      <rdfs:label>Fantasy fiction, Belarusian</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh98001778"/>
      <owl:sameAs rdf:resource="info:lccn/sh98001778"/>

    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh98004306">
      <rdfs:label>Fantasy fiction, Galician</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh98004306"/>
      <owl:sameAs rdf:resource="info:lccn/sh98004306"/>
    </skos:Concept>

  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh99001346">
      <rdfs:label>Fantasy fiction, Cuban</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh99001346"/>
      <owl:sameAs rdf:resource="info:lccn/sh99001346"/>
    </skos:Concept>
  </skos:narrowMatch>

  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh99002757">
      <rdfs:label>Fantasy fiction, Puerto Rican</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh99002757"/>
      <owl:sameAs rdf:resource="info:lccn/sh99002757"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>

    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh99003667">
      <rdfs:label>Fantasy fiction, Nicaraguan</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh99003667"/>
      <owl:sameAs rdf:resource="info:lccn/sh99003667"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh99014172">

      <rdfs:label>Fantasy fiction, Korean</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh99014172"/>
      <owl:sameAs rdf:resource="info:lccn/sh99014172"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh2001003555">
      <rdfs:label>Fantasy fiction, Vietnamese</rdfs:label>

      <owl:sameAs rdf:resource="info:lc/authorities/sh2001003555"/>
      <owl:sameAs rdf:resource="info:lccn/sh2001003555"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh2002006788">
      <rdfs:label>Fantasy fiction, Lithuanian</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh2002006788"/>

      <owl:sameAs rdf:resource="info:lccn/sh2002006788"/>
    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh2005005493">
      <rdfs:label>Fantasy fiction, Honduran</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh2005005493"/>
      <owl:sameAs rdf:resource="info:lccn/sh2005005493"/>

    </skos:Concept>
  </skos:narrowMatch>
  <skos:narrowMatch>
    <skos:Concept rdf:about="http://tspilot.oclc.org/lcsh/sh2005006836">
      <rdfs:label>Fantasy fiction, Catalan</rdfs:label>
      <owl:sameAs rdf:resource="info:lc/authorities/sh2005006836"/>
      <owl:sameAs rdf:resource="info:lccn/sh2005006836"/>
    </skos:Concept>

  </skos:narrowMatch>
  <skos:scopeNote xml:lang="en">Use for works that feature imaginary worlds, extraordinary creatures, sorcerers, epic quests or magic.</skos:scopeNote>
  <skos:note rdf:parseType="Resource">
    <dct:type xml:lang="en">other resource location</dct:type>
    <dct:references rdf:resource="http://worldcat.org/search?q=su%3AFantasy%20fiction"/>
    <rdf:value xml:lang="en">Search WorldCat &lt;http://worldcat.org/search?q=su%3AFantasy%20fiction&gt; [application/xhtml+xml]</rdf:value>

  </skos:note>
  <skos:note rdf:parseType="Resource">
    <dct:type xml:lang="en">other resource location</dct:type>
    <dct:references rdf:resource="http://books.google.com/books?ie=UTF-8&amp;oe=UTF-8&amp;q=Fantasy%20fiction"/>
    <rdf:value xml:lang="en">Search Google Books &lt;http://books.google.com/books?ie=UTF-8&amp;oe=UTF-8&amp;q=Fantasy%20fiction&gt; [text/html]</rdf:value>

  </skos:note>
  <skos:note rdf:parseType="Resource">
    <dct:type xml:lang="en">other resource location</dct:type>
    <dct:references rdf:resource="http://scholar.google.com/scholar?ie=UTF-8&amp;oe=UTF-8&amp;q=Fantasy%20fiction"/>
    <rdf:value xml:lang="en">Search Google Scholar &lt;http://scholar.google.com/scholar?ie=UTF-8&amp;oe=UTF-8&amp;q=Fantasy%20fiction&gt; [text/html]</rdf:value>

  </skos:note>
  <skos:note rdf:parseType="Resource">
    <dct:type xml:lang="en">other resource location</dct:type>
    <dct:references rdf:resource="http://tspilot.oclc.org/gsafd/GSAFD000042.html"/>
    <rdf:value xml:lang="en">OCLC Research Terminology Services concept description document. &lt;http://tspilot.oclc.org/gsafd/GSAFD000042.html&gt; [application/xhtml+xml]</rdf:value>
  </skos:note>

  <skos:note rdf:parseType="Resource">
    <dct:type xml:lang="en">other resource location</dct:type>
    <dct:references rdf:resource="http://tspilot.oclc.org/gsafd.html"/>
    <rdf:value xml:lang="en">OCLC Research Terminology Services vocabulary description document. &lt;http://tspilot.oclc.org/gsafd.html&gt; [application/xhtml+xml]</rdf:value>
  </skos:note>
  <skos:note rdf:parseType="Resource">

    <dct:type xml:lang="en">rights</dct:type>
    <dct:references rdf:resource="http://www.oclc.org/research/researchworks/terms.htm"/>
    <rdf:value xml:lang="en">Use of this resource is governed by the OCLC ResearchWorks terms of use. &lt;http://www.oclc.org/research/researchworks/terms.htm&gt; [text/html]</rdf:value>
  </skos:note>
  <dct:license rdf:resource="http://www.oclc.org/research/researchworks/terms.htm"/>
  <skos:changeNote xml:lang="en">Cataloged by agency: IlChALCS</skos:changeNote>

  <skos:changeNote xml:lang="en">Transcribed by agency: IEN</skos:changeNote>
  <skos:changeNote xml:lang="en">Modified by agency: OCoLC-O</skos:changeNote>
  <dct:source rdf:resource="gsafd/GSAFD000042"/>
  <dct:conformsTo rdf:resource="http://www.w3.org/TR/2009/REC-skos-reference-20090818/"/>
</skos:Concept>;

declare private function local:random-hex($seq as xs:integer*) as xs:string+ {
  for $i in $seq return 
    fn:string-join(for $n in 1 to $i
      return xdmp:integer-to-hex(xdmp:random(15)), "")
};

declare function local:guid() as xs:string {
  fn:string-join(local:random-hex((8,4,4,4,12)),"-")
};

xdmp:document-insert(concat(local:guid(),".xml"), $skos-example)
