xquery version "1.0-ml";

module namespace global="http://www.xmlmachines.com/global";

(: declare variable $DEBUG := xdmp:get-request-field("debug", "no"); :)
declare variable $DEBUG := xdmp:get-request-field("debug", "yes");

declare function global:nav($title as xs:string) as element(div) {
<div id="nav">
    <!-- TODO - refactor this out very soon and drop the session field after display -->
    <div id="message">{xdmp:get-session-field("message")}</div>
    <h2>{$title}</h2>
    <p><a href="/">Home</a> | <a href="/create/">Create</a></p>
    <p>Currently logged in as: <strong>{xdmp:get-current-user()}</strong>.</p>
    <!-- TODO - rewrite this -->
    <form action="/xquery/search.xqy" method="post">
        <input type="text" name="q"/>
        <input type="submit" name="go" value="go" />
    </form>
</div>
};