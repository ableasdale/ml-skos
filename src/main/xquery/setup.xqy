xquery version "1.0-ml"; 

import module namespace info = "http://marklogic.com/appservices/infostudio"  
      at "/MarkLogic/appservices/infostudio/info.xqy";

import module namespace admin = "http://marklogic.com/xdmp/admin" 
		  at "/MarkLogic/admin.xqy";


declare function local:create-database() {
    info:database-create("ML-SKOS", 2)
};

declare function local:create-indexes() {
let $config := admin:get-configuration()
  let $dbid := xdmp:database("ML-SKOS")
  let $rangespec := admin:database-range-element-index("string", "http://www.w3.org/2004/02/skos/core#",
                "prefLabel", "http://marklogic.com/collation/codepoint",
		fn:false() )
let $config := admin:database-add-range-element-index($config, $dbid, $rangespec)
let $config := admin:save-configuration($config)
};
