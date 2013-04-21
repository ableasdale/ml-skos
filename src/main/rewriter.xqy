xquery version "1.0-ml"; 
 
  import module namespace rest="http://marklogic.com/appservices/rest"
      at "/MarkLogic/appservices/utils/rest.xqy";

declare default function namespace "http://www.w3.org/2005/xpath-functions";

declare option xdmp:mapping "false";

declare variable $url as xs:string := xdmp:get-request-url();
declare variable $options as element(rest:options) :=
    <rest:options>
        <rest:request uri="^/create/$" endpoint="/xquery/create.xqy"></rest:request>
        <rest:request uri="^/logout/$" endpoint="/xquery/logout.xqy"></rest:request>
        <!-- TODO - rename these modules to make their intent more obvious -->
        <rest:request uri="^/update/(.+)/?$" endpoint="/xquery/create.xqy">
            <rest:uri-param name="id">$1.xml</rest:uri-param>
        </rest:request>
        <rest:request uri="^/view/(.+)/?$" endpoint="/xquery/view.xqy">
            <rest:uri-param name="id">$1.xml</rest:uri-param>
        </rest:request>
        <rest:request uri="^/search/(.+)/?$" endpoint="/xquery/search.xqy">
            <rest:uri-param name="q">$1</rest:uri-param>
        </rest:request>
        <rest:request uri="/" endpoint="/xquery/default.xqy"/>
    </rest:options>;

let $_ := xdmp:log(concat("Rewriter :: URI: ", $url))
let $rewrite := rest:rewrite($options)
return
(: TODO - properly handle POSTS in this rewriter so this is no longer necessary :)
if (starts-with($url, "/xml/") or 
    starts-with($url, "/xsltforms/") or 
    starts-with($url, "/css/") or 
    starts-with($url, "/js/") or 
    starts-with($url, "/xquery/search.xqy") or 
    starts-with($url, "/xquery/skos-concept-submit.xqy") or 
    starts-with($url, "/xquery/edit.xqy") or
    starts-with($url, "/xquery/login.xqy") 
    )
then $url
else $rewrite
