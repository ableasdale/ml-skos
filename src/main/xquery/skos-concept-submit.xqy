xquery version "1.0-ml";

import module namespace global = "http://www.xmlmachines.com/global" at "/xquery/lib/global.xqy"; 
import module namespace mem = "http://xqdev.com/in-mem-update" at "/MarkLogic/appservices/utils/in-mem-update.xqy";

declare boundary-space preserve;

declare namespace skos="http://www.w3.org/2004/02/skos/core#";
declare namespace dct="http://purl.org/dc/terms/";
declare namespace rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#";

declare variable $doc as element(skos:Concept) := xdmp:get-request-body()/node();
declare variable $guid as xs:string := global:guid();

declare variable $workflow as element(workflow) :=
    <workflow>
        <dct:created rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">{fn:current-dateTime()}</dct:created>
        <dct:modified rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">{fn:current-dateTime()}</dct:modified>
    </workflow>;
(:
element workflow {
    element dct:created {
        attribute rdf:datatype {"http://www.w3.org/2001/XMLSchema#dateTime"},
        current-dateTime()
    },
    element dct:modified {
        attribute rdf:datatype {"http://www.w3.org/2001/XMLSchema#dateTime"},
        current-dateTime()
    }
}; :)

(: TODO - these should be added rather than replaced from the instance :)
let $updated := mem:node-replace($doc//workflow, $workflow)
return

(: TODO - response content type was "text/html" - not sure what benefit this has for xsltforms? :) 
(xdmp:document-insert(concat($guid,".xml"), $updated),  xdmp:set-session-field("message", concat($guid,".xml"," has just been created")), xdmp:redirect-response("/"))
(: (xdmp:document-insert(concat($guid,".xml"), $updated), xdmp:set-response-content-type("application/xml"), concat("<p><strong>saved: ", $guid," ... </strong></p>")) :)
