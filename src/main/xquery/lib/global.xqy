xquery version "1.0-ml";

module namespace global="http://www.xmlmachines.com/global";
import module namespace common = "http://www.xmlmachines.com/common" at "/xquery/lib/common.xqy";

declare default element namespace "http://www.w3.org/1999/xhtml";
declare default function namespace "http://www.w3.org/2005/xpath-functions";

declare variable $DEBUG := xdmp:get-request-field("debug", "no"); 
(: declare variable $DEBUG := xdmp:get-request-field("debug", "yes"); :) 
