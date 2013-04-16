xquery version "1.0-ml";

(: TODO - refactor namespace decls into one lib function :)
declare namespace skos="http://www.w3.org/2004/02/skos/core#";
declare namespace dct="http://purl.org/dc/terms/";

declare variable $uri as xs:string := xdmp:get-request-field("uri");
declare variable $doc as element(skos:Concept) := xdmp:unquote( xdmp:get-request-field("code"), (), ("format-xml"))/node();

(: TODO - update dct:modified as part of this routine and return a message on-screen :)
(xdmp:document-insert($uri, $doc), xdmp:redirect-response("/"))
