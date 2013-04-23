xquery version "1.0-ml";

let $_ := xdmp:logout()
return xdmp:redirect-response("/") 