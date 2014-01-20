xquery version "1.0-ml";

import module namespace sem = "http://marklogic.com/semantics" 
      at "/MarkLogic/semantics.xqy";

(: get one :)
sem:sparql('
  SELECT ?subject
  WHERE { ?subject <http://www.w3.org/2008/05/skos#definition> "variable star" }
  ')
  
 (: Do a wildcarded search :)   
sem:sparql('     
SELECT * WHERE
{
?s ?p ?o .
FILTER (regex(?o, "star","i"))
}
  ')   
  
  
 (:get all definitions - using the predicate ... :)
sem:sparql('     
SELECT * WHERE
{
?s ?p ?o .
FILTER (regex(?p, "definition","i"))
}
')  

(: show distinct predicate IRIs :)
sem:sparql('    
    SELECT DISTINCT ?p WHERE
    { ?s ?p ?o . }     
 ')
 
 (: slightly closer to getting the list of SKOS definitions with this approach :)
sem:sparql('
  SELECT ?o
  WHERE {?s <http://www.w3.org/2008/05/skos#definition> ?o}
') 

(: pagination :)
OFFSET 3
LIMIT 1