xquery version "1.0-ml";

import module namespace mem = "http://xqdev.com/in-mem-update" at "/MarkLogic/appservices/utils/in-mem-update.xqy";

(: TODO - refactor namespace decls into one lib function - in fact - is that even possible?? :)
declare namespace skos="http://www.w3.org/2004/02/skos/core#";
declare namespace dct="http://purl.org/dc/terms/";
declare namespace rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#";

declare variable $uri as xs:string := xdmp:get-request-field("uri");
declare variable $doc as element(skos:Concept) := xdmp:unquote( xdmp:get-request-field("code"), (), ("format-xml"))/node();
let $_ := xdmp:log("edit.xqy")
let $updated := mem:node-replace($doc/workflow/dct:modified, <dct:modified rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">{fn:current-dateTime()}</dct:modified>)
return

(xdmp:document-insert($uri, $updated),  xdmp:set-session-field("message", concat($uri," has just been updated")), xdmp:redirect-response("/"))