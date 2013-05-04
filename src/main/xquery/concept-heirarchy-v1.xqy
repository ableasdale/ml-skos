xquery version "1.0-ml";

(: Concept Heirarchy - V1 :)

declare namespace skos="http://www.w3.org/2004/02/skos/core#";


declare function local:sub-req($concept-id as xs:string) as node()* {

let $current-concept := //skos:Concept[skos:prefLabel=$concept-id]
   return

   (
    <ul>
       <li>
          <a href="view-concept.xq?id=x">{$current-concept//skos:perfLabel/text()}</a> 
          ({$concept-id})
        
       </li>
       { (: Check any other terms in the collection have our element as a broader term :)
       if (//skos:Concept[skos:broader/text()=$concept-id]) 
         then (
            (: Find all requirements that are sub-requirements of this requirement. :)
            for $concept in (//skos:Concept[skos:broader/text()=$concept-id])
               (: order by lower-case($concept/skos:perfLabel/text()) :)
                return
                local:sub-req($concept//skos:prefLabel/text())
             )
         else ()
         }
    </ul>)
};

local:sub-req("abundance")
