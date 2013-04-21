xquery version "1.0-ml";

import module namespace common = "http://www.xmlmachines.com/common" at "/xquery/lib/common.xqy"; 
import module namespace mem = "http://xqdev.com/in-mem-update" at "/MarkLogic/appservices/utils/in-mem-update.xqy";

declare boundary-space preserve;

declare default function namespace "http://www.w3.org/2005/xpath-functions";
declare namespace wf="http://www.xmlmachines.com/workflow/";
declare namespace skos="http://www.w3.org/2004/02/skos/core#";
declare namespace dct="http://purl.org/dc/terms/";
declare namespace rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#";

declare variable $doc as element(skos:Concept) := xdmp:get-request-body()/node();
declare variable $guid as xs:string := common:guid();

(: TODO - ensure user is logged in to use this service! :)
(: TODO - language currently hard-coded :)

declare variable $workflow as element(wf:workflow) := 
<wf:workflow>
        <dct:created>{fn:current-dateTime()}</dct:created>
        <dct:creator>{xdmp:get-current-user()}</dct:creator>
        <dct:modified>{fn:current-dateTime()}</dct:modified>
        <dct:modified-by>{xdmp:get-current-user()}</dct:modified-by>
        <dct:language>eng</dct:language>
    </wf:workflow>;

let $updated := mem:node-replace($doc//wf:workflow, $workflow)
return

(: TODO - response content type was "text/html" - not sure what benefit this has for xsltforms? :) 
(
    xdmp:document-insert(concat($guid,".xml"), $updated),  
    xdmp:set-response-content-type("text/html"),
    xdmp:set-session-field("message", concat("The concept: ~",$doc//skos:prefLabel/text(),"~ was created by: ~",xdmp:get-current-user(),"~",$guid))
)
(: (xdmp:document-insert(concat($guid,".xml"), $updated), xdmp:set-response-content-type("application/xml"), concat("<p><strong>saved: ", $guid," ... </strong></p>")) 
, xdmp:redirect-response("/")
:)
