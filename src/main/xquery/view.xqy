xquery version "1.0-ml";
 
declare boundary-space preserve;
 
(: Codemirror formatted view of db content :)

declare default element namespace "http://www.w3.org/1999/xhtml";

declare variable $q as xs:string := concat(xdmp:get-request-field("id"));
let $_ := xdmp:log(xdmp:get-request-field("id"))
let $doc := doc($q)
let $title := concat('Viewing doc: ', $q) 


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
            <p><a href="/">Home</a> |
            <form action="/xquery/search.xqy" method="post">
                <input type="text" name="q"/>
                <input type="submit" name="go" value="go" />
           </form>
            </p>
            <p>Currently logged in as: <strong>{xdmp:get-current-user()}</strong>.</p>
            <form action="/xquery/edit.xqy" method="post" accept-charset="utf-8" enctype="multipart/form-data">
                <textarea id="code" name="code">{xdmp:quote($doc)}</textarea>
                <input type="hidden" name="uri" value="{$q}" />
                <p>    
                    <input type="submit" value="Update Document" />
                </p>
            </form>
        </div>
        <script type="text/javascript"><![CDATA[
          var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
            mode: "application/xml",
            styleActiveLine: true,
            lineNumbers: true,
            autoCloseTags: true
          });]]>
        </script>    
    </body>
</html>)