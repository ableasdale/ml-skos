xquery version "1.0-ml";

import module namespace global = "http://www.xmlmachines.com/global" at "/xquery/lib/global.xqy"; 
import module namespace common = "http://www.xmlmachines.com/common" at "/xquery/lib/common.xqy";

declare default function namespace "http://www.w3.org/2005/xpath-functions";
declare default element namespace "http://www.w3.org/1999/xhtml";
declare namespace skos="http://www.w3.org/2008/05/skos/core#";
declare namespace dct="http://purl.org/dc/terms/";

declare variable $pg as xs:integer := xs:integer(xdmp:get-request-field("p", "1"));
declare variable $pgsize as xs:integer := $global:PAGE-SIZE;
declare variable $start as xs:integer := if ($pg eq 1) then(1) else($pg * $pgsize - ($pgsize - 1));
declare variable $end as xs:integer := if ($pg eq 1) then($pgsize) else($start + ($pgsize - 1));


let $range := sem:sparql('
  SELECT ?o
  WHERE {?s <http://www.w3.org/2008/05/skos#definition> ?o}
')
return 
for $i at $pos in $range[$start to $end]
return (
element tr {
    element td {$pos},
    element td { map:get($i, "o") }
    (:
    element td { element a {attribute href {concat("/view/", fn:substring-before(xdmp:node-uri($i), "."))}, $i }} 
    element td { attribute class {"date"}, $i/wf:workflow/dct:created/string()},
    element td {$i/wf:workflow/dct:creator/string()},
    element td { attribute class {"date"}, $i/wf:workflow/dct:modified/string()},
    element td {$i/wf:workflow/dct:modified-by/string()},
    element td {element a {attribute href {concat("/heirarchy/", fn:substring-before(xdmp:node-uri($i), "."))}, cts:contains($i, global:get-top-level-concepts-query()) }},
    element td { element a {attribute href {concat("/update/", fn:substring-before(xdmp:node-uri($i), "."))}, "Edit ", $i/skos:prefLabel/string()}} :)
})


(: OLD ML 6 Query ... 

(let $range := for $concept in (/skos:Concept)   
order by $concept/wf:workflow/dct:modified descending
return $concept

for $i in $range[$start to $end]
return
element tr {
    element td { element a {attribute href {concat("/view/", fn:substring-before(xdmp:node-uri($i), "."))}, $i/skos:prefLabel/string()}},
    element td { attribute class {"date"}, $i/wf:workflow/dct:created/string()},
    element td {$i/wf:workflow/dct:creator/string()},
    element td { attribute class {"date"}, $i/wf:workflow/dct:modified/string()},
    element td {$i/wf:workflow/dct:modified-by/string()},
    element td {element a {attribute href {concat("/heirarchy/", fn:substring-before(xdmp:node-uri($i), "."))}, cts:contains($i, global:get-top-level-concepts-query()) }},
    element td { element a {attribute href {concat("/update/", fn:substring-before(xdmp:node-uri($i), "."))}, "Edit ", $i/skos:prefLabel/string()}}
}) :)