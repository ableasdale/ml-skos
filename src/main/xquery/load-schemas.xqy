xquery version "1.0-ml";

(: LOAD SCHEMAS - V1 

TODO - Schema DB needs to be setup in install script :)

for $x in xdmp:filesystem-directory(concat(xdmp:modules-root(),"src/main/schemas"))/dir:entry
let $uri := $x/dir:filename/string()
let $xsd := xdmp:unquote(xdmp:filesystem-file($x/dir:pathname/string()))
return xdmp:eval( 
'xquery version "1.0-ml";

declare variable $URI as xs:string external;
declare variable $XSD as document-node() external;

xdmp:document-insert($URI, $XSD)', 
((xs:QName("URI"), $uri), (xs:QName("XSD"), $xsd)),
<options xmlns="xdmp:eval">
  <database>{xdmp:schema-database()}</database>
</options>) 