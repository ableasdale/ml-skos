xquery version "1.0-ml";

(:~
 :  Load the IVOAT Thesaurus RDF into MarkLogic 7 as Triples
 :  @see http://www.ivoa.net/rdf/Vocabularies/vocabularies-20091007/IVOAT/IVOAT.html
 :  
 :)

import module namespace sem = "http://marklogic.com/semantics" 
      at "/MarkLogic/semantics.xqy";
 
sem:rdf-load('http://www.ivoa.net/rdf/Vocabularies/vocabularies-20091007/IVOAT/IVOAT.rdf', "rdfxml")
