xquery version "1.0-ml";

import module namespace global = "http://www.xmlmachines.com/global" at "/xquery/lib/global.xqy"; 

declare variable $doc := xdmp:get-request-body()/node();
declare variable $guid as xs:string := global:guid();
(: TODO - response content type was "text/html" - not sure what benefit this has for xsltforms? :)
( xdmp:log("Hit the submission endpoint"), xdmp:document-insert(concat($guid,".xml"), $doc), xdmp:set-response-content-type("application/xml"), concat("<p><strong>saved: ", $guid," ... </strong></p>"))
