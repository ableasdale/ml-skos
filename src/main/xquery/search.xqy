xquery version "1.0-ml"; 

import module namespace search = "http://marklogic.com/appservices/search" at "/MarkLogic/appservices/search/search.xqy";
import module namespace common = "http://www.xmlmachines.com/common" at "/xquery/lib/common.xqy";

declare namespace skos="http://www.w3.org/2004/02/skos/core#";

declare variable $q as xs:string := xdmp:get-request-field("q", "");

declare variable $title as xs:string := concat("Searched for: ",$q);

declare variable $search := search:search($q,
<options xmlns="http://marklogic.com/appservices/search">
	
	<return-facets>true</return-facets>
	<return-results>true</return-results>
	
	<!-- return-metrics>true</return-metrics>
	<return-constraints>true</return-constraints>
	<return-plan>true</return-plan>
	<return-qtext>true</return-qtext>
	<debug>true</debug>
	<return-query>true</return-query -->
	
    
    <grammar xmlns="http://marklogic.com/appservices/search">
	  <quotation>"</quotation>
	  <implicit>
		<cts:and-query strength="20" xmlns:cts="http://marklogic.com/cts"/>
	  </implicit>
	  <starter strength="30" apply="grouping" delimiter=")">(</starter>
	  <starter strength="40" apply="prefix" element="cts:not-query">-</starter>
	  <joiner strength="10" apply="infix" element="cts:or-query" tokenize="word">OR</joiner>
	  <joiner strength="20" apply="infix" element="cts:and-query" tokenize="word">AND</joiner>
	  <joiner strength="30" apply="infix" element="cts:near-query" tokenize="word">NEAR</joiner>
	  <joiner strength="30" apply="near2" element="cts:near-query">NEAR/</joiner>
	  <joiner strength="50" apply="constraint">:</joiner>
	  <joiner strength="50" apply="constraint" compare="LT" tokenize="word">LT</joiner>
	  <joiner strength="50" apply="constraint" compare="LE" tokenize="word">LE</joiner>
	  <joiner strength="50" apply="constraint" compare="GT" tokenize="word">GT</joiner>
	  <joiner strength="50" apply="constraint" compare="GE" tokenize="word">GE</joiner>
	  <joiner strength="50" apply="constraint" compare="NE" tokenize="word">NE</joiner>
	</grammar>
	
	
	<constraint name="preferred-label">
		<range collation="http://marklogic.com/collation/codepoint" type="xs:string" facet="true">
		  <facet-option>frequency-order</facet-option>
		  <facet-option>descending</facet-option>
		  <facet-option>limit=10</facet-option>
		  <element ns="http://www.w3.org/2004/02/skos/core#" name="prefLabel"/>
		</range>
	</constraint>
	
	<constraint name="narrower">
		<range collation="http://marklogic.com/collation/codepoint" type="xs:string" facet="true">
		  <facet-option>frequency-order</facet-option>
		  <facet-option>descending</facet-option>
		  <facet-option>limit=10</facet-option>
		  <element ns="http://www.w3.org/2004/02/skos/core#" name="narrower"/>
		</range>
	</constraint>
	
	<constraint name="broader">
		<range collation="http://marklogic.com/collation/codepoint" type="xs:string" facet="true">
		  <facet-option>frequency-order</facet-option>
		  <facet-option>descending</facet-option>
		  <facet-option>limit=10</facet-option>
		  <element ns="http://www.w3.org/2004/02/skos/core#" name="broader"/>
		</range>
	</constraint>
	
	<constraint name="related">
		<range collation="http://marklogic.com/collation/codepoint" type="xs:string" facet="true">
		  <facet-option>frequency-order</facet-option>
		  <facet-option>descending</facet-option>
		  <facet-option>limit=10</facet-option>
		  <element ns="http://www.w3.org/2004/02/skos/core#" name="related"/>
		</range>
	</constraint>

</options>
);

(:
declare function local:transform($x){
case element(search:highlight) return <span
class="highlight">{fn:data($node)}</span> case text() return $node default return xs:string($node)
}; :)

declare function local:process-snippets($items) {
    element ol {
        for $i in $items/search:match
        return
        element li {element strong {fn:substring-after($i/@path/data(), '.xml")')}, " : ",  $i/node()}  
    }
};

declare function local:process-results($items) {
    for $i in $items
    return element div {
        local:process-snippets($i/search:snippet),
        element p {element a {attribute href {concat("/view/", fn:substring-before($i/@uri/data(), "."))}, "View"}}
    }
};

declare function local:process-facets(){
    element p {"todo - facets..."}
};

declare function local:search-results(){
<div class="span-24">
    <h4>Showing {$search/@start/data()} to {$search/@page-length/data()} of {$search/@total/data()} results:</h4>
    <div>{local:process-results($search/search:result)}</div>
    <div>{local:process-facets()}</div>
    <textarea>{$search}</textarea>
    <p>Good test search terms:</p>
    <ul>
        <li><a href="/search/star">star</a></li>
        <li><a href="/search/cluster">cluster</a></li>
        <li><a href="/search/system">system</a></li>
    </ul>
</div>
};


common:build-page(
    element div {attribute class {"container"},
        common:html-page-header($title),
        common:check-entitlement-then-do(local:search-results())
    }
)





(: 
<!--options xmlns="http://marklogic.com/appservices/search">
  < constraint name="sample-property-constraint">
    <properties />
  </constraint >
  
  <default-suggestion-source>
  <range type="xs:string">
    <element ns="my-namespace" name="my-localname"/>
    <attribute ns="" name="my-attribute"/>
   </range>
</default-suggestion-source> 

  
</options--> 
:)


(:  return typeswitch($node)   :)