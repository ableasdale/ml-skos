xquery version "1.0-ml";

import module namespace mem = "http://xqdev.com/in-mem-update" at "/MarkLogic/appservices/utils/in-mem-update.xqy";

declare boundary-space preserve;

(: TODO - refactor namespace decls into one lib function - in fact - is that even possible?? :)
declare namespace skos="http://www.w3.org/2004/02/skos/core#";
declare namespace dct="http://purl.org/dc/terms/";
declare namespace wf="http://www.xmlmachines.com/workflow/";

declare variable $uri as xs:string := xdmp:get-request-field("uri");
declare variable $doc as element(skos:Concept) := xdmp:unquote( xdmp:get-request-field("code"), (), ("format-xml"))/node();

declare variable $original-workflow as element(wf:workflow) := $doc//wf:workflow;
declare variable $updated-workflow as element(wf:workflow) :=
<wf:workflow>
        {$original-workflow/dct:created},
        {$original-workflow/dct:creator},
        <dct:modified>{fn:current-dateTime()}</dct:modified>
        <dct:modified-by>{xdmp:get-current-user()}</dct:modified-by>
        {$original-workflow/dct:language}
    </wf:workflow>;

let $_ := xdmp:log("edit.xqy")
let $updated := mem:node-replace($doc//wf:workflow, $updated-workflow)
return

(xdmp:document-insert($uri, $updated),  xdmp:set-session-field("message", concat($uri," has just been updated")), xdmp:redirect-response("/"))