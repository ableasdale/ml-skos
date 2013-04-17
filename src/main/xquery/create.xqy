xquery version "1.0-ml";

import module namespace global = "http://www.xmlmachines.com/global" at "/xquery/lib/global.xqy"; 
import module namespace xforms = "http://www.xmlmachines.com/xforms" at "/xquery/lib/xforms.xqy";
import module namespace xforms-skos = "http://www.xmlmachines.com/xforms-skos" at "/xquery/lib/xforms-skos.xqy"; 
 
declare option xdmp:output "method=xhtml"; 
declare option xdmp:output "doctype-public=-//W3C//DTD XHTML 1.0 Strict//EN"; 
declare option xdmp:output "doctype-system=http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd";
declare option xdmp:output "omit-xml-declaration=yes";
declare option xdmp:output "indent=yes"; 

declare variable $title := "SKOS Concept Editor";
(: <!DOCTYPE html SYSTEM "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 

1/2/2013: The blank "_" namespace axis have been added to circumvent a known bug which prevents Firefox from working with instance data containing namespaces 
(See https://bugzilla.mozilla.org/show_bug.cgi?id=94270 for more details)
:)

xdmp:set-response-content-type("application/xml"),
xforms:xsltforms-pis(),
<xhtml:html
    skos:_="_"
    
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
        <xhtml:link rel="stylesheet" href="/css/blueprint-xf.css" type="text/css" media="screen, projection" />
        {xforms-skos:base-model()} 
    </xhtml:head>
    <xhtml:body>
    <xhtml:div class="container">
        <xhtml:div class="span-24 last">
        {global:nav($title),
            xforms:xhtml-fieldset-and-legend("Concept", 
                (
                xforms:para-with-xf-input((), "skos:prefLabel", "span-12", "Preferred Label: "),
                (: Alternative Label repeatset :)
                xforms:xhtml-fieldset-and-legend("Alternative Labels", 
                    (xforms:xf-repeat("skos:altLabel", "altlabel-repeat", xforms:para-with-xf-input((), ".", "span-12", "Alternative Label: ")),
                        xforms:xhtml-fieldset-and-legend("Add / Remove Alternative Label",
                            (xforms:xf-add-trigger("add-alt-label", "Add Alternative Label", "skos:altLabel"),
                            xforms:xf-delete-trigger("delete-alt-label", "Delete Selected Alternative Label", "skos:altLabel", "index('altlabel-repeat')"),
                            xforms:debug(xforms:xf-output("index('altlabel-repeat')",  "[Debug]: Selected row ")))
                        )
                    )
                ),
                (: Hidden Label repeatset :)
                xforms:xhtml-fieldset-and-legend("Hidden Labels", 
                    (xforms:xf-repeat("skos:hiddenLabel", "hiddenlabel-repeat", xforms:para-with-xf-input((), ".", "span-12", "Hidden Label: ")),
                        xforms:xhtml-fieldset-and-legend("Add / Remove Hidden Label",
                            (xforms:xf-add-trigger("add-hidden-label", "Add Hidden Label", "skos:hiddenLabel"),
                            xforms:xf-delete-trigger("delete-hidden-label", "Delete Selected Hidden Label", "skos:hiddenLabel", "index('hiddenlabel-repeat')"),
                            xforms:debug(xforms:xf-output("index('hiddenlabel-repeat')",  "[Debug]: Selected row ")))
                        )
                    )
                )
            )
        )}
        
        
            <xf:submit submission="save">
                <xf:label>Save Concept</xf:label>
            </xf:submit>
            <xf:switch>
                <xf:case id="ready">
                    <p>Ready ...</p>
                    <xf:message level="modal" ev:event="DOMActivate">Ready!</xf:message>
                </xf:case>
                <xf:case id="case-busy">
                    <p>Waiting for results from server ...</p>
                </xf:case>
                <xf:case id="case-submit-error">
                    <p>Submit error</p>
                </xf:case>
                <xf:case id="case-submit-done">
                    <!-- TODO - are modal messages supported in XSLTForms? and can xf:output return xhtml?  the response from MarkLogic is.. -->
                    <xf:message level="modal" ev:event="DOMActivate">Saved</xf:message>
                    <xhtml:p><xf:output value="instance('submit-results')">
                    <xf:label>Output: </xf:label>
                    </xf:output></xhtml:p>
                </xf:case>
            </xf:switch>
        
        
            </xhtml:div>
        </xhtml:div>
    </xhtml:body>
</xhtml:html>
 