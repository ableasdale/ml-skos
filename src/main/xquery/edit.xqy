xquery version "1.0-ml";

import module namespace mem = "http://xqdev.com/in-mem-update" at "/MarkLogic/appservices/utils/in-mem-update.xqy";

(: TODO - refactor namespace decls into one lib function :)
declare namespace skos="http://www.w3.org/2004/02/skos/core#";
declare namespace dct="http://purl.org/dc/terms/";
declare namespace rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#";

declare variable $uri as xs:string := xdmp:get-request-field("uri");
declare variable $doc as element(skos:Concept) := xdmp:unquote( xdmp:get-request-field("code"), (), ("format-xml"))/node();

let $updated := mem:node-replace($doc/dct:modified, <dct:modified rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">{fn:current-dateTime()}</dct:modified>)
return

(: TODO - update dct:modified as part of this routine and return a message on-screen :)
(xdmp:document-insert($uri, $updated),  xdmp:set-session-field("message", concat($uri," has just been updated")), xdmp:redirect-response("/"))