xquery version "1.0-ml";

import module namespace common = "http://www.example.com/common" at "/common.xqy";

declare default function namespace "http://www.w3.org/2005/xpath-functions";


declare function local:collection-summary($collection-uri as xs:string, $collection-name as xs:string) as element(div) {
let $estimate := xdmp:estimate(collection($collection-uri))
return
element div {
    attribute class {"component-summary"},
    element h4 {"You currently have access to ", element strong {$estimate}, " documents in the ", element strong {$collection-name}},
    (if($estimate gt 0)
    then (local:generate-list($collection-uri))
    else ()),
    element hr {}
}
};

declare function local:generate-list($collection-uri as xs:string) as element(div) {
element div { attribute class {"listing"},
    element p {element em {"Listing ten items:"}},
    element ul {
        for $doc in collection($collection-uri)[1 to 10]
        return element li {element a {attribute href {concat("/view.xqy?id=",xdmp:node-uri($doc))}, xdmp:node-uri($doc)}}
    }
}    
};

(::::::::::::::::::::::::::)
(: Main Module Code below :)
(::::::::::::::::::::::::::)

common:build-page(
element div {attribute class {"container"},
    common:html-page-header("Application Test"),
    if (xdmp:get-current-user() eq "nobody")
    then (common:login-form())
    else (
        local:collection-summary("main-book-catalogue", "Main Book Catalogue"),
        local:collection-summary("restricted-book-catalogue", "Restricted Book Catalogue"),
        local:collection-summary("unpublished-book-catalogue", "Unpublished Book Catalogue"),
        common:html-page-footer()
    )
})
 