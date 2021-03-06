xquery version "1.0-ml";

import module namespace common = "http://www.xmlmachines.com/common" at "/xquery/lib/common.xqy";
import module namespace html-view = "http://www.xmlmachines.com/html-view" at "/xquery/lib/html-view.xqy";

declare variable $pg as xs:integer := xs:integer(xdmp:get-request-field("p", "1"));
declare variable $total as xs:integer := count(sem:sparql('
  SELECT ?o
  WHERE {?s <http://www.w3.org/2008/05/skos#definition> ?o}
'));

(xdmp:set-response-content-type("text/html"), xdmp:set-response-encoding("utf-8"), (
"<!DOCTYPE html>",
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta charset="utf-8" />
    <title>ML-SKOS : Test Layout</title>
    {common:html-head2()}
    
    <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.3.0/pure-min.css" />
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" />

<script type="text/javascript" src="//use.typekit.net/fra0uyr.js"></script>
<script type="text/javascript"><![CDATA[try{Typekit.load();}catch(e){}]]></script>

<style type="text/css">
<![CDATA[
h1 {
    font-family: "calluna",serif;
    font-style: normal;
    font-weight: 400; 
}

.pure-form button {margin:0 0 0 1em;}
.title-heading {margin-top:0;}

.content {
    margin: 0 auto;
    padding: 0 2em;
    max-width: 1000px;
    margin-bottom: 50px;
}

]]>
</style>

</head>
<body>
<div class="pure-menu pure-menu-open pure-menu-horizontal">
    <ul>
        <li class="pure-menu-selected"><a href="#">Home</a></li>
        <li><a href="#">Create Concept</a></li>
        <li><a href="#">Logout</a></li>
     </ul>
</div>

<div class="content">
    <div class="pure-g-r">
        <div class="pure-u-1-2">
            <h1 class="title-heading"><abbr title="Simple Knowledge Organization System">SKOS</abbr> Editor : Home</h1>
        </div>
        <div class="pure-u-1-2">
            <form class="pure-form">
                <fieldset>
                    <input type="text" class="pure-input-rounded" placeholder="Search Term"/>
        
                    <button type="submit" class="pure-button">
                        <i class="icon-search">&nbsp;</i> Search
                    </button>
                </fieldset>
            </form>
        </div>
    </div>    
    
    <div class="pure-g-r">
        <div class="pure-u-1">
        
         {element p {"A total of ", element strong {fn:count( cts:triples() )}, " triples currently in the database"}}
         <p>{$total}</p>
        {html-view:dynamic-table(("#", "Concept Name", "Added", "Added by", "Last Modified", "Modified by", "Top Level", "Update Concept"), $pg, $total)}
        </div>
    </div>
</div>
</body>
</html>))