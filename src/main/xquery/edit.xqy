xquery version "1.0-ml";

import module namespace mem = "http://xqdev.com/in-mem-update" at "/MarkLogic/appservices/utils/in-mem-update.xqy";

declare boundary-space preserve;

(: TODO - refactor namespace decls into one lib function - in fact - is that even possible?? :)
declare namespace skos="http://www.w3.org/2004/02/skos/core#";
declare namespace dct="http://purl.org/dc/terms/";
declare namespace wf="http://www.xmlmachines.com/workflow/";

declare variable $uri as xs:string := 
if (string-length(xdmp:get-request-field("id")) gt 1)
then (xdmp:log("Have a URI"), xdmp:get-request-field("id"))
else (xdmp:log("No URI"), xdmp:get-request-url());

declare variable $doc as element(skos:Concept) := 
if (exists(xdmp:get-request-field("code")))
then (xdmp:log("edit.xqy: should NOT have a request-body - likely referrer was the view page."), xdmp:unquote( xdmp:get-request-field("code"), (), ("format-xml"))/node() )
else (xdmp:log("edit.xqy: should have a request-body - should be an XForm submit."), xdmp:get-request-body()/node());

declare variable $original-workflow as element(wf:workflow) := $doc//wf:workflow;

declare variable $updated-workflow as element(wf:workflow) :=
element wf:workflow {
    $original-workflow/dct:created,
    $original-workflow/dct:creator,
    element dct:modified {fn:current-dateTime()},
    element dct:modified-by {xdmp:get-current-user()},    
    $original-workflow/dct:language
};

let $_ := xdmp:log("edit.xqy")
let $updated := mem:node-replace($doc//wf:workflow, $updated-workflow)
return

(xdmp:document-insert($uri, $updated), 
xdmp:set-response-content-type("text/html"),
xdmp:set-session-field("message", concat("The concept: ~",$doc//skos:prefLabel/text(),"~ was updated by: ~",xdmp:get-current-user(),"~",fn:substring-before($uri, "."))),
if (exists(xdmp:get-request-field("code"))) then(xdmp:redirect-response("/")) else()
)