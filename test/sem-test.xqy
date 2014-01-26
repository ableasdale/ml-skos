xquery version "1.0-ml";

module namespace test = "http://github.com/robwhitby/xray/test";
import module namespace assert = "http://github.com/robwhitby/xray/assertions" at "/xray/src/assertions.xqy";

import module namespace sem = "http://marklogic.com/semantics" at "/MarkLogic/semantics.xqy";
      
declare %test:case function should-be-able-to-create-20-rdf-triples-from-sample-skos-concept ()
{
  
    let $rdf := xdmp:unquote(xdmp:filesystem-file(fn:concat(xdmp:modules-root(),"/test/resources/rdf-skos-concept.xml")))
    let $triples := fn:count(sem:rdf-parse($rdf, "rdfxml"))
    return assert:equal($triples, 20) 
};
