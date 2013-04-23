xquery version "1.0-ml";

import module namespace common = "http://www.xmlmachines.com/common" at "/xquery/lib/common.xqy"; 
import module namespace mem = "http://xqdev.com/in-mem-update" at "/MarkLogic/appservices/utils/in-mem-update.xqy";

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

declare variable $guid as xs:string := common:guid();

declare variable $workflow as element(wf:workflow) := 
<wf:workflow>
        <dct:created>{fn:current-dateTime()}</dct:created>
        <dct:creator>{xdmp:get-current-user()}</dct:creator>
        <dct:modified>{fn:current-dateTime()}</dct:modified>
        <dct:modified-by>{xdmp:get-current-user()}</dct:modified-by>
        <dct:language>eng</dct:language>
    </wf:workflow>;

declare variable $master  := 
xdmp:document-get("file://C:/Users/Alex/Downloads/vocabularies-20091007/vocabularies-20091007/IVOAT/IVOAT.rdf",
  <options xmlns="xdmp:document-get" xmlns:http="xdmp:http">
           <format>xml</format>
  </options>
);

(:
count($master//skos:Concept) :)

for $i in ($master//skos:Concept)[1 to 10]
let $updated :=  mem:node-insert-child($i)
return xdmp:document-insert(concat($guid,".xml"), $updated) (: $updated) :)

(: xdmp:document-insert(common:guid(), $i) :)
