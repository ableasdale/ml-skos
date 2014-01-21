xquery version "1.0-ml";

import module namespace sem = "http://marklogic.com/semantics" 
      at "/MarkLogic/semantics.xqy";


declare variable $rdf := <rdf:RDF 
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:skos="http://www.w3.org/2004/02/skos/core#">

  <skos:Concept rdf:about="http://www.alexandria.ucsb.edu/gazetteer/FeatureTypes/ver100301/#canals">
    <skos:definition>A feature type category for places such as the Erie Canal</skos:definition>
    <skos:prefLabel>canals</skos:prefLabel>
    <skos:altLabel>canal bends</skos:altLabel>
    <skos:altLabel>canalized streams</skos:altLabel>
    <skos:altLabel>ditch mouths</skos:altLabel>
    <skos:altLabel>ditches</skos:altLabel>
    <skos:altLabel>drainage canals</skos:altLabel>
    <skos:altLabel>drainage ditches</skos:altLabel>
    <skos:broader rdf:resource="http://www.alexandria.ucsb.edu/gazetteer/FeatureTypes/ver100301/#hydrographic%20structures"/>
    <skos:related rdf:resource="http://www.alexandria.ucsb.edu/gazetteer/FeatureTypes/ver100301/#channels"/>
    <skos:related rdf:resource="http://www.alexandria.ucsb.edu/gazetteer/FeatureTypes/ver100301/#locks"/>
    <skos:related rdf:resource="http://www.alexandria.ucsb.edu/gazetteer/FeatureTypes/ver100301/#transportation%20features"/>
    <skos:related rdf:resource="http://www.alexandria.ucsb.edu/gazetteer/FeatureTypes/ver100301/#tunnels"/>
    <skos:scopeNote>Manmade waterway used by watercraft or for drainage, irrigation, mining, or water power</skos:scopeNote>

    <dct:created xmlns:dct="http://purl.org/dc/terms/">2014-01-07T14:03:03.322Z</dct:created>
    <dct:creator xmlns:dct="http://purl.org/dc/terms/">admin</dct:creator>
    <dct:modified xmlns:dct="http://purl.org/dc/terms/">2014-01-07T14:03:03.322Z</dct:modified>
    <dct:modified-by xmlns:dct="http://purl.org/dc/terms/">admin</dct:modified-by>
    <dct:language xmlns:dct="http://purl.org/dc/terms/">eng</dct:language>

  </skos:Concept>
  
</rdf:RDF>;

sem:rdf-insert(sem:rdf-parse($rdf, "rdfxml"))
(: sem:rdf-parse($rdf) :)
