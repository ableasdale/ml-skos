xquery version "1.0-ml"; 

import module namespace info = "http://marklogic.com/appservices/infostudio"  
      at "/MarkLogic/appservices/infostudio/info.xqy";

import module namespace admin = "http://marklogic.com/xdmp/admin" 
		  at "/MarkLogic/admin.xqy";

declare variable $config as element(configuration) := admin:get-configuration();
declare variable $group as xs:unsignedLong := admin:group-get-id($config, "Default");

declare function local:create-database() {
    info:database-create("ML-SKOS", 2)
};

declare function local:create-application-server() {
    let $config := admin:http-server-create($config, 
        $group, 
        "http-9994", 
        "C:\Users\ableasdale\workspace\ml-skos\src\main\",
        (: "e:\work\ml-skos\src\main\",  :)
        xs:unsignedLong(9994), 
        0,
        xdmp:database("ML-SKOS"))
    let $config := admin:appserver-set-url-rewriter($config, admin:appserver-get-id($config, $group, "http-9994"),
         "rewriter.xqy")
    return admin:save-configuration($config)
};


declare function local:create-indexes() {
  let $dbid := xdmp:database("ML-SKOS")
  let $rangespec := admin:database-range-element-index("string", "http://www.w3.org/2004/02/skos/core#",
                "prefLabel", "http://marklogic.com/collation/codepoint",
		fn:false() )
let $config := admin:database-add-range-element-index($config, $dbid, $rangespec)
let $config := admin:save-configuration($config)
return $config
};

(local:create-database(), local:create-indexes(), local:create-application-server())