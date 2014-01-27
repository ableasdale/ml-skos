xquery version "1.0-ml";

module namespace html-view="http://www.xmlmachines.com/html-view";

import module namespace global = "http://www.xmlmachines.com/global" at "/xquery/lib/global.xqy";

declare default element namespace "http://www.w3.org/1999/xhtml";
declare default function namespace "http://www.w3.org/2005/xpath-functions";


declare function html-view:dynamic-table($ths as xs:string+, $pg as xs:integer, $total as xs:integer) as element(div) {
<div>
    <table class="pure-table pure-table-striped" id="recent-concepts-table">
        <thead>
            <tr>{for $i in $ths return element th {$i}}</tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="6">LOADING</td>
            </tr>
        </tbody>
    </table>
    {html-view:pagination-widget($pg, $total)}
</div>
};


declare function html-view:pagination-widget($pg as xs:integer, $total as xs:integer) as element(div) {
<div>
    <p><ul class="pure-paginator">
        <li><a class="pure-button prev" href="#">&#171;</a></li>
        {
        for $x in (1 to $global:PAGINATION-LISTSIZE) return
        <li><a class="pure-button{if($x eq $pg) then(" pure-button-active") else()}" href="#">{$x}</a></li>
        }
        
        <li><a class="pure-button next" href="#">&#187;</a></li>
    </ul></p>
    <ul>
        <li>CURRPAGE: {$pg}</li>
        <li>TOTAL: {$total}</li>
        <li>TOTAL/PAGE SIZE: {fn:ceiling($total div $global:PAGE-SIZE)}</li>
    </ul>
</div>
};
 
 (:
 
 
 
 <li><a class="pure-button pure-button-active" href="#">1</a></li>
        <li><a class="pure-button" href="#">2</a></li>
        <li><a class="pure-button" href="#">3</a></li>
        <li><a class="pure-button" href="#">4</a></li>
        <li><a class="pure-button" href="#">5</a></li>
        
 :)