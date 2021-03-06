xquery version "1.0-ml";

(: Concept Heirarchy - V2 :)

import module namespace global = "http://www.xmlmachines.com/global" at "/xquery/lib/global.xqy"; 
import module namespace common = "http://www.xmlmachines.com/common" at "/xquery/lib/common.xqy";

declare namespace skos="http://www.w3.org/2004/02/skos/core#";

declare variable $q as xs:string := xdmp:get-request-field("id");
declare variable $doc := common:get-doc-content($q);
declare variable $pref-label := $doc//skos:prefLabel/text();
declare variable $title as xs:string := concat("Viewing Concept Heirarchy for '", $pref-label, "'");

declare function local:heirarchy(){
    <div id="heirarchy">
        <div class="span-24 last">
            <h2>{$pref-label}</h2>
            <p>{common:create-href($doc//skos:mappingRelation, ())}</p>
            <p>{$doc//skos:description}</p>
            <div>{$doc//skos:note}</div>
            <hr />
        </div>
     
        <div class="span-12">
            <h3>Has the following broader concepts:</h3>
            {common:seq-to-list($doc//skos:broader/text())}
            <h3>Other docs listing this concept as a broader include:</h3>
            {common:seq-to-links(//skos:Concept[skos:broader/text()=$pref-label]//skos:prefLabel)}
        </div>
        
        <div class="span-12 last">
            <h3>Has the following narrower concepts:</h3>
            {common:seq-to-list($doc//skos:narrower/text())}
            <h3>Other docs listing this concept as a narrower include:</h3>
            {common:seq-to-links(//skos:Concept[skos:narrower/text()=$pref-label]//skos:prefLabel)}
        </div>
        
        <hr />
        
        <div class="span-12">
            <h3>Has the following related concepts:</h3>
            {common:seq-to-list($doc//skos:related/text())}
            <h3>Other docs listing this concept as a related include:</h3>
            {common:seq-to-links(//skos:Concept[skos:related/text()=$pref-label]//skos:prefLabel)}
        </div>
        
        <div class="span-12 last">
            <h3>May alternatively be known as:</h3>
            {common:seq-to-list($doc//skos:altLabel/text())}
        </div>
        
        <hr />
        {if ($global:DEBUG eq "yes")
        then (
        <div class="span-24 last">
            <textarea>{$doc}</textarea>
        </div>)
        else ()
        }
    </div>
};

common:build-page(
    element div {attribute class {"container"},
        common:html-page-header($title),
        if (xdmp:get-current-user() eq "nobody")
        then (common:login-form())
        else (
            local:heirarchy(),
            common:html-page-footer()
        )
    }
)
