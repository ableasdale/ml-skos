xquery version "1.0-ml";

(:~ 
 : Codemirror formatted view of db content 
 :)

import module namespace global = "http://www.xmlmachines.com/global" at "/xquery/lib/global.xqy";
import module namespace common = "http://www.xmlmachines.com/common" at "/xquery/lib/common.xqy";
 
declare boundary-space preserve;
 
declare default element namespace "http://www.w3.org/1999/xhtml";
declare namespace skos="http://www.w3.org/2004/02/skos/core#";

declare variable $q as xs:string := xdmp:get-request-field("id");
declare variable $doc := common:get-doc-content($q);    
declare variable $title := concat("Viewing XML Data for Concept: '", $doc//skos:prefLabel, "'");

declare function local:codemirror(){
    (<div class="span-24 last">
        <p><a href="/heirarchy/{fn:substring-before($q, ".")}">View Concept heirarchy</a></p>
        <form action="/save/{fn:substring-before($q, ".")}" method="POST">
            <p><textarea rows="10" cols="20" id="code" name="code">{$doc[2]}</textarea></p>
            <p class="prepend-top">    
                <input type="submit" value="Update Concept" />
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
