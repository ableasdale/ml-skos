xquery version "1.0-ml";

module namespace wikipedia-enrichment="http://www.xmlmachines.com/wikipedia-enrichment";

declare default function namespace "http://www.w3.org/2005/xpath-functions";

(: example call: "http://en.wikipedia.org/wiki/Early-type_galaxies" :)
declare function wikipedia-enrichment:get-article-first-paragraph($article-name as xs:string) as element(p) {
    xdmp:document-get(wikipedia-enrichment:create-wikipedia-link($article-name),
    <options xmlns="xdmp:document-get" xmlns:http="xdmp:http">
        <format>xml</format>
    </options>)//p[1]
};

(: 
    
for $x in (//*:prefLabel/text())[1 to 200]
return wikipedia-enrichment:create-wikipedia-link($x)

:)
declare function wikipedia-enrichment:create-wikipedia-link($prefLabel-text as xs:string) as xs:string {
  let $string := concat(upper-case(fn:substring($prefLabel-text,1,1)), substring($prefLabel-text,2))
  let $string := replace($string," ", "_")
  return concat ("http://en.wikipedia.org/wiki/", $string)
};
