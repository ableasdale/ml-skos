xquery version "1.0-ml";
 
declare boundary-space preserve;
 
(: compare with 

http://localhost:8080/exist/rest//db/stuff/index.xq
:) 
declare default element namespace "http://www.w3.org/1999/xhtml";


declare variable $q as xs:string := concat(xdmp:get-request-field("id", "e0ce0746-b1e8-9e54-dbe1-2214c8396771"),".xml");
let $doc := doc($q)
let $title := concat('Viewing doc: ', xdmp:node-uri($doc))


return
(xdmp:set-response-content-type("text/html; charset=utf-8"),
<html lang="en">
    <head>
        <title>{$title}</title>
        <script type="text/javascript" src="/js/codemirror.js"></script>
        <script type="text/javascript" src="/js/xml.js"></script>
        <script type="text/javascript" src="/js/active-line.js"></script>      
        <link rel="stylesheet" href="/css/codemirror.css" type="text/css" media="screen, projection" />
        <link rel="stylesheet" href="/css/docs.css" type="text/css" media="screen, projection" />
        <style type="text/css"><![CDATA[
        .CodeMirror {border-top: 1px solid black; border-bottom: 1px solid black; width:90%}
        .CodeMirror-activeline-background {background: #e8f2ff !important;}
        ]]></style>
    </head>
    <body>
        <div class="container">
           <h2>{$title}</h2>
           <p>Currently logged in as: <strong>{xdmp:get-current-user()}</strong>.</p>
           

<form><textarea id="code" name="code">
{xdmp:quote($doc)}
</textarea></form>

    <script type="text/javascript"><![CDATA[
      var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
        mode: "application/xml",
        styleActiveLine: true,
        
        lineNumbers: true,
        autoCloseTags: true
      }); 
    ]]></script>
           
        </div>
    </body>
</html>)