xquery version "1.0-ml";

import module namespace global = "http://www.xmlmachines.com/global" at "/xquery/lib/global.xqy"; 

declare boundary-space preserve;
  
declare default element namespace "http://www.w3.org/1999/xhtml";
declare namespace skos="http://www.w3.org/2004/02/skos/core#";
declare namespace dct="http://purl.org/dc/terms/";

declare variable $title as xs:string := "SKOS Editor: Home";

(xdmp:set-response-content-type("text/html; charset=utf-8"),
<html lang="en">
    <!-- TODO - module! -->
    <head>
        <title>{$title}</title>
        <link rel="stylesheet" href="/css/blueprint.css" type="text/css" media="screen, projection" />
    </head>
    <body>
        <div class="container">
           {global:nav($title)}
           <div class="span-24 last">
            <p>Recently added/modified terms:</p>
            <ul>
            { (: TODO - make this a proper query :)
            for $i in doc()[1 to 25]
            order by $i//dct:modified descending
            return 
            element li {
             element a {
              attribute href {concat("/view/",fn:substring-before(xdmp:node-uri($i), "."))},
              $i//skos:prefLabel/text() 
             }
             }
            }
            </ul>
           </div>
        </div>
    </body>
</html>)