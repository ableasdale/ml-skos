xquery version "1.0-ml";

import module namespace common = "http://www.xmlmachines.com/common" at "/xquery/lib/common.xqy"; 
import module namespace wikipedia-enrichment = "http://www.xmlmachines.com/wikipedia-enrichment" at "/xquery/lib/wikipedia-enrichment.xqy";

declare namespace skos="http://www.w3.org/2004/02/skos/core#";
declare namespace dct="http://purl.org/dc/terms/";
declare namespace rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#";
declare namespace rdfs="http://www.w3.org/2000/01/rdf-schema#";
declare namespace wf="http://www.xmlmachines.com/workflow/";

(:
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
	xmlns:dc="http://purl.org/dc/terms/"
	xmlns:foaf="http://xmlns.com/foaf/0.1/"
	xmlns:skos="http://www.w3.org/2004/02/skos/core#" :)

(: as element(rdf:RDF) :)

declare function local:workflow() as element(wf:workflow) {
  <wf:workflow>
        <dct:created>{fn:current-dateTime()}</dct:created>
        <dct:creator>{xdmp:get-current-user()}</dct:creator>
        <dct:modified>{fn:current-dateTime()}</dct:modified>
        <dct:modified-by>{xdmp:get-current-user()}</dct:modified-by>
        <dct:language>eng</dct:language>
    </wf:workflow>};

declare function local:get-node-at($i) as element(skos:Concept){
  $master//skos:Concept[$i]
};

declare variable $master  := 
xdmp:document-get("file://C:/Users/Alex/Downloads/vocabularies-20091007/vocabularies-20091007/IVOAT/IVOAT.rdf",
  <options xmlns="xdmp:document-get" xmlns:http="xdmp:http">
           <format>xml</format>
  </options>
);

for $i in ($master//skos:Concept)
return 
xdmp:document-insert(
concat(common:guid(),".xml"),
<skos:Concept>
  {for $item in $i/*
  let $item := if($item/@rdf:resource)
  then (element {fn:name($item)} {replace($item/@rdf:resource/data(),"#","")})
  else ($item)
  return $item,
  element skos:mappingRelation {wikipedia-enrichment:create-wikipedia-link($i/skos:prefLabel/text())},
  local:workflow()}
</skos:Concept>)