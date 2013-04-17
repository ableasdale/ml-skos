xquery version "1.0-ml";

module namespace global="http://www.xmlmachines.com/global";

declare default element namespace "http://www.w3.org/1999/xhtml";
declare default function namespace "http://www.w3.org/2005/xpath-functions";

(: declare variable $DEBUG := xdmp:get-request-field("debug", "no"); :) 
declare variable $DEBUG := xdmp:get-request-field("debug", "yes"); 

(: as element(div)?  :)
declare function global:handle-message() {
    if (string-length(xdmp:get-session-field("message", "")) gt 0)
    then (xdmp:log("global:handle-message() :: got a message"), <div class="span-24 last info" id="message">{xdmp:get-session-field("message")}</div>, xdmp:set-session-field("message", ""))
    else ()
};

declare private function global:random-hex($seq as xs:integer*) as xs:string+ {
  for $i in $seq return 
    fn:string-join(for $n in 1 to $i
      return xdmp:integer-to-hex(xdmp:random(15)), "")
};

declare function global:guid() as xs:string {
  fn:string-join(global:random-hex((8,4,4,4,12)),"-")
};

declare function global:nav($title as xs:string) as element(div) {
<div id="header">
    <div class="span-24 last">
    <h2>{$title}</h2>
    <hr />
    </div>
    {global:handle-message()}
    <div class="span-12">
        <p><a href="/">Home</a> | <a href="/create/">Create Concept</a></p>
    </div>
    <div class="span-12 last">
        <!-- TODO - rewrite this -->
        <form action="/xquery/search.xqy" method="post" class="inline right">
            <p><input type="text" name="q" value="Search" />{"  "}
            <input type="submit" name="go" value="go" /></p>
        </form>
    </div>
    <div class="span-24 last">
        <p>Currently logged in as: <strong class="quiet">{xdmp:get-current-user()}</strong></p>
        <hr />
    </div>
</div>
};