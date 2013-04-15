xquery version "1.0-ml"; 

import module namespace search = "http://marklogic.com/appservices/search"
     at "/MarkLogic/appservices/search/search.xqy";

declare variable $q as xs:string := xdmp:get-request-field("q", "fiction");

search:search($q,


<options xmlns="http://marklogic.com/appservices/search">
	<return-constraints>true</return-constraints>
	<return-facets>true</return-facets>
	<return-metrics>true</return-metrics>
	<return-plan>true</return-plan>
	<return-qtext>true</return-qtext>
	<return-query>true</return-query>
	<return-results>true</return-results>
	<return-similar>true</return-similar>
    
    <debug>true</debug>
    
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
	
	
	<constraint name="lang">
		<range collation="http://marklogic.com/collation/codepoint" type="xs:string" facet="true">
		  <facet-option>frequency-order</facet-option>
		  <facet-option>descending</facet-option>
		  <facet-option>limit=10</facet-option>
		  <element ns="http://www.w3.org/2004/02/skos/core#" name="prefLabel"/>
		</range>
	</constraint>

</options>
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