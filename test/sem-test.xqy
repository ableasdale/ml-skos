xquery version "1.0-ml";

module namespace test = "http://github.com/robwhitby/xray/test";
import module namespace assert = "http://github.com/robwhitby/xray/assertions" at "/xray/src/assertions.xqy";

declare namespace rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#";
declare namespace skos="http://www.w3.org/2004/02/skos/core#";

import module namespace sem = "http://marklogic.com/semantics" at "/MarkLogic/semantics.xqy";

declare variable $RDF-DOC as schema-element(rdf:RDF) := xdmp:unquote(xdmp:filesystem-file(fn:concat(xdmp:modules-root(),"/test/resources/rdf-skos-concept.xml")))/node(); 
declare variable $SKOS-DOC as schema-element(skos:Concept) := xdmp:unquote(xdmp:filesystem-file(fn:concat(xdmp:modules-root(),"/src/main/xml/instance-data/skos-base.xml")))/node();

declare %test:case function should-validate-sample-RDF-XML-skos-concept-against-current-schema ()
{
    assert:equal(xdmp:validate($RDF-DOC), <xdmp:validation-errors />)
};      

declare %test:case function should-validate-sample-skos-Concept-against-current-schema ()
{
    assert:equal(xdmp:validate($SKOS-DOC), <xdmp:validation-errors />)
};

declare %test:case function should-be-able-to-create-20-rdf-triples-from-sample-skos-concept ()
{
    let $triples := fn:count(sem:rdf-parse($RDF-DOC, "rdfxml"))
    return assert:equal($triples, 20) 
};
