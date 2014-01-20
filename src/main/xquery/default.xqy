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
            element legend {"Recently Added / Modified Concept[s]:"},
            element p {element strong {attribute id {"total"}, attribute class {"quiet"}, xdmp:estimate(/skos:Concept)}, " Concept(s) defined. ", element strong {attribute class {"quiet"}, xdmp:estimate(cts:search(/skos:Concept, global:get-top-level-concepts-query()) )}, " top-level skos:Concept(s)" },
            element p {"A total of: ", fn:count( cts:triples() ), " triples currently in the database"},
            element table { attribute id {"recent-concepts-table"},
                element thead {
                    element tr {
                        element th {"Concept Name"},
                        element th {"Added"},
                        element th {"Added by"},
                        element th {"Last Modified"},
                        element th {"Modified by"},
                        element th {"Top Level"},
                        element th {"Update Concept"}
                    }
                },
                element tbody {
                    element tr {
                        element td {attribute colspan {"6"}, "Loading.."}
                    }
                }
            },
                
            <div class="pagination">
                <a href="#" class="first" data-action="first">&laquo;</a>
                <a href="#" class="previous" data-action="previous">&lsaquo;</a>
                <input type="text" readonly="readonly" data-max-page="40" />
                <input type="hidden" id="page-size" value="{$global:PAGE-SIZE}"/>
                <a href="#" class="next" data-action="next">&rsaquo;</a>
                <a href="#" class="last" data-action="last">&raquo;</a>
            </div>
            
        }
    }
};


declare function local:summary-ml6(){
    element div {attribute class {"span-24 last"},
        element fieldset {
            element legend {"Recently Added / Modified Concepts:"},
            element p {element strong {attribute id {"total"}, attribute class {"quiet"}, xdmp:estimate(/skos:Concept)}, " Concept(s) defined. ", element strong {attribute class {"quiet"}, xdmp:estimate(cts:search(/skos:Concept, global:get-top-level-concepts-query()) )}, " top-level skos:Concept(s)" },
            element table { attribute id {"recent-concepts-table"},
                element thead {
                    element tr {
                        element th {"Concept Name"},
                        element th {"Added"},
                        element th {"Added by"},
                        element th {"Last Modified"},
                        element th {"Modified by"},
                        element th {"Top Level"},
                        element th {"Update Concept"}
                    }
                },
                element tbody {
                    element tr {
                        element td {attribute colspan {"6"}, "Loading.."}
                    }
                }
            },
                
            <div class="pagination">
                <a href="#" class="first" data-action="first">&laquo;</a>
                <a href="#" class="previous" data-action="previous">&lsaquo;</a>
                <input type="text" readonly="readonly" data-max-page="40" />
                <input type="hidden" id="page-size" value="{$global:PAGE-SIZE}"/>
                <a href="#" class="next" data-action="next">&rsaquo;</a>
                <a href="#" class="last" data-action="last">&raquo;</a>
            </div>
            
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
 