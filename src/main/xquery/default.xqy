xquery version "1.0-ml";

import module namespace global = "http://www.xmlmachines.com/global" at "/xquery/lib/global.xqy"; 
import module namespace common = "http://www.xmlmachines.com/common" at "/xquery/lib/common.xqy";

declare boundary-space preserve;

declare default function namespace "http://www.w3.org/2005/xpath-functions";
declare default element namespace "http://www.w3.org/1999/xhtml";
declare namespace skos="http://www.w3.org/2004/02/skos/core#";
declare namespace dct="http://purl.org/dc/terms/";

declare option xdmp:output "method=xhtml"; 
declare option xdmp:output "doctype-public=-//W3C//DTD XHTML 1.0 Strict//EN"; 
declare option xdmp:output "doctype-system=http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd";
declare option xdmp:output "omit-xml-declaration=yes";
declare option xdmp:output "indent=yes"; 
  
declare variable $title as xs:string := "SKOS Editor: Home";

declare function local:summary(){
    element div {attribute class {"span-24 last"},
        element fieldset {
            element legend {"Recently added/modified terms"},
            element ul {
                 (: TODO - make this a proper query :)
                for $i in doc()[1 to 25]
                order by $i//dct:modified descending
                return 
                element li {
                    element a {
                     attribute href {concat("/view/",fn:substring-before(xdmp:node-uri($i), "."))},
                     $i//skos:prefLabel/text() 
                    }
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
        if (xdmp:get-current-user() eq "nobody")
        then (common:login-form())
        else (
            local:summary(),
            common:html-page-footer()
        )
    }
)
 