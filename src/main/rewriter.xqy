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
        
        <!-- view.xqy startpoint -->
        <rest:request uri="^/save/(.+)/?$" endpoint="/xquery/edit.xqy">
            <rest:uri-param name="id">$1.xml</rest:uri-param>
            <rest:param name="code"/>
            <rest:http method="POST"/>
            <rest:accept>text/html</rest:accept>
        </rest:request>
        
        <!-- XSLTForms startpoint -->
         <rest:request uri="^/save/(.+)/?$" endpoint="/xquery/edit.xqy">
            <rest:uri-param name="id">$1.xml</rest:uri-param>
            <rest:http method="PUT"/>
        </rest:request>
        
        <rest:request uri="^/view/(.+)/?$" endpoint="/xquery/view.xqy">
            <rest:uri-param name="id">$1.xml</rest:uri-param>
        </rest:request>
                    
        <rest:request uri="^/update/(.+)/?$" endpoint="/xquery/create.xqy">
            <rest:uri-param name="id">$1.xml</rest:uri-param>
        </rest:request>
        
        <rest:request uri="^/search/(.+)/?$" endpoint="/xquery/search.xqy">
            <rest:uri-param name="q">$1</rest:uri-param>
        </rest:request>
        
        <rest:request uri="/" endpoint="/xquery/default.xqy"/>
    </rest:options>;

let $_ := xdmp:log("############### START ##################")
let $_ := xdmp:log(concat("Rewriter :: URI: ", $url))

(: debug below:
let $k := rest:get-raw-query-params()
let $_ := for $x in map:keys($k) 
return xdmp:log(concat("key: ", $x, " val: ", map:get($k, $x)))
let $_ := xdmp:log("i will accept")
let $_ := xdmp:log(rest:get-acceptable-types(xdmp:get-request-header("Accept")))
:)
let $rewrite := rest:rewrite($options)
let $_ := xdmp:log(concat("Rewriter :: Rewriting to: ", $rewrite))
let $_ := xdmp:log("############### END ##################")
return
(: TODO - properly handle remaining POSTS in this rewriter so the below /xquery/* matches are no longer necessary :)
if (starts-with($url, "/xml/") or 
    starts-with($url, "/xsltforms/") or 
    starts-with($url, "/css/") or 
    starts-with($url, "/js/") or
    starts-with($url, "/images/") or 
    starts-with($url, "/xquery/search.xqy") or
    starts-with($url, "/xquery/suggest.xqy") or 
    starts-with($url, "/xquery/skos-concept-submit.xqy") or 
    starts-with($url, "/xquery/login.xqy") or 
    starts-with($url, "/favicon.ico")
    )
then $url
else $rewrite
