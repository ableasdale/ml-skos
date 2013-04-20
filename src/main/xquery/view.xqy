xquery version "1.0-ml";

(:~ 
 : Codemirror formatted view of db content 
 :)

import module namespace global = "http://www.xmlmachines.com/global" at "/xquery/lib/global.xqy";
import module namespace common = "http://www.xmlmachines.com/common" at "/xquery/lib/common.xqy";
 
declare boundary-space preserve;
 
declare default element namespace "http://www.w3.org/1999/xhtml";

declare variable $q as xs:string := concat(xdmp:get-request-field("id"));
declare variable $doc := doc($q);
declare variable $title := concat('SKOS Editor: viewing doc: ', $q);
(: let $_ := xdmp:log(xdmp:get-request-field("id")) :)

declare function local:codemirror(){
    (<div class="span-24 last">
        <form action="/xquery/edit.xqy" method="post" accept-charset="utf-8" enctype="multipart/form-data">
            <p><textarea rows="10" cols="20" id="code" name="code">{xdmp:quote($doc)}</textarea>
            <input type="hidden" name="uri" value="{$q}" /></p>
            <p class="prepend-top">    
                <input type="submit" value="Update Document" />
            </p>
        </form>
    </div>,
    <script type="text/javascript" src="/js/codemirror.js"></script>,
    <script type="text/javascript" src="/js/xml.js"></script>,
    <script type="text/javascript" src="/js/active-line.js"></script>,
    <script type="text/javascript"><![CDATA[
      var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
        mode: "application/xml",
        styleActiveLine: true,
        lineNumbers: true,
        autoCloseTags: true
      });]]>
    </script>)    

};


(::::::::::::::::::::::::::)
(: Main Module Code below :)
(::::::::::::::::::::::::::)

common:build-page(
    element div {attribute class {"container"},
        common:html-page-header($title),
        if (xdmp:get-current-user() eq "nobody")
        then (common:login-form())
        else (
            local:codemirror(),
            common:html-page-footer()
        )
    }
)


(:


return
(xdmp:set-response-content-type("text/html; charset=utf-8"),
text {'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'},
<html lang="en">
    <head>
        <title>{$title}</title>
        <script type="text/javascript" src="/js/codemirror.js"></script>
        <script type="text/javascript" src="/js/xml.js"></script>
        <script type="text/javascript" src="/js/active-line.js"></script>
        
        <link rel="stylesheet" href="/css/blueprint.css" type="text/css" media="screen, projection" />
        
        <!--
        <link rel="stylesheet" href="/css/codemirror.css" type="text/css" media="screen, projection" />
        <style type="text/css"><![CDATA[
        .CodeMirror {border-top: 1px solid black; border-bottom: 1px solid black;}
        .CodeMirror-activeline-background {background: #e8f2ff !important;}
        ]]></style> -->
    </head>
    <body>
        <div class="container">
            {common:html-page-header($title)}
        
        </div>
    </body>
</html>) :)