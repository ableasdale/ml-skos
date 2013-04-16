xquery version "1.0-ml";
 
declare boundary-space preserve;
  
declare default element namespace "http://www.w3.org/1999/xhtml";
declare namespace skos="http://www.w3.org/2004/02/skos/core#";
declare namespace dct="http://purl.org/dc/terms/";

declare variable $title as xs:string := "SKOS Editor: Home";

(xdmp:set-response-content-type("text/html; charset=utf-8"),
<html lang="en">
    <head>
        <title>{$title}</title>
        <link rel="stylesheet" href="/css/docs.css" type="text/css" media="screen, projection" />
    </head>
    <body>
        <div class="container">
           <!-- TODO - refactor this out very soon and drop the session field after display -->
           <div id="message">{xdmp:get-session-field("message")}</div>
           <h2>{$title}</h2>
           <p>Currently logged in as: <strong>{xdmp:get-current-user()}</strong>.</p>
           <!-- TODO - rewrite this -->
           <form action="/xquery/search.xqy" method="post">
            <input type="text" name="q"/>
            <input type="submit" name="go" value="go" />
           </form>
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
    </body>
</html>)