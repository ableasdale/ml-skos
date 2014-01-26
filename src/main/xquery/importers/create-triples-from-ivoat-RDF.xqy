xquery version "1.0-ml";

(:~
 :  Load the IVOAT Thesaurus RDF into MarkLogic 7 as Triples
 :  @see http://www.ivoa.net/rdf/Vocabularies/vocabularies-20091007/IVOAT/IVOAT.html
 :  
 :)

declare namespace skos="http://www.w3.org/2008/05/skos#";

import module namespace sem = "http://marklogic.com/semantics" 
      at "/MarkLogic/semantics.xqy";

for $x in xdmp:unquote(xdmp:filesystem-file(concat(xdmp:modules-root(),"test/resources/IVOAT.rdf")))/rdf:RDF/skos:Concept
(: TODO - Add in the Dublin Core "workflow" nodes :)
return sem:rdf-insert(sem:rdf-parse($x, "rdfxml"))
(: element root {sem:rdf-parse($x, "rdfxml")} :)


(: Get data from HTTP
sem:rdf-load('http://www.ivoa.net/rdf/Vocabularies/vocabularies-20091007/IVOAT/IVOAT.rdf', "rdfxml")
:)