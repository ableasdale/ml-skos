xquery version "1.0-ml"; 

module namespace common="http://www.xmlmachines.com/common";

declare default function namespace "http://www.w3.org/2005/xpath-functions";

declare namespace xhtml = "http://www.w3.org/1999/xhtml";
declare namespace skos="http://www.w3.org/2004/02/skos/core#";

import module namespace functx = "http://www.functx.com" at "/MarkLogic/functx/functx-1.0-nodoc-2007-01.xqy"; 

 
(: note that application/xhtml+xml is *still* not supported by several modern browsers... :)


declare function common:seq-to-links($items as item()*) as item()? { (: TODO - can you do this? as  element (ul|p) :)
    if ($items)
    then (
        element ul {
            for $x in $items
            return element li {element a {attribute href {concat("/heirarchy/", substring-before(xdmp:node-uri($x), ".xml"))}, $x}}
        })
    else (element p {element em {"None at this time..."}})
};

declare function common:search-pref-label($item as xs:string) {
    for $x in cts:search(doc(), cts:element-value-query(xs:QName("skos:prefLabel"), functx:camel-case-to-words($item, " "), ("case-insensitive", "whitespace-insensitive", "diacritic-insensitive")))
    return xdmp:node-uri($x)
};

declare function common:seq-to-list($items as xs:string*) as item()?{
    if ($items)
    then (
        element ul {
            for $x in $items
            let $y := common:search-pref-label($x)
            return 
              if (count($y) gt 0) 
              then (
                for $item in $y 
                return if (string-length($item) gt 0)
                then (element li {element a {attribute href {concat("/heirarchy/", substring-before($item, ".xml"))}, $x}})
                else (element li {$x})
                )              
              else (element li {$x})
        })
    else (element p {element em {"None at this time..."}})
};

declare function common:create-href($href as xs:string, $name as xs:string?) as element(a){
    element a {attribute href {$href}, if($name) then($name) else($href)}
};

declare function common:get-doc-content($q as xs:string) {
    xdmp:tidy(xdmp:quote(doc($q)), 
    <options xmlns="xdmp:tidy">
        <show-warnings>no</show-warnings>
        <input-xml>yes</input-xml>
        <output-xml>yes</output-xml>
        <indent>auto</indent>
    </options>)
};

declare function common:exception($e as element(error:error)){
element div {attribute class{"container"},
    common:html-page-header(concat("Exception Caught: ", $e/error:code/string())),
    element div {attribute class{"error"},
        element h2 {$e/error:message/string()},
        element p {"Details below:"},
        element textarea {$e}
    } 
} 
};  
 
declare function common:success($message as xs:string, $html as element()){
element div {attribute class{"container"},
    common:html-page-header($message), 
    element div {attribute class{"success"},
        $html
    } 
} 
};   

(: TODO - removed- why can't i use this - $html as element(div):)
declare function common:build-page($html){
    xdmp:set-response-content-type("text/html"), xdmp:set-response-encoding("utf-8"),
    '<?xml version="1.0" encoding="UTF-8"?>',
    '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
    common:html-page-enclosure($html)
};

declare function common:html-head() {
    (
    element link {attribute rel {"stylesheet"}, attribute type{"text/css"}, attribute href {"/css/application.css"}},
    element link {attribute rel {"stylesheet"}, attribute type{"text/css"}, attribute href {"/css/blueprint.css"}},
    element link {attribute rel {"stylesheet"}, attribute type{"text/css"}, attribute href {"/css/jqpagination.css"}},
    element link {attribute rel {"stylesheet"}, attribute type{"text/css"}, attribute href {"http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css"}}, 
    element link {attribute rel {"stylesheet"}, attribute type{"text/css"}, attribute href {"/css/codemirror.css"}},
    element script {attribute type {"text/javascript"}, attribute src {"/js/moment.min.js"}, " "}, 
    element script {attribute src {"//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"}, " "}, 
    element script {attribute src {"//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"}, " "},
    element script {attribute src {"/js/jquery.jqpagination.min.js"}, " "},
    element script {attribute type {"text/javascript"}, attribute src {"/js/controller.js"}, " "}
    )
};

declare function common:show-current-user(){
if (xdmp:get-current-user() eq "nobody")
then (element p {element em {"You are not logged in"}})
else (element p {"You are logged in as: ", element strong {attribute class {"quiet"}, xdmp:get-current-user()}}) 
};

declare function common:create-navlink($href as xs:string, $name as xs:string, $end as xs:boolean){
    "[", element a {attribute href {$href}, $name} ,"]", 
    if(not($end))
    then("&nbsp;")
    else()
};

declare function common:search(){
<form id="searchform" action="/xquery/search.xqy" method="post" class="inline right">    
    <div class="ui-widget">
        <label for="searchbox">Search: </label>
        <input id="searchbox" name="q" />&nbsp;
        <input id="search-go" type="submit" name="go" value="go" />    
    </div>
</form>
};

declare function common:create-navlinks(){
if (xdmp:get-current-user() ne "nobody")
then (
element p { 
    common:create-navlink("/", "Home", false()),
    common:create-navlink("/create/", "Create Concept", false()),
    common:create-navlink("/logout/", "Logout", true())
    
})
else ()
};

declare function common:format-message($msg as xs:string) {
    let $i := fn:tokenize($msg,"~")
    (: return fn:concat($i[1],"<strong>",$i[2],"</strong>") :)
    (: $msg :)
    return 
    ($i[1], <strong>{$i[2]}</strong>, $i[3], <strong>{$i[4]}</strong>," (",<a href="/view/{$i[5]}">View</a>,")")
};

(: TODO - can this be rewritten? :)
declare function common:handle-message() {
    if (xdmp:get-current-user() eq "nobody")
    then ()
    else (
        if (string-length(xdmp:get-session-field("message", "")) gt 0)
        then (xdmp:log("common:handle-message() :: got a message"), <div class="span-24 last info" id="message">{common:format-message(xdmp:get-session-field("message"))}</div>, xdmp:set-session-field("message", ""))
        else ()
    )
};

declare function common:html-page-header($header as xs:string) as element(div) {
element div {attribute id {"page-header"},
    common:handle-message(),
    element div {attribute id {"header"}, attribute class {"span-24 last"},
        element h2 {
            element abbr {attribute title {"Simple Knowledge Organization System"}, "SKOS"},
                " Editor: ", $header}
    },
    element hr {},
    (: TODO - make nav conditional :)    
    element div {attribute id {"subheader"}, attribute class {"span-12"}, (common:create-navlinks(), common:show-current-user())},
    element div {attribute id {"subheader"}, attribute class {"span-12 last"}, common:search()}      
    (: element hr {} :) 
} 
};
 
declare function common:html-page-footer() as element(div){
element div {attribute id {"footer"}, attribute class {"span-24 last"},  
    element hr {},
    element p {attribute align {"center"}, "MarkLogic SKOS Concept Editor - MMXIII"},
    element hr {}
}   
}; 
 

declare function common:html-page-enclosure($content as element()) as element(html){
element html {attribute lang {"en"}, attribute xml:lang {"en"},
    element head {common:html-head()},
    element body {$content}
}
};

declare function common:login-form() as element(div) {
element div {attribute id {"header"}, attribute class {"span-24 last"},
    element form { attribute method {"post"}, attribute action {"/xquery/login.xqy"},
        element fieldset {
            element legend {"Log in"},
            element p {element label {attribute for {"username"}, "Username: "}, element br {}, element input {attribute class {"title"}, attribute type {"text"}, attribute name {"username"}}},
            element p {element label {attribute for {"password"}, "Password: "}, element br {}, element input {attribute class {"title"}, attribute type {"password"}, attribute name {"password"}}},
            element p {element input {attribute type {"submit"}, attribute name {"login"}, attribute value {"Login"}}} 
        }
    }
}
};

declare function common:check-entitlement-then-do($tasks) as item()* {
        (if (xdmp:get-current-user() eq "nobody")
        then (common:login-form())
        else ($tasks),
        common:html-page-footer())
};

declare private function common:random-hex($seq as xs:integer*) as xs:string+ {
  for $i in $seq return 
    fn:string-join(for $n in 1 to $i
      return xdmp:integer-to-hex(xdmp:random(15)), "")
};

declare function common:guid() as xs:string {
  fn:string-join(common:random-hex((8,4,4,4,12)),"-")
}; 
