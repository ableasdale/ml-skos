xquery version "1.0-ml";

module namespace global="http://www.xmlmachines.com/global";

declare default function namespace "http://www.w3.org/2005/xpath-functions";

(: declare variable $DEBUG := xdmp:get-request-field("debug", "no"); :)
declare variable $DEBUG := xdmp:get-request-field("debug", "yes");

(: as element(div)?  :)
declare function global:handle-message() {
    if (string-length(xdmp:get-session-field("message", "")) gt 0)
    then (xdmp:log("global:handle-message() :: got a message"), <div class="span-24 last info" id="message">{xdmp:get-session-field("message")}</div>, xdmp:set-session-field("message", ""))
    else ()
};

declare function global:nav($title as xs:string) as element(div) {
<div id="header">
    <!-- TODO - drop the session field after display -->
    <h2>{$title}</h2>
    {global:handle-message()}
    <div class="span-12">
        <p><a href="/">Home</a> | <a href="/create/">Create Concept</a></p>
    </div>
    <div class="span-12 last">
        <!-- TODO - rewrite this -->
        <form action="/xquery/search.xqy" method="post">
            <input type="text" name="q" value="Search" />{"  "}
            <input type="submit" name="go" value="go" />
        </form>
    </div>
    <div class="span-24 last">
        <p>Currently logged in as: <strong>{xdmp:get-current-user()}</strong>.</p>
    </div>
</div>
};