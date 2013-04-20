xquery version "1.0-ml";

(xdmp:login(
    xdmp:get-request-field("username"),
    xdmp:get-request-field("password")),
xdmp:redirect-response("/")) 