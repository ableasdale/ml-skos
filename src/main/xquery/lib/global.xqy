xquery version "1.0-ml";

module namespace global="http://www.xmlmachines.com/global";

(: declare variable $DEBUG := xdmp:get-request-field("debug", "no"); :)
declare variable $DEBUG := xdmp:get-request-field("debug", "yes"); 