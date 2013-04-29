xquery version "1.0-ml";

import module namespace global = "http://www.xmlmachines.com/global" at "/xquery/lib/global.xqy"; 
import module namespace common = "http://www.xmlmachines.com/common" at "/xquery/lib/common.xqy";

declare default function namespace "http://www.w3.org/2005/xpath-functions";
declare default element namespace "http://www.w3.org/1999/xhtml";
declare namespace wf="http://www.xmlmachines.com/workflow/";
declare namespace skos="http://www.w3.org/2004/02/skos/core#";
declare namespace dct="http://purl.org/dc/terms/";

declare variable $pg as xs:integer := xs:integer(xdmp:get-request-field("p", "1"));
declare variable $pgsize as xs:integer := 20;
declare variable $start as xs:integer := if ($pg eq 1) then(1) else($pg * $pgsize - ($pgsize - 1));
declare variable $end as xs:integer := if ($pg eq 1) then($pgsize) else($start + ($pgsize - 1));

( 
let $_ := xdmp:log(text{"Page : ",$pg})
let $_ := xdmp:log(text{"Start : ",$start})
let $_ := xdmp:log(text{"End: ",$end})
let $range := for $concept in (/skos:Concept)   
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
    element td {cts:contains($i, global:get-top-level-concepts-query() ) },
    element td { element a {attribute href {concat("/update/", fn:substring-before(xdmp:node-uri($i), "."))}, "Edit ", $i/skos:prefLabel/string()}}
}


)