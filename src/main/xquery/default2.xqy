xquery version "1.0-ml";
(: <link rel="stylesheet" href="/css/pure-min.css" /> :)
(xdmp:set-response-content-type("text/html"), xdmp:set-response-encoding("utf-8"), (
"<!DOCTYPE html>",
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta charset="utf-8" />
    <title>ML-SKOS : Test Layout</title>
    
<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.3.0/pure-min.css" />
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" />


<style type="text/css">
<![CDATA[
.header h1 {
    font-size: 3em;
    font-weight: 300;
    margin: 0.2em 0;
}
.header h1 {font-family: "omnes-pro",sans-serif;}
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

<div class="pure-u-1" id="main">
    <div class="content">

        <div class="header">
            <h1>SKOS Editor : Home</h1>
        </div>
    
        <form class="pure-form">
            <fieldset>
                <input type="text" class="pure-input-rounded" placeholder="Search Term"/>
    
                <button type="submit" class="pure-button">
                    <i class="icon-search">&nbsp;</i> Search
                </button>
            </fieldset>
        </form>


        <table class="pure-table pure-table-striped">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Make</th>
                    <th>Model</th>
                    <th>Year</th>
                </tr>
            </thead>
        
            <tbody>
               <tr>
                    <td>1</td>
                    <td>Honda</td>
                    <td>Accord</td>
                    <td>2009</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Toyota</td>
                    <td>Camry</td>
                    <td>2012</td>
                </tr>
            </tbody>
        </table>   

    </div>
</div>
</body>
</html>))