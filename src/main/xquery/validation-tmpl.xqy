xquery version "1.0-ml";

(: Loads in the test instance as a schema elem - TODO - need to have installed the schemas :)

import module namespace sem = "http://marklogic.com/semantics" 
      at "/MarkLogic/semantics.xqy";
          
declare namespace rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#";

declare variable $rdf as schema-element(rdf:RDF) := xdmp:unquote(xdmp:filesystem-file(concat(xdmp:modules-root(),"/test/resources/rdf-skos-concept.xml")))/node();

(: validate strict { $rdf } :)
xdmp:validate($rdf)

(: validate strict { $rdf } :)
(: sem:rdf-parse($rdf, "rdfxml") :)
(: sem:rdf-insert(sem:rdf-parse($rdf, "rdfxml")) :)