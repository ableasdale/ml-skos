xquery version "1.0-ml";
 
declare boundary-space preserve;
  
declare default element namespace "http://www.w3.org/1999/xhtml";
declare namespace skos="http://www.w3.org/2004/02/skos/core#";

declare variable $title as xs:string := "SKOS Editor: Home";

(xdmp:set-response-content-type("text/html; charset=utf-8"),
<html lang="en">
    <head>
        <title>{$title}</title>
        <link rel="stylesheet" href="/css/docs.css" type="text/css" media="screen, projection" />
    </head>
    <body>
        <div class="container">
           <h2>{$title}</h2>
           <p>Currently logged in as: <strong>{xdmp:get-current-user()}</strong>.</p>
           <p>Recently added terms:</p>
           <ul>
           {for $i in doc()
           return 
           element li {
            element a {
             attribute href {concat("/xquery/view.xqy?id=",fn:substring-before(xdmp:node-uri($i), "."))},
             $i//skos:prefLabel/text() 
            }
            }
           }
           </ul>
        </div>
    </body>
</html>)