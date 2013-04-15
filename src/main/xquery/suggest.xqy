xquery version "1.0-ml";

import module namespace search = "http://marklogic.com/appservices/search"
    at "/MarkLogic/appservices/search/search.xqy";
	
declare variable $q as xs:string := xdmp:get-request-field("q", "");

search:suggest($q,
<options xmlns="http://marklogic.com/appservices/search">
 <default-suggestion-source>
    <range collation="http://marklogic.com/collation/codepoint" type="xs:string" facet="true">
      <element ns="http://www.w3.org/2004/02/skos/core#" name="prefLabel"/>
   </range>
 </default-suggestion-source>
</options>
)