xquery version "1.0-ml";

import module namespace xforms = "http://www.xmlmachines.com/xforms" at "/xquery/lib/xforms.xqy";
import module namespace xforms-skos = "http://www.xmlmachines.com/xforms-skos" at "/xquery/lib/xforms-skos.xqy"; 
 
declare option xdmp:output "method=xhtml"; 
declare option xdmp:output "doctype-public=-//W3C//DTD XHTML 1.0 Transitional//EN"; 
declare option xdmp:output "doctype-system=http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd";
declare option xdmp:output "omit-xml-declaration=yes";
declare option xdmp:output "indent=yes"; 

xdmp:set-response-content-type("application/xml"),
xforms:xsltforms-pis(),
<xhtml:html
    xmlns="http://www.w3.org/1999/xhtml" 
    xmlns:xf="http://www.w3.org/2002/xforms"      
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"  
    xmlns:xhtml="http://www.w3.org/1999/xhtml" 
    xmlns:ev="http://www.w3.org/2001/xml-events" 
    xmlns:xsltforms="http://www.agencexml.com/xsltforms"
    xmlns:rte="http://www.agencexml.com/xsltforms/rte"    
    xmlns:xi="http://www.w3.org/2001/XInclude" 
    
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    
    lang="en">
    <xhtml:head>
        <xhtml:title>SKOS Concept Editor</xhtml:title>
        <xhtml:script type="text/javascript" src="/xsltforms/scripts/tinymce_3.4.6/tiny_mce.js">/* */</xhtml:script>
        <!-- xhtml:link rel="stylesheet" href="/css/blueprint.css" type="text/css" media="screen, projection"/ -->
        {xforms-skos:base-model()} 
    </xhtml:head>
    <xhtml:body>
    <xhtml:div class="container">
        <h1>SKOS Concept Editor</h1>
        {
            xforms:xhtml-fieldset-and-legend("Concept", 
                (
                xforms:para-with-xf-input((), "skos:prefLabel", "span-12", "Preferred Label: "),
                
                element xf:repeat {
                    attribute nodeset {"skos:altLabel"}, 
                    attribute id {"altlabel-repeatset"},
                        xforms:para-with-xf-input((), ".", "span-12", "Alt Label: ")
                }
                
                )
            )
        }
         
        <!-- xf:submit submission="save">
            <xf:label>Save doc now</xf:label>
        </xf:submit>
        <xf:switch>
            <xf:case id="ready">
                <xf:message id="hai" level="modal" ev:event="DOMActivate">Ready!</xf:message>
            </xf:case>
            <xf:case id="case-busy">
                <p>Waiting for results from server...</p>
            </xf:case>
            <xf:case id="case-submit-error">
                <p>Submit error</p>
            </xf:case>
            <xf:case id="case-submit-done">
                <p><xf:output value="instance('submit-results')">
                <xf:label>Output: </xf:label>
            </xf:output></p>
            
            </xf:case>
        </xf:switch -->
        
        </xhtml:div>
    </xhtml:body>
</xhtml:html>
