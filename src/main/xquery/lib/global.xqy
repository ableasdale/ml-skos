xquery version "1.0-ml";

module namespace global="http://www.xmlmachines.com/global";
import module namespace common = "http://www.xmlmachines.com/common" at "/xquery/lib/common.xqy";

declare namespace skos="http://www.w3.org/2004/02/skos/core#";

declare default element namespace "http://www.w3.org/1999/xhtml";
declare default function namespace "http://www.w3.org/2005/xpath-functions";

declare variable $PAGE-SIZE as xs:integer := 15;
declare variable $PAGINATION-LISTSIZE as xs:integer := 10;

declare variable $DEBUG := xdmp:get-request-field("debug", "no"); 
(: declare variable $DEBUG := xdmp:get-request-field("debug", "yes"); :) 

(: Query matches all Top Level skos:Concepts in the database - matching all skos:Concepts that don't contain skos:broader definitions :)
declare function global:get-top-level-concepts-query() as cts:query {
    cts:not-query(( cts:element-query(xs:QName("skos:broader"), cts:and-query(()) ) )) 
};