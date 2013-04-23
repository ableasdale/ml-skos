xquery version "1.0-ml";

import module namespace global = "http://www.xmlmachines.com/global" at "/xquery/lib/global.xqy"; 
import module namespace common = "http://www.xmlmachines.com/common" at "/xquery/lib/common.xqy";

declare boundary-space preserve;

declare default function namespace "http://www.w3.org/2005/xpath-functions";
declare default element namespace "http://www.w3.org/1999/xhtml";
declare namespace wf="http://www.xmlmachines.com/workflow/";
declare namespace skos="http://www.w3.org/2004/02/skos/core#";
declare namespace dct="http://purl.org/dc/terms/";

declare option xdmp:output "method=xhtml"; 
declare option xdmp:output "doctype-public=-//W3C//DTD XHTML 1.0 Strict//EN"; 
declare option xdmp:output "doctype-system=http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd";
declare option xdmp:output "omit-xml-declaration=yes";
declare option xdmp:output "indent=yes"; 
  
declare variable $title as xs:string := "Home";

declare function local:summary(){
    element div {attribute class {"span-24 last"},
        element fieldset {
            element legend {"Recently Added / Modified Concepts:"},
            
            element table {
                element tr {
                    element th {"Concept Name"},
                    element th {"Added"},
                    element th {"Added by"},
                    element th {"Last Modified"},
                    element th {"Modified by"},
                    element th {"Update Concept"}
                },
                (: TODO - write a library like moment.js to display dates in a friendly format (e.g. "just now", "five minutes ago", "2 years ago") AND add classes for colouring based on age :)
                (: TODO - make this a proper query :)
                for $i in (/skos:Concept)
                order by $i//dct:modified descending
                return
                element tr {
                    element td { element a {attribute href {concat("/view/", fn:substring-before(xdmp:node-uri($i), "."))}, $i/skos:prefLabel/string()}},
                    element td { attribute class {"date"}, $i/wf:workflow/dct:created/string()},
                    element td {$i/wf:workflow/dct:creator/string()},
                    element td { attribute class {"date"}, $i/wf:workflow/dct:modified/string()},
                    element td {$i/wf:workflow/dct:modified-by/string()},
                    element td { element a {attribute href {concat("/update/", fn:substring-before(xdmp:node-uri($i), "."))}, "Edit ", $i/skos:prefLabel/string()}}
                }   
            
            }
        }
    }
};


(::::::::::::::::::::::::::)
(: Main Module Code below :)
(::::::::::::::::::::::::::)

common:build-page(
    element div {attribute class {"container"},
        common:html-page-header($title),
        common:check-entitlement-then-do(local:summary())
    }
)
 